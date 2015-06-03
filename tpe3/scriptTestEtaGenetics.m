function scriptTestEtaGenetics(filename)
% graphEtaTest(0.01,0.1,0.01,0.05,0.2,0.05,'etaPocasIteraciones')

	%Estos parametros sirven si se quieren probar las variaciones de los parametros de eta
	incstart = 0.01;
	incend = 0.1;
	incstep = 0.01;
	decstart = 0.05
	decend = 0.2;
	decstep = 0.05;
	inc = incstart:incstep:incend;
	dec = decstart:decstep:decend;

	p = loadParameters('mperceptron');
	p.iterations = 2;
	
	filename = ["data/" filename];
	file_id = fopen(filename, 'a+');

	totalits = length(0.05:0.05:0.4);
	it = 1;
	for eta=0.05:0.05:0.4
		p.eta = eta;
		% for i=incstart:incstep:incend
			% p.etainc = i;
			% for j=decstart:decstep:decend
				% p.etadec = j;
				printf("Paso %d de %d\n",it,totalits);
				c=p;
				save('config/testingEta/mperceptron.cfg','c');
				result = genetico();

				fprintf(file_id,"eta=%f,Fitness=%f,totalFitness=%f,iterations=%f,iterationsValues=%f;%f;%f;%f;%f;%f;%f;%f;%f;%f;,reason=%s\n",eta,result.fitness,result.totalFitness,result.iterations,result.fitnessThroughIterations(1),result.fitnessThroughIterations(2),result.fitnessThroughIterations(3),result.fitnessThroughIterations(4),result.fitnessThroughIterations(5),result.fitnessThroughIterations(6),result.fitnessThroughIterations(7),result.fitnessThroughIterations(8),result.fitnessThroughIterations(9),result.fitnessThroughIterations(10),result.reason);
				fflush(file_id);
				it++;
			% end
		% end
	end
	fclose(file_id);
	system('beep');
end
%EJ: graphEtaTest(0.01,0.1,0.01,0.1,0.5,0.1,"data.txt")