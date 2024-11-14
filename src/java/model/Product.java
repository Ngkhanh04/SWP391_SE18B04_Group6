/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hokha
 */
public class Product {
    private int product_id;
    private String product_name;
    private String product_image;
    private Double product_price;
    private int quantity;
    private String product_title;
    private String product_detail;

    public Product() {
    }

    public Product(int product_id, String product_name, String product_image, Double product_price, int quantity, String product_title, String product_detail) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_image = product_image;
        this.product_price = product_price;
        this.quantity = quantity;
        this.product_title = product_title;
        this.product_detail = product_detail;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_image() {
        return product_image;
    }

    public void setProduct_image(String product_image) {
        this.product_image = product_image;
    }

    public Double getProduct_price() {
        return product_price;
    }

    public void setProduct_price(Double product_price) {
        this.product_price = product_price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProduct_title() {
        return product_title;
    }

    public void setProduct_title(String product_title) {
        this.product_title = product_title;
    }

    public String getProduct_detail() {
        return product_detail;
    }

    public void setProduct_detail(String product_detail) {
        this.product_detail = product_detail;
    }

    @Override
    public String toString() {
        return "Product{" + "product_id=" + product_id + ", product_name=" + product_name + ", product_image=" + product_image + ", product_price=" + product_price + ", quantity=" + quantity + ", product_title=" + product_title + ", product_detail=" + product_detail + '}';
    }
    
}
