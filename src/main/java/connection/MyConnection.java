package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {

    private final String url = "jdbc:mysql://localhost:3306/case_modules_3?useSSL=false";
    private final String userName = "root";
    private final String passWord = "12345678";

    public Connection getConnection() {
        Connection myConnection = null;
        try {
            // đổi class hiện tại về quản lý như 1 drive
            Class.forName("com.mysql.cj.jdbc.Driver");
            //quản lý connection vs driver manager
            myConnection = DriverManager.getConnection(url, userName, passWord);
        } catch (SQLException  e) {
            System.err.println(e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return myConnection;
    }
}
