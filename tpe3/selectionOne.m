function ret= selectionOne(poblation,fit)
	i = 1;
	pm = 0.01;
	while(i<=length(poblation))
		selected = ruleta(2,fit);
		% childs = onePointCross(poblation(selected(1)),poblation(selected(2)));
		% childs = twoPointCross(poblation(selected(1)), poblation(selected(2)));
		childs = anularCross(poblation(selected(1)), poblation(selected(2)));
		newPoblation(i).w1 = childs(1).w1;
		newPoblation(i).w2 = childs(1).w2;
		% newPoblation(i).w1
		newPoblation(i) = mutateLineal(newPoblation(i),pm,0.5);
		% newPoblation(i).w1
		newPoblation(i+1).w1 = childs(2).w1;
		newPoblation(i+1).w2 = childs(2).w2;
		newPoblation(i+1) = mutateLineal(newPoblation(i),pm,0.5);
		i = i + 2;
	end
	ret = newPoblation;
end