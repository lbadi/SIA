package gps.eightQueens;

import gps.api.GPSState;


public class QueensState implements GPSState{

	public static int countRow = 8;
	public static int countColumn = 8;
//	public int[][] board = new int[countRow][countColumn];
	public int queensCount;
	public int[] board = new int[countRow];
	
	public QueensState(){
		for(int i = 0; i < board.length; i++){
			board[i] = -1;
		}
	}
	public static QueensState getFinal(){
		QueensState finalState = new QueensState();
		finalState.board[0] = 5;
		finalState.board[1] = 0;
		finalState.board[2] = 4;
		finalState.board[3] = 1;
		finalState.board[4] = 7;
		finalState.board[5] = 2;
		finalState.board[6] = 6;
		finalState.board[7] = 3;
		return finalState;
	}
	
	@Override
	public boolean compare(GPSState state) {
//		for (int i = 0; i< countColumn ; i++){
			for(int j = 0; j< countRow ; j++){
				if(board[j] != ((QueensState)state).board[j]){
					return false;
				}
			}
//		}
		return true;
	}
	
	public QueensState copy(){
		QueensState qs = new QueensState();
		for(int i = 0 ; i < countRow; i++){
			qs.board[i] = board[i];
		}
		return qs;
	}
	
	public QueensState addQueen(int row, int col){
		board[row] = col;
		return this;
	}
	
	@Override
	public String toString(){
		String string = "";
		for(int i = 0; i < board.length; i++){
			string += board[i] + " ";
		}
		return string;
	}

}
