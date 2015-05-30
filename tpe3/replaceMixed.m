function ret = replaceMixed(poblation,selectMethod,crossOver,mutation,pm,selectMethodForReplace,k,secondSelectMethodForReplace,numbersOfSelectedWithFirstMethod,iterations)

	randoms = randperm(k);
	% Selecciono
	%aca hago el load
	c.iterations = iterations;
	selected = selectMethod(k,poblation,c);
	i=1;
	% Cruzo
	while(i < length(selected))
		childs = crossOver(selected(randoms(i)),selected(randoms(i+1)));
		child(i) = childs(1);
		child(i+1) = childs(2);

		child(i) = mutation(child(i),pm,0.5,iterations,1);
		child(i+1) = mutation(child(i+1),pm,0.5,iterations,1);
		i = i + 2;
	end
	% Calculo el fitness a los nuevos
	child = fitness(child);
	% Los nuevos van directo
	newPoblation(1:k) = child;
	% Los viejos los selecciono.
	newPoblation(k+1:k+numbersOfSelectedWithFirstMethod) = selectMethodForReplace(numbersOfSelectedWithFirstMethod,poblation);
	newPoblation(k+numbersOfSelectedWithFirstMethod+1:length(poblation)) = selectMethodForReplace(length(poblation) - k - numbersOfSelectedWithFirstMethod,poblation);
	ret = newPoblation;
end