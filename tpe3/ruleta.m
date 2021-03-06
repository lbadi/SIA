function ret = ruleta(k,poblation, c)
	randoms = sort(rand(1,k));
	if(isfield(c,"alternative_fitness"))
		fit = c.alternative_fitness;
	else
		fit = relativeFitness(poblation);
	end
	acum = 0;
	j = 1;
	for i=1:length(fit)
		acumFit(i) = fit(i) + acum;
		% Agrego este indice tantas veces como numeros randoms que sean menores.
		% Cuanto mas agrego de una, mas diversidad se pierde
		while((j <= length(randoms)) && randoms(j) < acumFit(i))
			selected(j) = poblation(i);
			j++;
		end
		acum += fit(i);
	end
	ret = selected;

end