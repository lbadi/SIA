function ret = plotComparation(w_1,w_2,g )

	input = [-2:0.1:2];
	for i=1:length(input)
		out_1 = neuron([-1 input(i)],w_1);
		inputs_2 = arrayfun(g,out_1);
		out_2(i) = neuron([-1 inputs_2],w_2);
		expected = sinhcos(input(i));
		errors(i) = expected - out_2(i);
	end
	figure(1);
	clf;
	% plot(input,out_2, '*', sinhcos(input), '-')
	hold all
	title ("sinh(x)*cos(x^2)");
	plot(input, out_2, 'b-', 'LineWidth', 4)
	plot(input, sinhcos(input), 'g-', 'LineWidth', 2)
	plot(input, errors, 'r-', 'LineWidth', 1)
	xlabel('x');
	ylabel('f(x)');
	axis([-2 2 -4 4]);
	legend({"Red neuronal", "sinhcos(x^2)", "Error" });
	hold off
	drawnow;
	hold off;
	refresh;
end