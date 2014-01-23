
touch -d '-1 minute' ~/Desktop/Code/matlabWatchdog/.oneMinAgo
if [ ~/Desktop/Code/matlabWatchdog/.oneMinAgo -nt ~/Desktop/Code/matlabWatchdog/.watchdogFile ]; then
	echo "--- Watchdog Not Updated! ---"
	pkill MATLAB
	pkill matlab_helper
	pkill java
	echo "--- MATLAB Processes Killed ---"
	# Run DAQ Reset
	~/Desktop/Code/matlabWatchdog/resetDev1
	crontab -r
	echo "--- Watchdog cron job Removed ---"
	now=$(date)
	date | mail -s "RTFW Software Watchdog Tripped" 6178218253@vtext.com
	echo "--- Sent text message notification ---"
fi

