function ret = eliteuniversal(k,poblation,c)
	N = c.poblationSize;
	n1 = c.n1;
	N1 = floor(N * n1);
	poblation_elite = elite(N1, poblation);
	poblation_universal = universal(k - N1, poblation);
	ret = [poblation_elite poblation_universal];
end