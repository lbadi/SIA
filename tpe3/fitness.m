function ret = fitness(poblation)
	fitness = zeros(1,length(poblation));
	% Calculo el fitness para cada elemento
	for i=1:length(poblation)
		w_1 = poblation(i).w1;
		w_2 = poblation(i).w2;
		% cd ../tpe2;
		% w = mperceptron(1,1,5,5,0.1,@activation,@activationD,0,0,0,0,0.9,0,0.02,0.1);
		% cd ../tpe3;
		% poblation(i).w1 = w{1};
		% poblation(i).w2 = w{2};
		poblation(i).fitness = 1/calculateError(w_1,w_2);
		fit(i) = poblation(i).fitness;
	end
	
	ret = poblation;
end