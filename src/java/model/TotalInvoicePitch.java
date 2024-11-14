/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class TotalInvoicePitch {
    private int totalIvoiceID;
    private User userID;
    private Date bookTime;

    public TotalInvoicePitch() {
    }

    public TotalInvoicePitch(User userID, Date bookTime) {
        this.userID = userID;
        this.bookTime = bookTime;
    }

    public TotalInvoicePitch(int totalIvoiceID, User userID, Date bookTime) {
        this.totalIvoiceID = totalIvoiceID;
        this.userID = userID;
        this.bookTime = bookTime;
    }
    

    public int getTotalIvoiceID() {
        return totalIvoiceID;
    }

    public void setTotalIvoiceID(int totalIvoiceID) {
        this.totalIvoiceID = totalIvoiceID;
    }

    public User getUserID() {
        return userID;
    }

    public void setUserID(User userID) {
        this.userID = userID;
    }

    public Date getBookTime() {
        return bookTime;
    }

    public void setBookTime(Date bookTime) {
        this.bookTime = bookTime;
    }
    
    
}