#!/bin/bash

writeout() {
	# credit for awk magic goes to
	# http://stackoverflow.com/questions/6166375/median-of-column-with-awk
	median=$(sort -n $file | awk ' { a[i++]=$1; } END { x=int((i+1)/2); if (x < (i+1)/2) print (a[x-1]+a[x])/2; else print a[x-1]; }')
	mean=$(awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' $file)
	min=$(sort -n $file | head -n1)
	max=$(sort -n $file | tail -n1)

	echo
	echo "All values in MHz except count which is just the number of measurements..."
	echo "median : $median"
	echo "mean   : $mean"
	echo "max    : $max"
	echo "min    : $min"
	echo "count  : $(wc -l $file|awk '{print $1}')"

	echo
	here=$(pwd)
	script="make_me_a_histogram"

cat > "$here/$script" << EOF
#!/usr/bin/gnuplot
set terminal png
set output "hist.png"
set boxwidth 50
set style fill solid
set style histogram 
set style data histogram
bw=1
set xlabel "CPU frequency in MHz"
set ylabel "Counts"
bin(x,width)=width*floor(x/width) + bw/1.0
plot "$file" using (bin(\$1,bw)):(2.0) smooth freq with boxes
EOF

echo "Wrote $here/$script which you can run to have gnuplot"
echo "make a histogram with these data."
chmod +x "$here/$script"
}

# check deps
command -v awk >/dev/null 2>&1 || {
echo " I require awk but it's not installed. Aborting!" >&2; exit 1; }

command -v bc >/dev/null 2>&1 || {
echo " I require bc but it's not installed. Aborting!" >&2; exit 1; }

if [[ -z "$1" ]]; then
	echo "Usage: $0 arg1"
	echo
	echo "   arg1 can be an integer representing the number of seconds to watch"
	echo "   the CPU frequency (recommend 120 or more) or it can be a path to"
	echo "   a lot file already generated."
	exit 1
elif [[ -f "$1" ]]; then
	# just process an existing file
	file="$1"
	writeout
	exit 0
else
	DTS=$(date +"%Y%m%d-%H%M%S")

	# make sure $1 is an integer
	[[ "$1" =~ ^-?[0-9]+$ ]] || {
	echo " Supply an integer and try again." >&2; exit 1; }

	[[ -d $XDG_RUNTIME_DIR ]] && 
	file=$XDG_RUNTIME_DIR/"stats-$DTS" || file=/tmp/"stats-$DTS"

	[[ -f /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq ]] || {
	echo " Cannot tell what the CPU current CPU frequency is. Aborting!" >&2; exit1; }

	echo "Collecting data for $1 seconds..."
	TIME=( $(seq 1 1 "$1") )

	for i in "${TIME[@]}"; do
		sleep 1
		bc <<< "scale=1; $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)/1000" >> "$file"
	done
fi
