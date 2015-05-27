function ret = relativeFitness(poblation)
	sumFit = 0;
	for i=1:length(poblation(:))
		sumFit = sumFit + poblation(i).fitness;
	end
	for i=1:length(poblation(:))
		fit(i) = poblation(i).fitness / sumFit;
	end
	ret = fit;
end