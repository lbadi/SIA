function ret = startGenetico()
	load('config/genetico.cfg');
	ret = genetico(gn,ghidenN,gk,giterations,fitnessWish,timeToMakeProgress);
end