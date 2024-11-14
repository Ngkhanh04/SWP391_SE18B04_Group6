package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import model.User;

public class UserDAO extends DBContext {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public boolean checkLogin(String email, String password) {
        String sql = "SELECT * FROM users WHERE user_email = ? AND user_password = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }

        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Lỗi khi kiểm tra đăng nhập: ", e);
        }

        return false;
    }
    public User getUserbyid(String uid) {
        String query = "SELECT * FROM [Users] WHERE userid = ?";
        try {
            conn = new DBContext().connection;
            ps = conn.prepareStatement(query);
            ps.setString(1, uid);
            rs = ps.executeQuery();

            while (rs.next()) {
                return new User(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int getUserIdByEmail(String email) {
        String sql = "SELECT userid FROM users WHERE user_email = ?";
        int userId = 0;  // Use String to hold the user ID
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                userId = rs.getInt("userid");  // Get as String
            }

        } catch (SQLException e) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Lỗi khi truy vấn userid theo email: ", e);
        }
        return userId;  // Return user ID as String, or null if not found
    }

    public User getUserByUserId(int user_id) {
        String sql = "SELECT * FROM users WHERE userid = ?";  // Assuming the 'users' table uses 'userid' as primary key
        User user = null;  // Initialize the User object

        try {
            PreparedStatement ps = connection.prepareStatement(sql);  // Prepare the statement
            ps.setInt(1, user_id);  // Set the user_id parameter

            ResultSet rs = ps.executeQuery();  // Execute the query

            if (rs.next()) {  // If a user is found
                user = new User();  // Create a new User object
                user.setId(rs.getInt("userid"));  // Set user ID
                user.setEmail(rs.getString("user_email"));  // Assuming you have a user_email field
                user.setPassword(rs.getString("user_password"));  // Assuming you have a user_password field
                user.setOtp(rs.getInt("otp"));  // Assuming you have an otp field
                user.setRole(rs.getInt("role_id"));  // Assuming you have a role_id field
            }

        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Lỗi khi truy vấn User theo user_id: ", e);
        }
        return user;  // Return the User object or null if not found
    }

    public boolean checkLoginGoogle(String email) {
        String sql = "SELECT * FROM users WHERE user_email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void addAccountByLoginGoogle(String email) {
        String sql = "INSERT INTO users (user_email, role_id) VALUES (?, ?)";  // Assume a default password or a method to generate one
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setInt(2, 2);  // Assuming 2 is the role ID for a regular user
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Error adding account by Google login: ", e);
        }
    }

    public void updateOtpById(int id, int otp) {
        String sql = "UPDATE users SET otp = ? WHERE userid = ?";  // Assuming you have an OTP field in the users table
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, otp);
            ps.setInt(2, id);  // Assuming userid is a String
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Error updating OTP by ID: ", e);
        }
    }

    public void changePassword(int user_id, String password) {
        String sql = "UPDATE users SET user_password = ? WHERE userid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setInt(2, user_id);  // Assuming userid is a String
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Error changing password: ", e);
        }
    }

    // Method to check if the email already exists
    public boolean checkEmailExists(String email) {
        String sql = "SELECT * FROM users WHERE user_email = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();  // Return true if the email exists
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Error checking if email exists: ", e);
        }
        return false;
    }

    // Method to register a new user
    public boolean registerUser(String email, String password) {
        // Before registering, check if the email already exists
        if (checkEmailExists(email)) {
            return false;  // If email exists, return false and stop registration
        }

        String sql = "INSERT INTO users (user_email, user_password, role_id) VALUES (?, ?, ?)";  
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setInt(3, 2);   // Assuming role_id is 2 for regular users, change accordingly

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;  // Return true if the user was successfully registered
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Error registering user: ", e);
        }
        return false;
    }
    
    public boolean checkExistedOtp(int otp) {
        String sql = "SELECT * FROM users WHERE otp = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, otp);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e.getMessage());
        }
        return false;
    }


    public User selectById1(int ID) {
        User ketQua = null;
        String  xPassWord, xEmail ;
        int xRole, xId;
        try {

            String sql = "SELECT * FROM users WHERE userID=?";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, ID);

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
               
                xPassWord = rs.getString("user_password");
                xId = rs.getInt("userID");
                xEmail = rs.getString("email");
                
                xRole = rs.getInt("roleID");
               
                ketQua = new User(xRole, xId, xPassWord, xEmail);
            }

            // Bước 5:
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }
    
        public boolean updateUser(User updatedUser) {
        String sql = "UPDATE Users SET user_email = ?, "
                + "user_password = ?, role_id = ?, "
                + "user_name = ?, user_phone = ? WHERE userid = ?"; // Đảm bảo bảng tên là Users
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, updatedUser.getEmail());
            ps.setString(2, updatedUser.getPassword());
            ps.setInt(3, updatedUser.getRole());
            ps.setString(4, updatedUser.getUsername());
            ps.setString(5, updatedUser.getPhoneNumber());
            ps.setInt(6, updatedUser.getId());
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu update thành công
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Error updating user: ", e);
        }
        return false; 
    }
    
        public static void main(String[] args) {
    UserDAO dao = new UserDAO();
    int id = 1; // ID của người dùng mà bạn muốn lấy thông tin
    User user = dao.getUserByUserId(id); // Lấy thông tin người dùng theo ID

    // Kiểm tra xem người dùng có tồn tại không
    if (user != null) {
        System.out.println("User ID: " + user.getId());
        System.out.println("Name: " + user.getEmail());
        System.out.println("Password: " + user.getPassword());
        // Thêm các thuộc tính khác nếu cần
    } else {
        System.out.println("Không tìm thấy người dùng với ID: " + id);
    }
}

}
