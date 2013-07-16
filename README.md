## ~/bin/pub
The following scripts have been referenced in publications and are freely available for public use.

<table>
<tr>
<th>File</th><th>Description</th><th>Reference</th>
</tr>
<tr>
<td>[bench](https://github.com/graysky2/bin/blob/master/bench)</td><td>Runs gcc, ffmpeg, and lrzip stressing and benchmarking.</td><td>[cpu schedulers compared](http://repo-ck.com/bench/cpu_schedulers_compared.pdf)</td>
</tr>
<tr>
<td>[cpuz](https://github.com/graysky2/bin/blob/master/cpuz)</td><td>Script to harvest temp, voltage, and fan speed data.</td><td>[IvyBridge 3770K IHS Removal and Results](http://www.silentpcreview.com/IvyBridge_3770K_IHS_removal_and_results)</td>
</tr>
<tr>
<td>[make_bench](https://github.com/graysky2/bin/blob/master/make_bench)</td><td>Script used to contrast different kernels on the basis of a the time to make bzImage of a predefined kernel source.</td><td>[-ck hacking](http://ck-hack.blogspot.com)</td>
</tr>

</tr>
<tr>
<td></td><td></td><td></td>
</tr>
<tr>
<td>[arris_signals](https://github.com/graysky2/bin/blob/master/arris_signals)</td><td>Simple shell script that conencts to an Arris modem and logs the upstream/downstream SNRs and power levels to a csv.</td><td></td>
<tr>
<td>[generic](https://github.com/graysky2/bin/blob/master/generic)</td><td>Wrapper script for makepkg that will build target PKG for both arches and sync to/from a local repo. Must have a configured and functional 32-bit chroot. See Arch Wiki page for 'schroot' for more info.</td><td></td>
</tr>
<tr>
<td>[pacman-disowned](https://github.com/graysky2/bin/blob/master/pacman-disowned)</td><td>Scan root filesystem for system files and reports which (if any) are now owned by a specific package you have installed.</td><td></td>
</tr>
<tr>
<td>[pretty](https://github.com/graysky2/bin/blob/master/pretty)</td><td>Just an excerpt from various Arch Linux rc.functions to make scripts prettier.</td><td></td>
</tr>
<tr>
<td>[sums](https://github.com/graysky2/bin/blob/master/sums)</td><td>Run this in a directory containing a PKGBUILD to update the checksums. Useful on version bumps. Avoids the need to run `makepkg -g >>PKGBUILD` and then manually relocate the checksum array.</td><td></td>
</tr>

