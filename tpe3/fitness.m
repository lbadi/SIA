function ret = fitness(poblation,p)
	fitness = zeros(1,length(poblation));
	% Calculo el fitness para cada elemento
	for i=1:length(poblation)
		w_1 = poblation(i).w1;
		w_2 = poblation(i).w2;
		if(p.useBackPropagation)
			w = mperceptron(w_1,w_2,p);
			poblation(i).w1 = w{1};
			poblation(i).w2 = w{2};
		end
		poblation(i).fitness = 1/calculateError(w_1,w_2);
		fit(i) = poblation(i).fitness;
	end
	
	ret = poblation;
end