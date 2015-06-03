
% n = Numero de individuos en la población
% hidenN = Cantidad de neuronas en la capa oculta
% k = cantidad de seleccionados.
% iterations = cantidad de iteraciones.
function ret = genetico()
	%Se cargan las configuraciones iniciales.
	g = loadParameters('genetico');
	sm = loadParameters('selection');
	co = loadParameters('crossover');
	m = loadParameters('mutation');
	sr = loadParameters('selection2');
	r = loadParameters('replace');
	p = loadParameters('mperceptron');
	
	%Estos loadParameters son para los scripts de testing
	% co = loadParameters('testingUniCross/crossover');
	% m = loadParameters('testingMutation/mutation');
	% p = loadParameters('testingEta/mperceptron');

	replaceMethod = r.replaceMethod;
	iterations = g.iterations;
	fitnessWish = g.fitnessWish;
	timeToMakeProgress = g.timeToMakeProgress;
	structuraliterationsallowed = g.structuraliterationsallowed;
	relevantpercent = g.relevantpercent;
	sm.iterations = iterations;
	sr.iterations = iterations;
	m.iterations = iterations;
	sr.poblationSize = g.n;
	sm.poblationSize = g.n;
	poblationSize = g.n;

	
	% Elegir una población random
	if(g.usePredetPoblation)
		rand('seed',314159265359);
	end

	for i=1:g.n
		poblation(i).w1 = rand(2,g.hidenN) -0.5;
		poblation(i).w2 = rand(g.hidenN+1,1) -0.5;
		poblation(i).eta = p.eta;
	end
	
	% Calcularle la aptitud a esa población y hacerle backpropagation un poco
	% Ver de que manera es mas conveniente guardar el fitness
	poblation = fitness(poblation,p);
	betterElement.fitness = 0;
	betterFitnessOfAllGenerations = 0;
	timeFromLastImprove = 0;
	iterationswithoutchange = 0;
	i = 1;
	bestElementFitnesses = zeros(1, iterations);
	averageFitnesses = zeros(1, iterations);

	while(1)
		% Checkeo las razones para terminar
		if(i > iterations)
			reasonToEnd = "Maxima cantidad de generaciones alcanzadas.";
			break;
		end
		if(betterElement.fitness >= fitnessWish)
			reasonToEnd = "Se alcanzo un elemento suboptimo con el fitness deseado.";
			break;
		end
		if(timeFromLastImprove>= timeToMakeProgress)
			reasonToEnd = "No hubo progreso en mas generaciones que las deseadas.";
			break;
		end
		if(iterationswithoutchange>structuraliterationsallowed)
			reasonToEnd = "Una gran parte de la población no cambio hace mucho tiempo.";
			break;
		end
		sr.iteration = i;
		sm.iteration = i;
		m.iteration = i;
		oldpoblation = poblation;
	 	poblation = replaceMethod(poblation,g.k,sm,co,m,sr,p);
	 	totalFit = 0;
	 	betterElement.fitness = 0;

	 	%validacion de cambio de una parte relevante de la poblacion
	 	if(checkStructural(oldpoblation,poblation,relevantpercent))
	 		iterationswithoutchange++;
	 	else
	 		iterationswithoutchange = 0;
	 	end
	 	% Veo quien tiene mejor fitness
	 	for j = 1 : length(poblation(:))
	 		totalFit += poblation(j).fitness;
	 		if(poblation(j).fitness > betterElement.fitness)
	 			betterElement = poblation(j);
	 		end
	 	end
	 	% Si hago un progreso en el fitness vuelvo a resetear el tiempo.
	 	timeFromLastImprove++;
	 	if(betterFitnessOfAllGenerations < betterElement.fitness)
	 		timeFromLastImprove = 0;
	 		betterFitnessOfAllGenerations = betterElement.fitness;
	 	end

	 	totalFitness = totalFit;
	 	betterElementFitness=betterElement.fitness;
	 	bestElementFitnesses(i) = betterElement.fitness;
	 	averageFitnesses(i) = totalFit/length(poblation);


	 	if (g.printDetails)
	 		printf("Generacion numero : %d \n" , i);
	 		printf("Total Fitness : %f \n" , totalFit);
		 	if mod(i, 100) == 0
		 		plotFitnessEvolution(bestElementFitnesses, averageFitnesses, iterations, i);
		 		plotComparation(betterElement.w1,betterElement.w2,@activation);
		 		%fitnessThroughIterations(i/100)=betterElementFitness;
		 	end
	 	end
	 		printf("Mejor Fitness : %f \n" , betterElementFitness);
	 	% Calcualar el maximo de los fitness de la poblacion
	 	max(cat(1,poblation.fitness));
	 	i++;
	 	fflush(stdout);
	end
	printf("La razon para terminar : %s \n", reasonToEnd);
	% system('beep');
	ret = betterElement;
	ret.fitnessThroughIterations=fitnessThroughIterations;
	ret.totalFitness =  totalFitness;
	ret.iterations = i-1;
	ret.reason = reasonToEnd;
	ret.crossover = co.crossOver;
	ret.mutation = m.mutation;


% Representación de un estado con una matriz.

% en poblation(:).w1 estan las matrices que van de la capa de entrada a la capa oculta
% en poblation(:).w2 estan las matrices que van de la capa oculta a la capa de salida
% en poblation(:).fitness estan los fitness para cada elemento