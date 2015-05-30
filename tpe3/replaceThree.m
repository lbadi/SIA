function ret = replaceThree(poblation,k,sm,co,m,sr,p)

	randoms = randperm(k);

	% Selecciono
	selected = sm.selectMethod(k,poblation,sm);
	i=1;
	% Cruzo
	while(i < length(selected))
		childs = co.crossOver(selected(randoms(i)),selected(randoms(i+1)),co);
		child(i) = childs(1);
		child(i+1) = childs(2);

		child(i) = m.mutation(child(i),m);
		child(i+1) = m.mutation(child(i+1),m);
		i = i + 2;
	end
	% Calculo el fitness a los nuevos
	child = fitness(child,p);
	% Selecciono de la poblacion t + los nuevos.
	newPoblation(1:length(poblation)) = sr.selectMethod(length(poblation),[poblation child],sr);
	ret = newPoblation;
end