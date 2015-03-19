package gps.fillZones;

import gps.api.GPSRule;
import gps.api.GPSState;
import gps.exception.NotAppliableException;

public class FillZoneRule implements GPSRule {

	public byte colorToApply;

	public FillZoneRule(byte colorToApply) {
		this.colorToApply = colorToApply;
	}

	@Override
	public Integer getCost() {
		return 1;
	}

	@Override
	public String getName() {
		return "Aplique el numero de color";
	}

	@Override
	public GPSState evalRule(GPSState state) throws NotAppliableException {
		FillZoneState newState = ((FillZoneState)state).copy();
		if(newState.movesLeft == 0 || newState.board[0][0] == colorToApply){
			throw new NotAppliableException();
		}
		newState.movesLeft--;
		paint(colorToApply, newState.board[0][0], newState, 0, 0);
		return newState;
	}

	// nextColor y prevColor no pueden ser el mismo color, sino se hace una
	// llamada infinita
	private void paint(byte nextColor, byte prevColor, FillZoneState state,
						int i, int j) {
		state.board[i][j] = nextColor;
		if (i > 0) {
			if (state.board[i - 1][j] == prevColor) {
				paint(nextColor, prevColor, state, i - 1, j);
			}
		}
		if (j > 0) {
			if (state.board[i][j - 1] == prevColor) {
				paint(nextColor, prevColor, state, i, j - 1);
			}
		}
		if (i < FillZoneState.countRow-1) {
			if (state.board[i + 1][j] == prevColor) {
				paint(nextColor, prevColor, state, i + 1, j);
			}
		}
		if (j < FillZoneState.countCol-1) {
			if (state.board[i][j + 1] == prevColor) {
				paint(nextColor, prevColor, state, i, j + 1);
			}
		}
	}

}
