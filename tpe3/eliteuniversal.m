function ret = eliteuniversal(k,poblation,N1=0)
	poblation_elite = elite(N1, poblation);
	poblation_universal = universal(k - N1, poblation);
	ret = [poblation_elite poblation_universal];
end