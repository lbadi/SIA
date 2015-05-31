function ret = checkStructural(oldpoblation,poblation,relevantpercent)
	%Retorna 1 si los individuos que no cambiaron son mas del porcentaje relevante
	count = 0;
	size = sum(size(poblation(1).w1))+sum(size(poblation(1).w2));
	for i=1:length(poblation)
		if(poblation(i).fitness == oldpoblation(i).fitness)
		% if(sum(sum(poblation(i).w1 == oldpoblation(i).w1))+sum(sum(poblation(i).w2 == oldpoblation(i).w2)) == size)
			count++;
		end
	end
	PoblationChanged = length(poblation)-count
	ret = sum(count)/length(poblation)>relevantpercent;
end