function ret = replaceTwo(poblation,selectMethod,crossOver,mutation,pm,selectMethodForReplace,k)

	randoms = randperm(k);
	% Selecciono
	selected = selectMethod(k,poblation)
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
	% Los nuevos van directo
	newPoblation(1:k) = child;
	% Los viejos los selecciono.
	newPoblation(k+1:length(poblation)) = selectMethodForReplace(length(poblation) - k,poblation);
	ret = newPoblation;
end