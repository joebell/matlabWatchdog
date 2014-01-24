function stopWatchdog()

	global WDT;

	unix('crontab -r');
	disp('Software Watchdog stopped.');

	if (WDT.useTimer)
		stop(WDT);
		delete(WDT);
		disp('Timer driven Software Watchdog resets stopped.');
	end

