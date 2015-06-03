Readme Configuraciones
---------------------------------
En el archivo definitions.m se pueden encontrar las definiciones de las funciones a utilizar.

----------------------
genetico.cfg

hidenN: Cantidad de neuronas en la capa oculta.
iterations: Cantidad de generaciones.
k:Cantidad de elementos a cruzar en cada generación.
n: Cantidad de individuos.
fitnessWish: El fitness que se desea alcanzar para el corte.
timeToMakeProgress: Tiempo que tiene para mostrar algun progreso en el mejor fitness
relevantpercent: Porcentaje de la población que se considera relevante para la validación de corte por estructura.
structuraliterationsallowed: Iteraciones permitidas antes de que se llegue al corte por estructura.
usePredetPoblation: Flag para determinar si se desea utilizar la población de testing.
printDetails: Flag para determinar si se desea imprimir detalles en las iteraciones.

----------------------
----------------------
mperceptron.cfg

useBackPropagation: Flag que determina si se utiliza BackPropagation.
g: Función de activacion.
hidenN: Neuronas en la capa oculta.
acceptedError: Error de aceptación.
alpha: Parámetro alpha de momentum.
eta: Eta.
etaAdaptation: Flag que determina si se utiliza el eta adaptativo.
throwWeights: Flag para determinar si se tiran o no los pesos y se realiza una nueva iteracion, en el caso de un aumento del error con el eta adaptativo.
etadec: Decremento geométrico de eta.
etainc: Incremento constante de eta.
gDerivada: Derivada de la función de activación.
graph: 1 si se desea que se grafique en cada época.
iterations: Cantidad de epocas.
lengthOut: Longitud de la salida, en nuestro caso 1.
n: Longitud de la entrada, en nuestro caso 1.

----------------------
----------------------
replace.cfg

replaceMethod: Método de reemplazo a utilizar (replaceOne,replaceTwo,replaceThree).

----------------------
----------------------
crossover.cfg

crossOver: Método de crossover a utilizar (twoPointCross,uniCross,onePointCross,onePointCross2,anularCross).
unip:Probabilidad de cruzar cada alelo en la cruza uniforme.

----------------------
----------------------
mutation.cfg

mutation: Método de mutación a utilizar (mutateLineal,mutateNoLineal).
mutateProbability: Probabilidad de mutación.
mutateStrength: Fuerza de mutación.


----------------------
----------------------
selection.cfg

selectMethod: Método de selección a utilizar (torneos,elite,ruleta,boltzmann,universal,eliteruleta,eliteuniversal).
T:?
N1:?
tm:?

----------------------