package gps.fillZones;

import java.io.IOException;
import java.util.Properties;

import gps.SearchStrategy;

public class Execute {

	public static void main(String[] args) {
		//Todo hacer que dependiendo los argumentos cambie la estrategia y la heuristica.
		Configuration config;
		try {
			config = new Configuration();
			Properties prop = config.getConfiguration();
			System.out.println(prop.getProperty("algorithm"));
			System.out.println(prop.getProperty("heuristic"));
			FillZoneEngine engine = new FillZoneEngine();
			engine.engine(new FillZoneProblem(null), SearchStrategy.DFS);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
