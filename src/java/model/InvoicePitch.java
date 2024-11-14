/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class InvoicePitch {
    private int invoicePitchID;
    private Pitch pitchID;
    private TotalInvoicePitch totalInvoicePitchID;
    private BookingTime bookingTimeID;
    private int price;
    private String bookTime;
    private String pitchType;
    private String dateOfBooking;
    
    public InvoicePitch() {
        
    }

    public InvoicePitch(Pitch pitchID, int price, String bookTime, String pitchType) {
        this.pitchID = pitchID;
        this.price = price;
        this.bookTime = bookTime;
        this.pitchType = pitchType;
    }
    public InvoicePitch(int invoicePitchID, Pitch pitchID, TotalInvoicePitch totalInvoicePitchID, BookingTime bookingTimeID, String dateOfBooking) {
        this.invoicePitchID = invoicePitchID;
        this.pitchID = pitchID;
        this.totalInvoicePitchID = totalInvoicePitchID;
        this.bookingTimeID = bookingTimeID;
        this.dateOfBooking = dateOfBooking;
    }
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getBookTime() {
        return bookTime;
    }

    public void setBookTime(String bookTime) {
        this.bookTime = bookTime;
    }

    public String getPitchType() {
        return pitchType;
    }

    public void setPitchType(String pitchType) {
        this.pitchType = pitchType;
    }



    public int getInvoicePitchID() {
        return invoicePitchID;
    }

    public void setInvoicePitchID(int invoicePitchID) {
        this.invoicePitchID = invoicePitchID;
    }

    public Pitch getPitchID() {
        return pitchID;
    }

    public void setPitchID(Pitch pitchID) {
        this.pitchID = pitchID;
    }

    public TotalInvoicePitch getTotalInvoicePitchID() {
        return totalInvoicePitchID;
    }

    public void setTotalInvoicePitchID(TotalInvoicePitch totalInvoicePitchID) {
        this.totalInvoicePitchID = totalInvoicePitchID;
    }

    public BookingTime getBookingTimeID() {
        return bookingTimeID;
    }

    public void setBookingTimeID(BookingTime bookingTimeID) {
        this.bookingTimeID = bookingTimeID;
    }

    public String getDateOfBooking() {
        return dateOfBooking;
    }

    public void setDateOfBooking(String dateOfBooking) {
        this.dateOfBooking = dateOfBooking;
    }

   
    
    
}