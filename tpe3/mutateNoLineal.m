function ret = mutateNoLineal(element, mutateProbability, mutateStrength, iteration, iterationStrength)
	%Por ahora poner el iterationStrength en 1 y dejar el 0.01, después ver si ponemos el strength ahi o no, depende de la cantidad de iteraciones que nos lleve
	for i=1 : length(element.w1(:))
		if rand < mutateProbability
			r = (rand - 0.5) * 2;
			element.w1(i) = element.w1(i) +  r * mutateStrength - r * mutateStrength * 1-tanh(0.01*iteration) * iterationStrength);
		end
	end
	for i=1 : length(element.w2(:))
		if rand < mutateProbability
			r = (rand - 0.5) * 2;
			element.w2(i) = element.w2(i) +  r * mutateStrength - r * mutateStrength * 1-tanh(0.01*iteration) * iterationStrength);
		end
	end

	ret = element;
end