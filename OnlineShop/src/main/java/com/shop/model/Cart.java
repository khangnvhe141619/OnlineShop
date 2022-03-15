package com.shop.model;

import java.util.ArrayList;
import java.util.List;
//123
public class Cart {
	private List<Item> items;
	public Cart() {
		items = new ArrayList<Item>();
		
	}
	public Cart(List<Item> items) {
		super();
		this.items = items;
	}
	
	
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	private Item getIteamById(int id) {
		for (Item i : items) {
			if(i.getProduct().getProductID()==id)
				return i;
		}
		return null;
	}
	public int getQuantityById(int id) {
		return getIteamById(id).getQuantity();
	}
	public void addItem(Item t) {
		//da co trong gio
		if(getIteamById(t.getProduct().getProductID())!=null) {
			Item i= getIteamById(t.getProduct().getProductID());
			i.setQuantity(i.getQuantity()+t.getQuantity());
		}else {
			items.add(t);
		}
	}
	public void removeItem(int id) {
		if(getIteamById(id)!=null) {
			items.remove(getIteamById(id));
		}
	}
	public double getTotalMoney() {
		double t= 0;
		for (Item i : items) {
			t+=i.getQuantity()*i.getPrice();
		}
		return t;
	}
}
