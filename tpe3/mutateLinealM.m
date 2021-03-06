function ret = mutateLinealM(element, c)
	% Esto es para 100 epocas
	% b = 0.01;
	% Esto es para 1000 épocas
	% b = 0.0015;
	mutateProbability = c.mutateProbability;
	mutateStrength = c.mutateStrength;
	iteration = c.iteration;
	%b = c.b;
	m = 1/c.iterations;
	for i=1 : length(element.w1(:))
		if rand < mutateProbability
			r = (rand - 0.5) * 2;
			element.w1(i) = element.w1(i) + r * mutateStrength * (1 - m*iteration);
		end
	end
	for i=1 : length(element.w2(:))
		if rand < mutateProbability
			r = (rand - 0.5) * 2;
			element.w2(i) = element.w2(i) + r * mutateStrength * (1 - m*iteration);
		end
	end
	ret = element;
end