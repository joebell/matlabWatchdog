function startWatchdog()

	global WDT;

	WDT = timer('ExecutionMode','fixedRate','Period',60,'TimerFcn', @watchdogTimerReset);
	start(WDT);

	unix('touch ~/Desktop/Code/matlabWatchdog/.watchdogFile');

	unix('crontab ~/Desktop/Code/matlabWatchdog/watchdogCron');



function watchdogTimerReset(obj, event)

	unix('touch ~/Desktop/Code/matlabWatchdog/.watchdogFile');


	
