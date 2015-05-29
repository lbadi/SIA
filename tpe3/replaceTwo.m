function ret = replaceTwo(poblation,fit,selectMethod,selectMethodForReplace,k,crossOver,m)

	randoms = randperm(length(selected));
	selected = selectMethod(k,fit);
	for i=1:2:length(selected)-2
		childs = crossOver(poblation(randoms(i)),poblation(randoms(i+1)));
		child(i) = childs(1);
		child(i+1) = childs(2);

		child(i) = mutateLineal(child(i),pm,0.5);
		child(i+1) = mutateLineal(child(i+1),pm,0.5);

		mutate 
	end

	child = fitness(child);
	fit = relativeFitness(poblation);
	newPoblation(1:k) = child;
	selected = selectMethodForReplace();
	newPoblation(k+1:length(poblation)) = selectMethodForReplace(k,fit)

end