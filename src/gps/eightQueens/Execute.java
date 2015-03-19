package gps.eightQueens;

import gps.SearchStrategy;

public class Execute {

	public static void main(String[] args) {
		QueensEngine queensEngine = new QueensEngine();
		queensEngine.engine(new QueensProblem(), SearchStrategy.DFS);
	}
}
