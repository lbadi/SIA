function ret = onePointCross(w11,w12,w21,w22)
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

	childs{1,1} = child11;
	childs{1,2} = child12;
	childs{2,1} = child21;
	childs{2,2} = child22; 
	ret = childs;
end