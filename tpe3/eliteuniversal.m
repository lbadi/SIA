function ret = eliteuniversal(k,poblation,c)
	N1 = c.N1;
	poblation_elite = elite(N1, poblation);
	poblation_universal = universal(k - N1, poblation);
	ret = [poblation_elite poblation_universal];
end