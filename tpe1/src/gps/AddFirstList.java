package gps;

import java.util.LinkedList;

public class AddFirstList<T> extends LinkedList<T>{

	@Override
	public boolean add(T node){
		this.addFirst(node);
		return true;
	}
}
