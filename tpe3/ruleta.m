function ret = ruleta(k,fit)
	randoms = sort(rand(1,k));
	acumFit = zeros(1,length(fit));
	acum = 0;
	j = 1;
	selected = zeros(1,k);
	for i=1:length(fit)
		acumFit(i) = fit(i) + acum;
		% Agrego este indice tantas veces como numeros randoms que sean menores.
		% Cuanto mas agrego de una, mas diversidad se pierde
		while((j <= length(randoms)) && randoms(j) < acumFit(i))
			selected(j) = i;
			j++;
		end
		acum += fit(i);
	end
	ret = selected;

end