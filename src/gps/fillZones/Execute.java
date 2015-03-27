package gps.fillZones;

import gps.SearchStrategy;

public class Execute {

	public static void main(String[] args) {
		FillZoneEngine engine = new FillZoneEngine();
		engine.engine(new FillZoneProblem(), SearchStrategy.GREEDY);
	}

}
