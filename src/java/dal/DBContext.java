package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    public Connection connection;

    public DBContext() {
        try {
            String user = "sa";
            String pass = "1234";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=TSField_4;trustServerCertificate=True";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean checkConnection() {
        try {
            return connection != null && !connection.isClosed();
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, "Lỗi khi kiểm tra kết nối: ", e);
            return false;
        }
    }

    public static void main(String[] args) {
        // Tạo đối tượng DBContext
        DBContext dbContext = new DBContext();

        // Kiểm tra kết nối
        if (dbContext.checkConnection()) {
            System.out.println("Kết nối tới cơ sở dữ liệu thành công!");
        } else {
            System.out.println("Không thể kết nối tới cơ sở dữ liệu.");
        }
    }

}
