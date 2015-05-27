function ret = twoPointCross(e1,e2)
	element1 = [toVector(e1.w1) toVector(e1.w2)];
	element2 = [toVector(e2.w1) toVector(e2.w2)];
	locus = randi(length(element1) - 1);
	locus2 = locus + randi(length(element1) - locus);

	child1 = [ element1(1:locus-1) element2(locus:locus2-1) element1(locus2:length(element1))];
	child2 = [ element2(1:locus-1) element1(locus:locus2-1) element2(locus2:length(element1))];

	ret = restructureChild(e1,e2,child1,child2);

end