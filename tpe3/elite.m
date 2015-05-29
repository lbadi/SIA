function ret = elite(k, poblation)
	selected = [];
	for i=1:k	
		for i=1:length(poblation(:))
			poblation(i).fitness
		end
	ret = sort(fit, "descend")(1:k);
end