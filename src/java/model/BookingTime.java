/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class BookingTime {
    private int bookingTimeID;
    private String time;

    public BookingTime() {
    }

    public BookingTime(int bookingTimeID, String time) {
        this.bookingTimeID = bookingTimeID;
        this.time = time;
    }

    public int getBookingTimeID() {
        return bookingTimeID;
    }

    public void setBookingTimeID(int bookingTimeID) {
        this.bookingTimeID = bookingTimeID;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
    
}
