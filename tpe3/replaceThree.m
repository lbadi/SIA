function ret = replaceThree(poblation,selectMethod,crossOver,mutation,pm,selectMethodForReplace,k)

	randoms = randperm(k);
	% Selecciono
	selected = selectMethod(k,poblation);
	i=1;
	% Cruzo
	while(i < length(selected))
		childs = crossOver(selected(randoms(i)),selected(randoms(i+1)));
		child(i) = childs(1);
		child(i+1) = childs(2);

		child(i) = mutation(child(i),pm,0.5);
		child(i+1) = mutation(child(i+1),pm,0.5);
		i = i + 2;
	end
	% Calculo el fitness a los nuevos
	child = fitness(child);
	% Selecciono de la poblacion t + los nuevos.
	newPoblation(1:length(poblation)) = selectMethodForReplace(length(poblation),[poblation child]);
	ret = newPoblation;
end