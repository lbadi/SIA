package gps.eightQueens;


import gps.GPSEngine;
import gps.GPSNode;
import gps.SearchStrategy;

public class QueensEngine extends GPSEngine{

	@Override
	public void addNode(GPSNode node) {
		if(getStrategy().equals(SearchStrategy.DFS)){
			open.add(node);
		}
		
	}

}
