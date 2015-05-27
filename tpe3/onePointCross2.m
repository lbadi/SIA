function ret = onePointCross2(e1,e2)
	w11 = e1.w1;
	w12 = e1.w2;
	w21 = e2.w1;
	w22 = e2.w2; 
	% Cruzo las primeras conexiones de los dos hijos
	for i=1:rows(w11)
		% Ver si puede llegar a salirse de rango
		pointOfCross = floor(rand() * columns(w11)) + 1;
		if pointOfCross == 1
			child11(i,:) = w11(i,:);
			child21(i,:) = w21(i,:);
		else
			child11(i,:) = [w11(i,1:pointOfCross-1) w21(i,pointOfCross:columns(w21))];
			child21(i,:) = [w21(i,1:pointOfCross-1) w11(i,pointOfCross:columns(w11))];
		end
	end
	% Cruzo las segundas conexiones de los dos hijos
	for i=1:rows(w12)
		% Ver si puede llegar a salirse de rango
		pointOfCross = floor(rand() * columns(w12)) + 1;
		if pointOfCross == 1
			child12(i,:) = w12(i,:);
			child22(i,:) = w22(i,:);
		else
			child12(i,:) = [w12(i,1:pointOfCross-1) w22(i,pointOfCross:columns(w22))];
			child22(i,:) = [w22(i,1:pointOfCross-1) w12(i,pointOfCross:columns(w12))];
		end
	end

	childs(1).w1 = child11;
	childs(1).w2 = child12;
	childs(2).w1 = child21;
	childs(2).w2 = child22; 
	ret = childs;
end