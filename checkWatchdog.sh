
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
	echo "RTFW Software Watchdog Tripped: $now" | mail -r "rtfw.computer@gmail.com" 6178218253@vtext.com
	echo "RTFW Software Watchdog Tripped: $now" | mail -s "RTFW Software Watchdog" -r "rtfw.computer@gmail.com" joe.bell@gmail.com
	echo "--- Sent Email and Text message notification ---"
fi

