/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Field {
    private String FieldID;
   
    private int status;
    private String image;
    private String date;
    private int price;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Field
        (String FieldID,  int status, String image, String date, int price) {
        this.FieldID = FieldID;
       
        this.status = status;
        this.image = image;
        this.date = date;
        this.price = price;
    }

    public Field(String FieldID,  int status, String image) {
        this.FieldID = FieldID;
       
        this.status = status;
        this.image = image;
       
    }
    
    public Field(String FieldID,  int status, String image, int price) {
        this.FieldID = FieldID;
      
        this.status = status;
        this.image = image;
        this.price = price;
    }

    public Field() {
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
   
    // Getters and setters
    public String getPitchID() {
        return FieldID;
    }

    public void setPitchID(String pitchID) {
        this.FieldID = pitchID;
    }

  

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}

