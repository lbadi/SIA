function ret = mutateLineal(element, mutateProbability, mutateStrength)

	for i=1 : length(element.w1(:))
		if rand < mutateProbability
			element.w1(i) = element.w1(i) +  2 * (rand - 0.5) * mutateStrength ;
		end
	end
	for i=1 : length(element.w2(:))
		if rand < mutateProbability
			element.w2(i) = element.w2(i) +  2 * (rand - 0.5) * mutateStrength ;
		end
	end

	ret = element;
end