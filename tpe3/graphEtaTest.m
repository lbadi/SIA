function graphEtaTest(incstart,incend,incstep,decstart,decend,decstep,filename)
% graphEtaTest(0.01,0.1,0.01,0.05,0.2,0.05,'etaPocasIteraciones')
	p = loadParameters('mperceptron');
	neurons = p.hidenN;
	iterations = 4;
	filename = ["data/" filename];
	file_id = fopen(filename, 'a+');
	inc = incstart:incstep:incend;
	dec = decstart:decstep:decend;
	totalits = length(inc)*length(dec)*2;
	it = 1;
	for eta=0.05:0.05:0.1
		p.eta = eta;
		for i=incstart:incstep:incend
			p.etainc = i;
			for j=decstart:decstep:decend
				p.etadec = j;
				printf("Resolviendo para eta=%f etainc=%f etadec=%f iteraciones=%d. Etapa %d de %d\n",eta,i,j,iterations,it,totalits);
				fflush(stdout);
				w1 = mperceptron(0,0,p);
				printf("Error 1:%f \n",w1{3});
				fflush(stdout);
				w2 = mperceptron(0,0,p);
				printf("Error 2:%f \n",w2{3});
				fflush(stdout);
				w3 = mperceptron(0,0,p);
				printf("Error 3:%f \n",w3{3});
				fflush(stdout);
				w4 = mperceptron(0,0,p);
				printf("Error 4:%f \n",w4{3});
				fflush(stdout);
				printf("Errores %f %f %f %f\n",w1{3},w2{3},w3{3},w4{3});
				sumerror = [w1{3},w2{3},w3{3},w4{3}];
				avgerror = mean(sumerror);
				etaincs = mean([w1{4},w2{4},w3{4},w4{4}]);
				etadecs = mean([w1{5},w2{5},w3{5},w4{5}]);
				fprintf(file_id,"eta=%f,etainc=%f,etadec=%f,etaincs=%f,etadecs=%f,its=%d,error=%f,\n",eta,i,j,etaincs,etadecs,iterations,avgerror);
				fflush(file_id);
				it++;
			end
		end
	end
	fclose(file_id);
	system('beep');
end
%EJ: graphEtaTest(0.01,0.1,0.01,0.1,0.5,0.1,"data.txt")