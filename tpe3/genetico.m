
% n = Numero de individuos en la población
% hidenN = Cantidad de neuronas en la capa oculta
% k = cantidad de seleccionados.
% iterations = cantidad de iteraciones.
function ret = genetico(n,hidenN,k,iterations)
	% Elegir una población random
	for i=1:n
		poblation(i).w1 = rand(2,hidenN);
		poblation(i).w2 = rand(hidenN+1,1);
	end
	% Calcularle la aptitud a esa población y hacerle backpropagation un poco
	% Ver de que manera es mas conveniente guardar el fitness
	poblation = fitness(poblation);
	% Calcular el fitness relativo
	for i=1:iterations
	 	poblation = replaceOne(poblation);
	 	poblation = fitness(poblation);
	 	totalFit = 0;
	 	betterElement.fitness = 0;
	 	for j = 1 : length(poblation(:))
	 		totalFit += poblation(j).fitness;
	 		if(poblation(j).fitness > betterElement.fitness)
	 			betterElement = poblation(j);
	 		end
	 	end
	 	totalFit
	 	betterElement.fitness
	 	plotComparation(betterElement.w1,betterElement.w2,@activation);
	 	clf;
	 	% Calcualar el maximo de los fitness de la poblacion
	 	% max(cat(1,poblation.fitness))

	 	fflush(stdout);
	end
	ret = fit;

	



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