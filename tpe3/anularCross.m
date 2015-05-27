function ret = anularCross(e1,e2)
	element1 = [toVector(e1.w1) toVector(e1.w2)];
	element2 = [toVector(e2.w1) toVector(e2.w2)];
	locus = randi(length(element1));
	l = randi(length(element1) / 2);

	overFlow = l + locus - length(element1);

	if(overFlow < 0)
		child1 = [ element1(1:locus-1) element2(locus:locus+l-1) element1(locus+l:length(element1))];
		child2 = [ element2(1:locus-1) element1(locus:locus+l-1) element2(locus+l:length(element1))];
	end
	if(overFlow > 0)
		child1 = [ element2(1:overFlow) element1(overFlow+1:locus-1) element2(locus:length(element1))];
		child2 = [ element1(1:overFlow) element2(overFlow+1:locus-1) element1(locus:length(element1))];
	end
	if(overFlow == 0)
		child1 = [ element1(1:locus-1) element2(locus:length(element1))];
		child2 = [ element2(1:locus-1) element1(locus:length(element1))];
	end
	ret = restructureChild(e1,e2,child1,child2);
end