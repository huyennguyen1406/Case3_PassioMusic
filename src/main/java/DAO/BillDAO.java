package DAO;

import connection.MyConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BillDAO {
    MyConnection myConnection = new MyConnection();

    private final static String TOTAL_REVENUE = "select sum(song_price) from tbl_bill\n" +
            "inner join tbl_cartdetail on tbl_bill.id_cart = tbl_cartdetail.id_cart\n" +
            "inner join tbl_song on tbl_song.id_song = tbl_cartdetail.id_song;";

    public double getTotalRevenue(){
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
}
