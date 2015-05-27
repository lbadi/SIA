function ret = onePointCross(e1,e2)
	element1 = [toVector(e1.w1) toVector(e1.w2)];
	element2 = [toVector(e2.w1) toVector(e2.w2)];
	locus = randi(length(element1));

	child1 = [ element1(1:locus-1) element2(locus:length(element2))];
	child2 = [ element2(1:locus-1) element1(locus:length(element1))];

	ret = restructureChild(e1,e2,child1,child2);
end