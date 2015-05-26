function ret= selectionOne(poblation,fit)
	i = 1;
	while(i<=length(poblation))
		selected = ruleta(2,fit);
		childs = onePointCross(poblation{selected(1),1},poblation{selected(1),2},poblation{selected(2),1},poblation{selected(2),2});
		newPoblation{i,1} = childs{1,1};
		newPoblation{i,2} = childs{1,2};
		newPoblation{i+1,1} = childs{1,1};
		newPoblation{i+1,2} = childs{1,1};
		i = i + 2;
	end
	ret = newPoblation;
end