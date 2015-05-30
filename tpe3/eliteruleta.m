function ret = eliteruleta(k,poblation,c)
	N1 = c.N1;
	poblation_elite = elite(N1, poblation);
	poblation_ruleta = ruleta(k - N1, poblation,c);
	ret = [poblation_elite poblation_ruleta];
end