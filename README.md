##Scripts Used in Publications
The following scripts have been referenced in publications and are freely available for public use.

<table>
<tr>
<th>File</th><th>Description</th><th>Reference</th>
</tr>
<tr>
<td>bench</td><td>Runs gcc, ffmpeg, and lrzip stressing and benchmarking.</td><td>[cpu schedulers compared](http://repo-ck.com/bench/cpu_schedulers_compared.pdf)</td>
</tr>
<tr>
<td>cpuz</td><td>Script to harvest temp, voltage, and fan speed data.</td><td>[IvyBridge 3770K IHS Removal and Results](http://www.silentpcreview.com/IvyBridge_3770K_IHS_removal_and_results)</td>
</tr>
<tr>
<td>make bench</td><td>Script used to contrast different kernels on the basis of a the time to make bzImage of a predefined kernel source.</td><td>[-ck hacking](http://ck-hack.blogspot.com)</td>
</tr>

##Scripts Helpful to Arch Linux 
The following scripts are useful for Arch Linux systems.

<table>
<tr>
<th>File</th><th>Description</th>
</tr>
<tr>
<td>pacman-disowned</td><td>Scan root filesystem for system files and reports which (if any) are now owned by a specific package you have installed.</td>
</tr>
<tr>
<td>sums</td><td>Run this in a directory containing a PKGBUILD to update the checksums. Useful on version bumps. Avoids the need to run `makepkg -g >>PKGBUILD` and then manually relocate the checksum array.</td>
</tr>
