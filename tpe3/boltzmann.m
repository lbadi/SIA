% T es la temperatura inicial.
% t es la epoca.
% m es el factor de decremento de la temperatura.

function ret = boltzmann(k, poblation, T, t, m)
	T = T - m * t;
	norm_factor = 0;
	for j = 1 : length(poblation(:))
		norm_factor += exp(poblation(j).fitness/T);
	end
	for i = 1 : length(poblation(:))
		boltzmann_fitness(i) = exp(poblation(i).fitness/T)/norm_factor;
	end
	ret = ruleta(k, poblation, boltzmann_fitness);
end