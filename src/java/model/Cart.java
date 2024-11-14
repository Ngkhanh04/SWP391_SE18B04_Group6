/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hokha
 */
public class Cart {
    private List<Item>items;
    public  Cart(){
        items= new ArrayList<>();
    }
  
    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    public Item getItembyId(int id){
        for (Item i : items) {
            if (i.getProduct().getProduct_id()==id) {
                return i;
            }
        }
        return null;
    }
    public int getQuantitybyId(int id){
    return getItembyId(id).getQuantity();
}
    public  void addItem(Item t){
        if (getItembyId(t.getProduct().getProduct_id())!=null) {
            Item i = getItembyId(t.getProduct().getProduct_id());
            i.setQuantity(i.getQuantity()+t.getQuantity());
        }else{
            items.add(t);
        }
    }
    public void removeItem(int id){
        if (getItembyId(id)!=null) {
            items.remove(getItembyId(id));
        }
    }
    public  double totalmoney(){
        double t =0;
        for (Item i : items) 
            t+=i.getQuantity()*i.getPrice();
            return t;
        
    }
}
