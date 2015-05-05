Instrucciones para la ejecución:

Ejecutar fillZone.jar con java -jar fillZone.jar par1 par2 par3 par4 par5 par6 par7.
par1(Necesario, String) : Estrategia de resolución.
	DFS
	BFS
	ITERATIVE
	AStar
	GREEDY
par2(Necesario, String) : Heurística a utilizar. Si no es una estrategia que necesite heurística
simplemente la ignora.
	DH
	DHA
	DHAC
	CB
par3(Opcional, Integer) : Cantidad de filas. Por default toma 8 y debe ser menor a 14.
par4(Opcional, Integer) : Cantidad de columnas. Por default toma 8 y debe ser menor a 14. 
par5(Opcional, Integer) : Cantidad de movimientos. Por default toma 30.
par6(Opcional, Boolean) : True si tiene que imprimir cada nodo explotado.
par7(Opcional, Boolean) : True si se quiere una representación con colores.

Si se quiere definir el parN hay que definir todos los otros parámetros anteriores.