function scriptTestMutation(filename,mutation)
% graphEtaTest(0.01,0.1,0.01,0.05,0.2,0.05,'etaPocasIteraciones')

	%Estos parametros sirven si se quieren probar las variaciones de los parametros de eta
	c = loadParameters('mutation');
	filename = ["data/" filename];
	file_id = fopen(filename, 'a+');
	mpvalues = 0:0.05:0.2;
	msvalues = 0.1:0.1:0.4;
	totalits = length(mpvalues)*length(msvalues)*2;
	it = 1;
	if(mutation == @mutateNoLineal)
		fun = 'mutateNoLineal';
	end
	if(mutation == @mutateLineal)
		fun = 'mutateLineal';
	end
	if(mutation == @mutateLinealM)
		fun = 'mutateLinealM';
	end
	c.mutation = mutation;
	for mp = mpvalues
		c.mutateProbability = mp;
		for ms = msvalues
			c.mutateStrength = ms;		
			printf("Paso %d de %d\n\n",it,totalits);
			save('config/testingMutation/mutation.cfg','c');
			result = genetico();
			fprintf(file_id,"fun=%s,mutateProbability=%f,mutateStrength=%f,Fitness=%f,TotalFitness=%f,reason=%s\n",fun,mp,ms,result.fitness,result.totalFitness,result.reason);
			fflush(file_id);
			it++;
		end
	end
	fclose(file_id);
	system('beep');
end