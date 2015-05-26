function ret = calculateError(w_1 ,w_2)
	g = @activation;
	input = [-2:0.1:2];
	error = 0;
	for i=1:length(input)
		out_1 = neuron([-1 input(i)],w_1);
		inputs_2 = arrayfun(g,out_1);
		out_2 = neuron([-1 inputs_2],w_2);
		expected = sinhcos(input(i));
		error += (expected - out_2)^2;
	end
	ret = error/length(input);
end