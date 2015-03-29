package gps.fillZones;

import java.io.IOException;
import java.util.Properties;

import gps.SearchStrategy;

public class Execute {

	public static void main(String[] args) {
		//Todo hacer que dependiendo los argumentos cambie la estrategia y la heuristica.
		Configuration config;
			FillZoneEngine engine = new FillZoneEngine();
			engine.engine(new FillZoneProblem(new DistanceHeuristic()), SearchStrategy.GREEDY);
	}

}
