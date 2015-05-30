function ret= replaceOne(poblation,k,sm,co,m,sr,p)
	i = 1;
	while(i<=length(poblation))
		selected = sm.selectMethod(2,poblation,sm);
		% childs = onePointCross(poblation(selected(1)),poblation(selected(2)));
		% childs = twoPointCross(poblation(selected(1)), poblation(selected(2)));
		% childs = anularCross(poblation(selected(1)), poblation(selected(2)));
		childs = co.crossOver(selected(1), selected(2), co);
		newPoblation(i).w1 = childs(1).w1;
		newPoblation(i).w2 = childs(1).w2;
		% newPoblation(i).w1
		newPoblation(i) = m.mutation(newPoblation(i),m);
		% newPoblation(i).w1
		newPoblation(i+1).w1 = childs(2).w1;
		newPoblation(i+1).w2 = childs(2).w2;
		newPoblation(i+1) = m.mutation(newPoblation(i),m);
		i = i + 2;
	end
	newPoblation = fitness(newPoblation,p);
	ret = newPoblation;
end