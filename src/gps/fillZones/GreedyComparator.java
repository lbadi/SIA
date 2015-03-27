package gps.fillZones;

import java.util.Comparator;
import gps.GPSNode;

public class GreedyComparator implements Comparator<GPSNode>{

	@Override
	public int compare(GPSNode o1, GPSNode o2) {
		if(o1.getCost() < o2.getCost()){
			return -1;
		}else if (o1.getCost() < o2.getCost()){
			return o1.getValue().compareTo(o2.getValue());
		}else{
			return 1;
		}
	}

}
