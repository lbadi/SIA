package gps.eightQueens;

import gps.api.GPSRule;
import gps.api.GPSState;
import gps.exception.NotAppliableException;

public class QueensRule implements GPSRule{

	int columnToAdd;
	int rowToAdd;
	
	public QueensRule(int columnToAdd,int rowToAdd){
		this.columnToAdd = columnToAdd;
		this.rowToAdd = rowToAdd;
	}
	@Override
	public Integer getCost() {
		return 0;
	}

	@Override
	public String getName() {
		return "pepito";
	}

	@Override
	public GPSState evalRule(GPSState state) throws NotAppliableException {
		QueensState st = ((QueensState) state);
		if( st.board[rowToAdd] != -1){
			throw new NotAppliableException();
		}
		for(int i = 0; i < st.board.length; i++){
			if(st.board[i] != -1){
				if(st.board[i] == columnToAdd){
					throw new NotAppliableException();
				}
				if( Math.abs(rowToAdd +  st.board[i]) == Math.abs(columnToAdd + i)){
					throw new NotAppliableException();
				}
				if( Math.abs(rowToAdd + columnToAdd) == Math.abs(i + st.board[i])){
					throw new NotAppliableException();
				}
			}
		} 
		QueensState cpy = st.copy().addQueen(rowToAdd, columnToAdd);
		
		return cpy;
	}

}
