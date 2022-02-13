package DAO;

import connection.MyConnection;
import model.Singer;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SingerDAO {
    MyConnection myConnection = new MyConnection();

    private static final String INSERT_SINGER = "insert into tbl_singer (id_sing,sing_name,sing_phoneNumber,sing_email,sing_address) values (?, ?, ?, ?, ?);";
    private static final String SELECT_SINGER_BY_ID = "select * from tbl_singer where id_sing = ?;";
    private static final String UPDATE_SINGER_INFORMATION = "UPDATE tbl_singer SET sing_name = ?, sing_phoneNumber = ?, sing_email = ?, sing_address = ? WHERE id_sing = ?;";


    public void addSinger(int id, String fullName, String phoneNumber, String email, String address) {
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SINGER);
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

    public Singer getSinger(int id) {
        Singer singer = null;
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SINGER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idSinger = resultSet.getInt(1);
                String fullName = resultSet.getString(2);
                String phoneNumber = resultSet.getString(3);
                String email = resultSet.getString(4);
                String address = resultSet.getString(5);
                singer = new Singer(id, fullName, phoneNumber, email, address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return singer;
    }

    public void updateSingerInformation(String nameSinger, String phoneNumber, String email, String address, int idSinger){
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SINGER_INFORMATION);
            preparedStatement.setString(1,nameSinger);
            preparedStatement.setString(2,phoneNumber);
            preparedStatement.setString(3,email);
            preparedStatement.setString(4,address);
            preparedStatement.setInt(5,idSinger);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
