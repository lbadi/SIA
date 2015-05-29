function ret = torneos(k, poblation, m=3)
	poblation_size = length(poblation(:));
	selected_indices = [];
	for i=1:k
		do
			max_fitness = 0;
			max_index = 0;
			competitors = [];
			for j=1:m
				% Agrego un competidor al azar que no este en competitors
				do
					n = randi(poblation_size);
				until(!ismember(n, competitors))
				competitors(j) = n;
				% Me quedo con el indice del mejor
				fitness = poblation(n).fitness;
				if(fitness > max_fitness)
					max_fitness = fitness;
					max_index = n;
				end
			end
			competitor = poblation(max_index);
		until(!ismember(max_index, selected_indices))
		selected_indices(i) = max_index;
		selected(i) = competitor;
	ret = selected;
end