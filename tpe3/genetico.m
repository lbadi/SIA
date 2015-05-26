
% n = Numero de individuos en la población
% hidenN = Cantidad de neuronas en la capa oculta
% k = cantidad de seleccionados.
function ret = genetico(n,hidenN,k)
	% Elegir una población random
	for i=1:n
		poblation(i,1) = {rand(2,hidenN)};
		poblation(i,2) = {rand(hidenN+1,1)};
	end
	% Calcularle la aptitud a esa población y hacerle backpropagation un poco
	% Ver de que manera es mas conveniente guardar el fitness
	poblation = fitness(poblation);
	% Calcular el fitness relativo
	fit = relativeFitness(poblation);
	ret = fit;

	



% (While esa población no cumpla algun requisito de corte)
	% Selecciono(Ruleta, etc...)
	% selected = ruleta(k,fit);
	% Hago la cruza ()
	% Hago las mutaciones
	% Calculo el fitness para los nuevos individuos y entreno un poco con backpropagation
	% Hago el reemplazo


% Representación de un estado con una matriz.

% en poblation{:,1} estan las matrices que van de la capa de entrada a la capa oculta
% en poblation{:,2} estan las matrices que van de la capa oculta a la capa de salida
% en poblation{:,3} estan los fitness para cada elemento

poblation{1,1}