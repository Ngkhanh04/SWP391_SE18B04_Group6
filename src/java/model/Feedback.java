/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hokha
 */
public class Feedback {
    
    private String name;
    private String rating;
    private String comment;

    public Feedback() {
    }


    public Feedback(String name, String rating, String comment) {
        this.name = name;
        this.rating = rating;
        this.comment = comment;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Feedback from " + name + ": " + rating + " stars. Comment: " + comment;
    }
}
