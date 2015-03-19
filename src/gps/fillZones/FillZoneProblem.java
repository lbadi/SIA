package gps.fillZones;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import gps.api.GPSProblem;
import gps.api.GPSRule;
import gps.api.GPSState;

public class FillZoneProblem implements GPSProblem{

	@Override
	public GPSState getInitState() {
		FillZoneState state = new FillZoneState(30);
		Random randomGenerator = new Random();
		for(int i = 0; i<FillZoneState.countRow ; i++){
			for(int j = 0; j< FillZoneState.countCol; j++){
				state.board[i][j] = (byte) randomGenerator.nextInt(FillZoneState.countColors);
			}
		}
		return state;
	}

	@Override
	public GPSState getGoalState() {
		return null;
	}

	@Override
	public List<GPSRule> getRules() {
		List<GPSRule> rules = new ArrayList<GPSRule>();
		for(byte i = 0; i< FillZoneState.countColors ; i++){
			rules.add(new FillZoneRule(i));
		}
		return rules;
	}

	@Override
	public Integer getHValue(GPSState state) {
		return 0;
	}


}
