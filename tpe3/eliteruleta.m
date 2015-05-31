function ret = eliteruleta(k,poblation,c)
	N = c.poblationSize;
	n1 = c.n1;
	N1 = floor(N * n1);
	poblation_elite = elite(N1, poblation);
	poblation_ruleta = ruleta(k - N1, poblation,c);
	ret = [poblation_elite poblation_ruleta];
end