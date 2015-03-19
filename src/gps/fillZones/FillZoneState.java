package gps.fillZones;

import gps.api.GPSState;

public class FillZoneState implements GPSState{

	public int movesLeft;
	public static int countRow = 11;
	public static int countCol = 11;
	public static int countColors = 6;
	public byte[][] board = new byte[countRow][countCol];
	
	public FillZoneState(int movesLeft){
		this.movesLeft = movesLeft;
	}
	@Override
	public boolean compare(GPSState state) {
		for(int i = 0 ; i< countRow; i++){
			for(int j=0 ; j< countCol; j++){
				if(board[i][j] != ((FillZoneState)state).board[i][j]){
					return false;
				}
			}
		}
		return true;
	}
	
	public FillZoneState copy(){
		FillZoneState state = new FillZoneState(movesLeft);
		for(int i = 0 ; i< countRow; i++){
			for(int j=0 ; j< countCol; j++){
				state.board[i][j] = board[i][j];
			}
		}
		return state;
	}
	
	public String toString(){
		String s = "";
		for(int i = 0 ; i< countRow; i++){
			for(int j=0 ; j< countCol; j++){
				s +=board[i][j] + " ";
			}
			s += "\n";
		}
		s += "\n -------------------------- \n";
		return s;
	}

}
