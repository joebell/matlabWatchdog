function stopWatchdog()

	global WDT;

	unix('crontab -r');

	stop(WDT);
	delete(WDT);
