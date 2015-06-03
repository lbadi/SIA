Método principal del algoritmo
----------------------------
function ret = genetico()


Método de Back Propagation
----------------------------
function ret = mperceptron(w_1,w_2,p)


Métodos de reemplazo
----------------------------
function ret= replaceOne(poblation,k,sm,co,m,sr,p)
function ret = replaceTwo(poblation,k,sm,co,m,sr,p)
function ret = replaceThree(poblation,k,sm,co,m,sr,p)


Métodos de seleccion
----------------------------
function ret = torneos(k, poblation, c)
function ret = elite(k, poblation)
function ret = ruleta(k,poblation, c)
function ret = boltzmann(k, poblation, c)
function ret = universal(k,poblation)
function ret = eliteruleta(k,poblation,c)
function ret = eliteuniversal(k,poblation,c)
function ret = elitetorneos(k,poblation,c)


Métodos de crossOver
----------------------------
function ret = uniCross(e1,e2,co)
function ret = onePointCross(e1,e2)
function ret = twoPointCross(e1,e2)
function ret = anularCross(e1,e2)


Métodos de Mutación
----------------------------
function ret = mutateLineal(element, c)
function ret = mutateLinealM(element, c)
function ret = mutateNoLineal(element, c)


Scripts de Test
----------------------------
function scriptTestEtaPerceptron(incstart,incend,incstep,decstart,decend,decstep,filename)
function scriptTestEtaGenetics(filename)
function scriptTestMutation(filename,mutation)
function scriptTestUniCross(filename)