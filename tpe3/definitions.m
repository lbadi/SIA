Métodos de reemplazo
----------------------------
function ret = replaceOne(poblation,selectMethod,crossOver,mutation,pm,selectMethodForReplace,k)
function ret = replaceMixed(poblation,selectMethod,crossOver,mutation,pm,selectMethodForReplace,k,secondSelectMethodForReplace,numbersOfSelectedWithFirstMethod,iterations)
function ret = replaceThree(poblation,selectMethod,crossOver,mutation,pm,selectMethodForReplace,k)
function ret = replaceTwo(poblation,selectMethod,crossOver,mutation,pm,selectMethodForReplace,k)

poblation,selectMethod,crossOver,mutation,pm,selectMethodFrReplace,k

replace(poblation,k,sm,co,m,sr)

Métodos de seleccion
----------------------------
function ret = torneos(k, poblation, m=3)
function ret = elite(k, poblation)
function ret = ruleta(k,poblation, alternative_fitness)
function ret = boltzmann(k, poblation, T, t, m)
function ret = universal(k,poblation)
function ret = eliteruleta(k,poblation,N1=0)
function ret = eliteuniversal(k,poblation,N1=0)

k,poblation

Métodos de crossOver
----------------------------
function ret = twoPointCross(e1,e2)
function ret = uniCross(e1,e2,p=0.5)
function ret = onePointCross(e1,e2)
function ret = onePointCross2(e1,e2)
function ret = anularCross(e1,e2)

e1,e2

Métodos de Mutación
----------------------------
function ret = mutateLineal(element, mutateProbability, mutateStrength)
function ret = mutateNoLineal(element, mutateProbability, mutateStrength, iteration)
element,mutateProbability,mutateStrength




function ret = calculateError(w_1 ,w_2)
function ret = fitness(poblation)
function ret = genetico(n,hidenN,k,iterations,fitnessWish = 100, timeToMakeProgress = 1000)
function ret = restructureChild(e1,e2,child1,child2)
function ret = saveParameters(filename)
function ret = sinhcos( x )
function ret = startGenetico()


