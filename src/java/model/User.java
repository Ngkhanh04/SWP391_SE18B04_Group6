/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class User {

    private int id, role, otp;
    private String email, password, username, phonenumber;
    private double amount;

    public User() {
    }
    
    public User(int role, int otp, int id,  String username, String email, String password, String phoneNumber, String name) {
        this.role = role;
        this.otp = otp;
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phonenumber = phoneNumber;
        this.username = name;
    }

    public User(int id, String email, String password, int role, String username, String phoneNumber) {
        this.role = role;        
        this.id = id;
        this.email = email;
        this.password = password;
        this.username = username;
    }    
    
    public User(int id, int role, int otp, String email, String password, double amount) {
        this.id = id;
        this.role = role;
        this.otp = otp;
        this.email = email;
        this.password = password;
        this.amount = amount;
    }

    public double getAmount() {
        return amount;
    }

    public User(int id, String username, String email, String password, String phoneNumber){
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phonenumber = phoneNumber;
    }    
    
    public void setAmount(double amount) {
        this.amount = amount;
    }
    
    public User(int role, int id, String email, String password) {
        this.role = role;
        
        this.id = id;
        this.email = email;
        this.password = password;
    }
    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getOtp() {
        return otp;
    }

    public void setOtp(int otp) {
        this.otp = otp;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername(){
        return username;
    }
    public void setUsername(String username){
        this.username = username;
    }
    public String getName(){
        return username;
    }
    public void setName(String name){
        this.username = name;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() { // Ensure you have this method
        return phonenumber;
    }

    public void setPhoneNumber(String phoneNumber) { // Ensure you have this method
        this.phonenumber = phoneNumber;
    }

}
