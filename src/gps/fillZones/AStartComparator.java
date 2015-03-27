package gps.fillZones;

import gps.GPSNode;

import java.util.Comparator;

public class AStartComparator implements Comparator<GPSNode>{

	@Override
	public int compare(GPSNode o1, GPSNode o2) {
			return o1.getValue().compareTo(o2.getValue());
	}
}