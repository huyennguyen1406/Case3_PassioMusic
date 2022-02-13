package DAO;

import connection.MyConnection;
import model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class BillDAO {
    MyConnection myConnection = new MyConnection();

    private final static String TOTAL_REVENUE = "select sum(song_price) from tbl_bill\n" +
            "inner join tbl_cartdetail on tbl_bill.id_cart = tbl_cartdetail.id_cart\n" +
            "inner join tbl_song on tbl_song.id_song = tbl_cartdetail.id_song;";
    private final static String SELECT_SINGER_BY_REVENUE = "select tbl_singer.id_sing,sing_name,sing_phoneNumber,sing_email,sing_address,sum(song_price) from tbl_bill\n" +
            "inner join tbl_cartdetail on tbl_bill.id_cart = tbl_cartdetail.id_cart\n" +
            "inner join tbl_song on tbl_cartdetail.id_song = tbl_song.id_song\n" +
            "right join tbl_singer on tbl_song.id_sing = tbl_singer.id_sing\n" +
            "group by tbl_singer.id_sing;";
    private final static String SELECT_USER_BY_REVENUE = "select user_name, user_phoneNumber, user_email, user_address, sum(song_price) as \"total_cash\" from tbl_song \n" +
            "join tbl_cartdetail on tbl_song.id_song = tbl_cartdetail.id_song\n" +
            "join tbl_cart on tbl_cartdetail.id_cart = tbl_cart.id_cart\n" +
            "join tbl_bill on tbl_cart.id_cart = tbl_bill.id_cart\n" +
            "right join tbl_user on tbl_user.id_user = tbl_cart.id_user\n" +
            "group by tbl_user.id_user;";
    private final static String GET_BILL_BY_USER_ID = "select * from tbl_bill\n" +
            "inner join tbl_cart on tbl_cart.id_cart = tbl_bill.id_cart\n" +
            " where id_user = ?;";
    private final static String ADD_BILL = "INSERT INTO tbl_bill (id_cart, created_at) VALUES (?, ?);";

    public java.sql.Date addBill(int idCart, java.sql.Date dateCreate){
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_BILL);
            preparedStatement.setInt(1,idCart);
            preparedStatement.setDate(2, dateCreate);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Bill> getBillListByUserId(int idUser){
        ArrayList<Bill> bills = new ArrayList<>();
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_BILL_BY_USER_ID);
            preparedStatement.setInt(1,idUser);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idBill = resultSet.getInt(1);
                int idCart = resultSet.getInt(2);
                Date dateCreat = resultSet.getDate(3);
                bills.add(new Bill(idBill,idCart,dateCreat));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bills;
    }

    public double getTotalRevenue() {
        double totalRevenue = 0;
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(TOTAL_REVENUE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                totalRevenue = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRevenue;
    }

    public ArrayList<SingerByRevenue> getSingerListByRevenue() {
        ArrayList<SingerByRevenue> singerByRevenues = new ArrayList<>();
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SINGER_BY_REVENUE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                String phoneNumber = resultSet.getString(3);
                String email = resultSet.getString(4);
                String address = resultSet.getString(5);
                double revenue = resultSet.getDouble(6);
                Singer singer = new Singer(id, name, phoneNumber, email, address);
                singerByRevenues.add(new SingerByRevenue(singer, revenue));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return singerByRevenues;
    }

    public ArrayList<UserByRevenue> getUserListByRevenue() {
        ArrayList<UserByRevenue> userByRevenues = new ArrayList<>();
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_REVENUE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString(1);
                String phoneNumber = resultSet.getString(2);
                String email = resultSet.getString(3);
                String address = resultSet.getString(4);
                double revenue = resultSet.getDouble(5);
                User user = new User(name, phoneNumber, email, address);
                userByRevenues.add(new UserByRevenue(user,revenue));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userByRevenues;
    }
}
