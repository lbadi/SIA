function scriptTestUniCross(filename)
% graphEtaTest(0.01,0.1,0.01,0.05,0.2,0.05,'etaPocasIteraciones')

	%Estos parametros sirven si se quieren probar las variaciones de los parametros de eta
	c = loadParameters('crossover');
	filename = ["data/" filename];
	file_id = fopen(filename, 'a+');
	pvalues = 0.3:0.1:0.7;
	totalits = length(pvalues);
	it = 1;
	for unip = pvalues
		c.unip = unip;		
		printf("Paso %d de %d\n\n",it,totalits);
		save('config/testingUniCross/crossover.cfg','c');
		result = genetico();
		fprintf(file_id,"unip=%f,Fitness=%f,totalFitness=%f,reason=%s\n",unip,result.fitness,result.totalFitness,result.reason);
		fflush(file_id);
		it++;
	end
	fclose(file_id);
	system('beep');
end
%EJ: graphEtaTest(0.01,0.1,0.01,0.1,0.5,0.1,"data.txt")