function ret = fitness(poblation,p)
	fitness = zeros(1,length(poblation));
	% Calculo el fitness para cada elemento
	for i=1:length(poblation)
		w_1 = poblation(i).w1;
		w_2 = poblation(i).w2;
		p.eta = poblation(i).eta;
		if(p.useBackPropagation)
			w = mperceptron(w_1,w_2,p);
			poblation(i).w1 = w{1};
			poblation(i).w2 = w{2};
			poblation(i).fitness = 1/w{7};
			poblation(i).eta = w{6};
		else
			poblation(i).fitness = 1/calculateError(poblation(i).w1,poblation(i).w2);
		end
	end
	
	ret = poblation;
end