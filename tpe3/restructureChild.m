function ret = restructureChild(e1,e2,child1,child2)
	child(1).w1 = toMatrix(child1(1:rows(e1.w1) * columns(e1.w1)),columns(e1.w1),2);
	child(1).w2 = toMatrix(child1(rows(e1.w1) * columns(e1.w1) + 1: length(child1)),1,rows(e1.w2) * columns(e1.w2));
	child(2).w1 = toMatrix(child2(1:rows(e2.w1) * columns(e2.w1)),columns(e2.w1),2);
	child(2).w2 = toMatrix(child2(rows(e2.w1) * columns(e2.w1) + 1: length(child2)),1,rows(e1.w2) * columns(e1.w2));
	ret = child;
end