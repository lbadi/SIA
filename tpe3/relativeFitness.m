function ret = relativeFitness(poblation)
	sumFit = 0;
	length(poblation(:,1))
	for i=1:length(poblation(:,1))
		sumFit = sumFit + poblation{i,3};
	end
	for i=1:length(poblation(:,1))
		fit(i) = poblation{i,3} / sumFit;
	end
	ret = fit;
end