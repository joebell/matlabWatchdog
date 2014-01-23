
touch -d '-1 minute' ~/.oneMinAgo
if [ ~/Desktop/Code/matlabWatchdog/.oneMinAgo -nt ~/Desktop/Code/matlabWatchdog/.watchdogFile ]; then
	echo "--- Watchdog Not Updated! ---"
	pkill MATLAB
	pkill matlab_helper
	pkill java
	echo "--- MATLAB Processes Killed ---"
	# Run DAQ Reset
	resetDev1
else
fi

