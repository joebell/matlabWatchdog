
/bin/touch -d '-1 minute' /home/joe/Desktop/Code/matlabWatchdog/.oneMinAgo
if [ /home/joe/Desktop/Code/matlabWatchdog/.oneMinAgo -nt /home/joe/Desktop/Code/matlabWatchdog/.watchdogFile ]; then
	/bin/echo "--- Watchdog Not Updated! ---"
	/usr/bin/pkill MATLAB
	/usr/bin/pkill matlab_helper
	/usr/bin/pkill java
	/bin/echo "--- MATLAB Processes Killed ---"
	# Run DAQ Reset
	/home/joe/Desktop/Code/matlabWatchdog/resetDev1
	/usr/bin/crontab -r
	/bin/echo "--- Watchdog cron job Removed ---"
	now=$(date)
	/bin/echo "RTFW Software Watchdog Tripped: $now" | /bin/mail -r "rtfw.computer@gmail.com" 6178218253@vtext.com
	/bin/echo "RTFW Software Watchdog Tripped: $now" | /bin/mail -s "RTFW Software Watchdog" -r "rtfw.computer@gmail.com" joe.bell@gmail.com
	/bin/echo "--- Sent Email and Text message notification ---"
fi

