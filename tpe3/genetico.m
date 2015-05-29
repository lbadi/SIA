
% n = Numero de individuos en la población
% hidenN = Cantidad de neuronas en la capa oculta
% k = cantidad de seleccionados.
% iterations = cantidad de iteraciones.
function ret = genetico(n,hidenN,k,iterations,fitnessWish = 100, timeToMakeProgress = 1000)
	% Elegir una población random
	for i=1:n
		poblation(i).w1 = rand(2,hidenN);
		poblation(i).w2 = rand(hidenN+1,1);
	end
	% Calcularle la aptitud a esa población y hacerle backpropagation un poco
	% Ver de que manera es mas conveniente guardar el fitness
	poblation = fitness(poblation);
	betterElement.fitness = 0;
	betterFitnessOfAllGenerations = 0;
	timeFromLastImprove = 0;
	i = 0;
	load('config/replaceMixed.cfg')
	while(1)
		% Checkeo las razones para terminar
		if(i > iterations)
			reassonToEnd = "Maxima cantidad de generaciones alcanzadas";
			break;
		end
		if(betterElement.fitness >= fitnessWish)
			reassonToEnd = "Se alcanzo un elemento suboptimo con el fitness deseado";
			break;
		end
		if(timeFromLastImprove>= timeToMakeProgress)
			reassonToEnd = "No hubo progreso en mas generaciones que las deseadas";
			break;
		end

	
	
	 	poblation = replaceMixed(poblation,rmselectMethod,rmcrossOver,rmmutation,rmpm,rmselectMethodForReplace,rmk,rmsecondSelectMethodForReplace,rmnumbersOfSelectedWithFirstMethod,i);
	 	totalFit = 0;
	 	betterElement.fitness = 0;

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
	 	betterElement.fitness
	 	if mod(i, 1000) == 0
	 		plotComparation(betterElement.w1,betterElement.w2,@activation);
	 	end
	 	% Calcualar el maximo de los fitness de la poblacion
	 	% max(cat(1,poblation.fitness))
	 	i++;
	 	fflush(stdout);
	end
	printf("La razon para terminar : %s \n", reassonToEnd);
	ret = betterElement;

	



% (While esa población no cumpla algun requisito de corte)
	% Selecciono(Ruleta, etc...)
	% selected = ruleta(k,fit);
	% Hago la cruza ()
	% Hago las mutaciones
	% Calculo el fitness para los nuevos individuos y entreno un poco con backpropagation
	% Hago el reemplazo


% Representación de un estado con una matriz.

% en poblation(:).w1 estan las matrices que van de la capa de entrada a la capa oculta
% en poblation(:).w2 estan las matrices que van de la capa oculta a la capa de salida
% en poblation(:).fitness estan los fitness para cada elemento