function ret = plotFitnessEvolution(bestElementFitnesses, averageFitnesses, iterations, i)
	figure(2);
	clf;
	hold all;
	title ("Evolución del Fitness");
	generations = 1:iterations;
	plot(generations(1:i), bestElementFitnesses(1:i), 'r-', 'LineWidth', 4);
	plot(generations(1:i), averageFitnesses(1:i), 'b-', 'LineWidth',2);
	xlabel('Generación');
	ylabel('Fitness');
	axis([0 iterations 0 200]);
	legend({"Mejor individuo", "Promedio"});
	hold off;
	drawnow;
	hold off;
	refresh;
end