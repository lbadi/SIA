package gps.eightQueens;

import java.util.ArrayList;
import java.util.List;

import gps.api.GPSProblem;
import gps.api.GPSRule;
import gps.api.GPSState;

public class QueensProblem implements GPSProblem{

	@Override
	public GPSState getInitState() {
		QueensState finalState =  new QueensState();
		finalState.board[0] = 5;
		finalState.board[1] = -1;
		finalState.board[2] = -1;
		finalState.board[3] = -1;
		finalState.board[4] = -1;
		finalState.board[5] = -1;
		finalState.board[6] = -1;
		finalState.board[7] = -1;
		return finalState;
	}

	@Override
	public GPSState getGoalState() {
		return QueensState.getFinal();
	}

	@Override
	public List<GPSRule> getRules() {
		List<GPSRule> rules = new ArrayList<GPSRule>();
		for(int i = 0; i < QueensState.countRow; i ++){
			for(int j = 0; j < QueensState.countColumn; j++){
				rules.add(new QueensRule(j, i));
			}
		}
		return rules;
	}

	@Override
	public Integer getHValue(GPSState state) {
		return 0;
	}

}
