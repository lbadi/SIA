function ret = elite(k, poblation)
	for i=1:k
		max_fitness = 0;
		max_index = 0;
		for j=1:length(poblation(:))
			fitness = poblation(j).fitness;
			if(fitness > max_fitness)
				max_fitness = fitness;
				max_index = j;
			end
		end
		selected(i) = poblation(max_index);
		poblation(max_index) = [];
	ret = selected
end