function ret = eliteruleta(k,poblation,N1=0)
	poblation_elite = elite(N1, poblation);
	poblation_ruleta = ruleta(k - N1, poblation);
	ret = [poblation_elite poblation_ruleta];
end