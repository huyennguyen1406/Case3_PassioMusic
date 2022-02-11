package DAO;

import connection.MyConnection;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    MyConnection myConnection = new MyConnection();

    private static final String INSERT_USER = "insert into tbl_user (id_user,user_name,user_phoneNumber,user_email,user_address) values (?, ?, ?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select * from tbl_user where id_user = ?;";

    public void addUser(int id, String fullName, String phoneNumber, String email, String address) {
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER);
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, fullName);
            preparedStatement.setString(3, phoneNumber);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, address);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getUser(int id) {
        User user = null;
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String fullName = resultSet.getString(2);
                String phoneNumber = resultSet.getString(3);
                String email = resultSet.getString(4);
                String address = resultSet.getString(5);
                user = new User(fullName, phoneNumber, email, address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

}
