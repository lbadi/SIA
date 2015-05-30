Readme Configuraciones
---------------------------------
----------------------
genetico.cfg

hidenN: Cantidad de neuronas en la capa oculta.
iterations: Cantidad de generaciones.
k:?
n: Cantidad de individuos.
fitnessWish
timeToMakeProgress

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
unip:?
----------------------
----------------------
mutation.cfg

mutation: Método de mutación a utilizar (mutateLineal,mutateNoLineal).
mutateProbability: Probabilidad de mutación.
mutateStrength: Fuerza de mutación.
b: Parámetro beta para la función de mutación no lineal.
----------------------
----------------------
selection.cfg

selectMethod: Método de selección a utilizar (torneos,elite,ruleta,boltzmann,universal,eliteruleta,eliteuniversal).
T:?
bm:?
N1:?
tm:?
----------------------