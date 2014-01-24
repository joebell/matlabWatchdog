function startWatchdog(useTimer)

	global WDT;

	WDT.useTimer = useTimer;

	if useTimer
		WDT.timer = timer('ExecutionMode','fixedRate','Period',60,'TimerFcn', @watchdogTimerReset);
		start(WDT.timer);
		disp('Timer driven Software Watchdog resets started.');
	end

	unix('touch ~/Desktop/Code/matlabWatchdog/.watchdogFile');
	unix('crontab ~/Desktop/Code/matlabWatchdog/watchdogCron');

	disp('Software Watchdog started.');




function watchdogTimerReset(obj, event)

	resetWatchdogTimer();

	
