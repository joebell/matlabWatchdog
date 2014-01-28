function stopWatchdog()

	global softwareWatchdog;

	unix('crontab -r');
	disp('Software Watchdog stopped.');

	if isfield(softwareWatchdog, 'useTimer')
		if (softwareWatchdog.useTimer)
			stop(softwareWatchdog.timer);
			delete(softwareWatchdog.timer);
			disp('Timer driven Software Watchdog resets stopped.');
		end
	end

