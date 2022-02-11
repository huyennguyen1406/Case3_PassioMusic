package DAO;

import connection.MyConnection;
import model.Singer;
import model.SingerByRevenue;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BillDAO {
    MyConnection myConnection = new MyConnection();

    private final static String TOTAL_REVENUE = "select sum(song_price) from tbl_bill\n" +
            "inner join tbl_cartdetail on tbl_bill.id_cart = tbl_cartdetail.id_cart\n" +
            "inner join tbl_song on tbl_song.id_song = tbl_cartdetail.id_song;";
    private final static String SELECT_SINGER_BY_REVENUE = "select sing_name,sing_phoneNumber,sing_email,sing_address,sum(song_price) from tbl_bill\n" +
            "inner join tbl_cartdetail on tbl_bill.id_cart = tbl_cartdetail.id_cart\n" +
            "inner join tbl_song on tbl_cartdetail.id_song = tbl_song.id_song\n" +
            "right join tbl_singer on tbl_song.id_sing = tbl_singer.id_sing\n" +
            "group by tbl_singer.id_sing;";

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
                String name = resultSet.getString(1);
                String phoneNumber = resultSet.getString(2);
                String email = resultSet.getString(3);
                String address = resultSet.getString(4);
                double revenue = resultSet.getDouble(5);
                Singer singer = new Singer(name, phoneNumber, email, address);
                singerByRevenues.add(new SingerByRevenue(singer, revenue));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return singerByRevenues;
    }
}
