function scriptTestElite(filename,fun)
% graphEtaTest(0.01,0.1,0.01,0.05,0.2,0.05,'etaPocasIteraciones')

	%Estos parametros sirven si se quieren probar las variaciones de los parametros de eta
	c = loadParameters('selection');
	filename = ["data/" filename];
	file_id = fopen(filename, 'a+');
	n1values = 0:0.05:0.25;
	
	totalits = length(n1values);
	it = 1;
	if(fun == @eliteruleta)
		fun = 'eliteruleta';
	end
	if(fun == @eliteuniversal)
		fun = 'eliteuniversal';
	end
	if(fun == @elitetorneos)
		fun = 'elitetorneos';
	end
	c.selectMethod = fun;

	for n1 = n1values
		c.n1 = n1;
		printf("Paso %d de %d\n\n",it,totalits);
		save('config/testingSelection/selection.cfg','c');
		result = genetico();
		fprintf(file_id,"fun=%s,n1=%f,Fitness=%f,TotalFitness=%f,reason=%s\n",fun,n1,result.fitness,result.totalFitness,result.reason);
		fflush(file_id);
		it++;
		
	end
	fclose(file_id);
	system('beep');
end
