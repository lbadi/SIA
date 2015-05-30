function ret = uniCross(e1,e2,co)
	p = co.unip;
	element1 = [toVector(e1.w1) toVector(e1.w2)];
	element2 = [toVector(e2.w1) toVector(e2.w2)];
	child1 = element1;
	child2 = element2;
	for i = 1 : length(element1)
		if(rand<p)
			child1(i) = element2(i);
			child2(i) = element1(i);
		end
	end
	ret = restructureChild(e1,e2,child1,child2);
end