function ret = fitness(poblation)
	fitness = zeros(1,length(poblation));
	% Calculo el fitness para cada elemento
	for i=1:length(poblation)
		w_1 = poblation{i,1};
		w_2 = poblation{i,2};
		poblation{i,3} = 1/calculateError(w_1,w_2);
		fit(i) = poblation{i,3};
	end
	
	ret = poblation;
end