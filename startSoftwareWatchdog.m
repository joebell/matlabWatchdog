function softwareWatchdog = startSoftwareWatchdog(useTimer)

	global softwareWatchdog;

	softwareWatchdog.useTimer = useTimer;

	if useTimer
		softwareWatchdog.timer = timer('ExecutionMode','fixedRate','Period',60,'TimerFcn', @watchdogTimerReset);
		start(softwareWatchdog.timer);
		disp('Timer driven Software Watchdog resets started.');
	end

	unix('touch ~/Desktop/Code/matlabWatchdog/.watchdogFile');
	unix('crontab ~/Desktop/Code/matlabWatchdog/watchdogCron');

	disp('Software Watchdog started.');




function watchdogTimerReset(obj, event)

	resetSoftwareWatchdogTimer();

	
