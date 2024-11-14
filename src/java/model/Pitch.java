/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */

public class Pitch {
    private String pitchID;
    private int pitchType;
    private int status;
    private String image;
    private String date;
    private int price;
    private float pricePitch;
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Pitch(String pitchID, int pitchType, int status, String image, String date, int price) {
        this.pitchID = pitchID;
        this.pitchType = pitchType;
        this.status = status;
        this.image = image;
        this.date = date;
        this.price = price;
    }
    public Pitch(String pitchID, int pitchType, int status, String image, String date, float pricePitch) {
        this.pitchID = pitchID;
        this.pitchType = pitchType;
        this.status = status;
        this.image = image;
        this.date = date;
        this.pricePitch = pricePitch;
    }
    public Pitch(String pitchID, int pitchType, int status, String image) {
        this.pitchID = pitchID;
        this.pitchType = pitchType;
        this.status = status;
        this.image = image;
       
    }
    
    public Pitch(String pitchID, int pitchType, int status, String image, int price) {
        this.pitchID = pitchID;
        this.pitchType = pitchType;
        this.status = status;
        this.image = image;
        this.price = price;
    }
    public Pitch(String pitchID, int pitchType, int status, String image, float price) {
        this.pitchID = pitchID;
        this.pitchType = pitchType;
        this.status = status;
        this.image = image;
        this.pricePitch = price;
    }
    public Pitch() {
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
   
    // Getters and setters
    public String getPitchID() {
        return pitchID;
    }

    public void setPitchID(String pitchID) {
        this.pitchID = pitchID;
    }

    public int getPitchType() {
        return pitchType;
    }

    public void setPitchType(int pitchType) {
        this.pitchType = pitchType;
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

    public float getPricePitch() {
        return pricePitch;
    }

    public void setPricePitch(float pricePitch) {
        this.pricePitch = pricePitch;
    }

    @Override
    public String toString() {
        return "Pitch{" + "pitchID=" + pitchID + ", pitchType=" + pitchType + ", status=" + status + ", image=" + image + ", date=" + date + ", pricePitch=" + pricePitch + '}';
    }
    
}
