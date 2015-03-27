package gps.fillZones;

import gps.GPSEngine;
import gps.GPSNode;

import java.util.LinkedList;

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
				add(node);
			}
			case BFS:{
				add(node);
			}
			case ITERATIVE:{
				addIterative(node);
			}
			case AStar:{
				addAStar(node);
			}
			case GREEDY:{
				addGreedy(node);
			}
			default: {
				add(node);
			}
		}
		System.out.println(node.getState());
		
	}
	private void addAStar(GPSNode node){
		node.setValue(problem.getHValue(node.getState()));
	}
	private void addGreedy(GPSNode node){
		node.setValue(problem.getHValue(node.getState()) + node.getCost());
	}
	private void add(GPSNode node){
		this.open.add(node);
	}
	private void addIterative(GPSNode node){
		int step = calculateHeight(node);
		if(step < maxStep){
			add(node);
		}
		if(open.isEmpty()){
			maxStep++;
			GPSNode rootNode = new GPSNode(problem.getInitState(), 0);
			add(rootNode);
			
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
