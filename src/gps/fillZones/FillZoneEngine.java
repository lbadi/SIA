package gps.fillZones;

import java.util.LinkedList;

import gps.GPSEngine;
import gps.GPSNode;
import gps.SearchStrategy;

public class FillZoneEngine extends GPSEngine{

	private int maxStep = 1;
	
	@Override
	public boolean isGoal(GPSNode node){
		FillZoneState state = ((FillZoneState) node.getState());
		byte firstColor = state.board[0][0];
		for(int i = 0; i < FillZoneState.countRow ; i++){
			for(int j=0; j< FillZoneState.countCol ; j++){
				if(firstColor != state.board[i][j]){
					return false;
				}
			}
		}
		return true;
	}
	@Override
	public void addNode(GPSNode node) {
		switch( this.getStrategy()){
			case DFS:{
				addDFS(node);
			}
			case BFS:{
				addBFS(node);
			}
			case ITERATIVE:{
				addIterative(node);
			}
			case AStar:{
				
			}
			case GREEDY:{
				
			}
			default: {
				addDFS(node);
			}
		}
		System.out.println(node.getState());
		
	}
	
	private void addDFS(GPSNode node){
		((LinkedList<GPSNode>)this.open).addFirst(node);
	}
	private void addBFS(GPSNode node){
		(this.open).add(node);
	}
	private void addIterative(GPSNode node){
		int step = calculateHeight(node);
		if(step < maxStep){
			addDFS(node);
		}
		if(open.isEmpty()){
			maxStep++;
			GPSNode rootNode = new GPSNode(problem.getInitState(), 0);
			addDFS(rootNode);
			
		}
	}
	private int calculateHeight(GPSNode node){
		int i = 0;
		while(node.getParent() != null){
			i++;
			node = node.getParent();
		}
		return i;
	}
}
