
% n = Numero de individuos en la población
% hidenN = Cantidad de neuronas en la capa oculta
% k = cantidad de seleccionados.
% iterations = cantidad de iteraciones.
function ret = genetico()
	%Se cargan las configuraciones
	g = loadParameters('genetico');
	sm = loadParameters('selection');
	co = loadParameters('crossover');
	m = loadParameters('mutation');
	sr = loadParameters('selection2');
	r = loadParameters('replace');
	p = loadParameters('mperceptron');
	replaceMethod = r.replaceMethod;
	iterations = g.iterations;
	fitnessWish = g.fitnessWish;
	timeToMakeProgress = g.timeToMakeProgress;
	structuraliterationsallowed = g.structuraliterationsallowed;
	relevantpercent = g.relevantpercent;
	sm.iterations = iterations;
	sr.iterations = iterations;
	m.iterations = iterations;
	% Elegir una población random
	for i=1:g.n
		poblation(i).w1 = rand(2,g.hidenN) -0.5;
		poblation(i).w2 = rand(g.hidenN+1,1) -0.5;
	end
	% Calcularle la aptitud a esa población y hacerle backpropagation un poco
	% Ver de que manera es mas conveniente guardar el fitness
	poblation = fitness(poblation,p);
	betterElement.fitness = 0;
	betterFitnessOfAllGenerations = 0;
	timeFromLastImprove = 0;
	iterationswithoutchange = 0;
	i = 0;
	

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
	 	printf("Generacion numero : %d \n" , i);
	 	totalFit
	 	betterGenerationFitness=betterElement.fitness

	 	if mod(i, 1000) == 0
	 		plotComparation(betterElement.w1,betterElement.w2,@activation);
	 	end
	 	% Calcualar el maximo de los fitness de la poblacion
	 	% max(cat(1,poblation.fitness))
	 	i++;
	 	fflush(stdout);
	end
	printf("La razon para terminar : %s \n", reasonToEnd);
	ret = betterElement;


% Representación de un estado con una matriz.

% en poblation(:).w1 estan las matrices que van de la capa de entrada a la capa oculta
% en poblation(:).w2 estan las matrices que van de la capa oculta a la capa de salida
% en poblation(:).fitness estan los fitness para cada elemento