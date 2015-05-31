% T es la temperatura inicial.
% t es la epoca.
% m es el factor de decremento de la temperatura.

function ret = boltzmann(k, poblation, c)
	t = c.iteration;
	T = c.T;
	m = (T - 273) / c.iterations;
	T = T - m * t;
	norm_factor = 0;
	for j = 1 : length(poblation(:))
		norm_factor += exp(poblation(j).fitness/T);
	end
	for i = 1 : length(poblation(:))
		boltzmann_fitness(i) = exp(poblation(i).fitness/T)/norm_factor;
	end
	c.alternative_fitness = boltzmann_fitness;
	ret = ruleta(k, poblation, c);
end