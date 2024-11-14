/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Product;
import java.sql.SQLException;
/**
 *
 * @author hokha
 */
public class ProductDao extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProdcut() {
        List<Product> List = new ArrayList<>();
        String query = "select*from [products]";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return List;
    }

    public Product getProductbyid(int pid) {
        String query = "SELECT * FROM [products] WHERE product_id = ?";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setInt(1, pid);
            rs = ps.executeQuery();

            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    //Category
    public List<Product> getfieldsbyCategory(String cid) {
        List<Product> List = new ArrayList<>();
        String query = "select*from [products] where category_id = ?";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();

            while (rs.next()) {
                List.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return List;
    }

    public List<Category> getallcategory() {
        List<Category> List = new ArrayList<>();
        String query = "select*from category";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                List.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return List;
    }

    public List<Product> Searchbyname(String Search) {
        List<Product> List = new ArrayList<>();
        String query = "select*from products where [product_name] like ?";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + Search + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                List.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return List;
    }

    public void DeleteProductbyId(String pid) {

        String query = "delete from products where product_id =?";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();

        } catch (Exception e) {
        }

    }

    public void CreateProduct(String productName, String productImage, String productPrice,
            String quantity, String productTitle, String productDetail,
            String categoryId) {

        String query = "INSERT INTO products (product_name, product_image, product_price,quantity, product_title, product_detail, category_id) VALUES (?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, productName);
            ps.setString(2, productImage);
            ps.setString(3, productPrice);
            ps.setString(4, quantity);
            ps.setString(5, productTitle);
            ps.setString(6, productDetail);
            ps.setString(7, categoryId);

            ps.executeUpdate();

        } catch (Exception e) {
        }

    }

  public void updateProduct(String productId, String productName, String productImage,
                          String productPrice, String quantity, String productTitle,
                          String productDetail, String categoryId) {
    String query = "UPDATE products SET product_name = ?, product_image = ?, product_price = ?, " +
                   "quantity = ?, product_title = ?, product_detail = ?, category_id = ? " +
                   "WHERE product_id = ?";

    try (Connection conn = new DBContext().connection;
         PreparedStatement ps = conn.prepareStatement(query)) {
        
        ps.setString(1, productName);
        ps.setString(2, productImage);
        ps.setString(3, productPrice);
        ps.setString(4, quantity);
        ps.setString(5, productTitle);
        ps.setString(6, productDetail);
        ps.setString(7, categoryId);
        ps.setString(8, productId);

        int rowsUpdated = ps.executeUpdate();
        if (rowsUpdated > 0) {
            System.out.println("Product updated successfully.");
        } else {
            System.out.println("No product found with the given ID.");
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Log the exception for debugging
    }
}
  
  // update after pay success
  public void updateQuantity(int idProduct, int quantity) {
      String sql = "UPDATE products SET quantity = ? WHERE product_id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            // Set parameters for the PreparedStatement
            statement.setInt(1, quantity); // Set the quantity
            statement.setInt(2, idProduct); // Set the product ID

            // Execute the update
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Successfully updated product quantity!");
            } else {
                System.out.println("Product not found with ID: " + idProduct);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions, such as database connection issues
            System.out.println("Error updating product quantity: " + e.getMessage());
        }
  }
  

public static void main(String[] args) {
    ProductDao dao = new ProductDao();
    dao.updateProduct("6", "3ne", "hayyyy", "50", "50", "q wdqdq", "wefweffewff", "3");
    System.out.println("Update operation executed.");
}

}
