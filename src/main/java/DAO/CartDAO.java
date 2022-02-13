package DAO;

import connection.MyConnection;
import model.Cart;
import model.Song;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CartDAO {
    MyConnection myConnection = new MyConnection();

    private static final String GET_FINAL_CART_ID_BY_ID_USER = "select max(id_cart) from tbl_cart where id_user = ?;";
    private static final String ADD_NEW_CART_USER = "INSERT INTO tbl_cart (id_user) VALUES (?);";
    private static final String GET_CART_BY_ID_USER = "select tbl_song.id_song,song_name,song_link,song_img,song_price,sing_name,tbl_user.id_user,tbl_cart.id_cart from tbl_cart\n" +
            "inner join tbl_cartdetail on tbl_cart.id_cart = tbl_cartdetail.id_cart \n" +
            "inner join tbl_song on tbl_song.id_song = tbl_cartdetail.id_song\n" +
            "inner join tbl_singer on tbl_singer.id_sing = tbl_song.id_sing\n" +
            "inner join tbl_user on tbl_cart.id_user = tbl_user.id_user\n" +
            "where tbl_cart.id_user = ? and tbl_cart.id_cart = (select max(id_cart) from tbl_cart where id_user = ?);";
    private static final String ADD_TO_CART = "INSERT INTO tbl_cartdetail (id_song, id_cart) VALUES (?, ?);";

    public void addToCart(int idSong, int idCart){
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_TO_CART);
            preparedStatement.setInt(1, idSong);
            preparedStatement.setInt(2, idCart);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Cart getCartByIdUser(int idUser) {
        Cart cart = null;
        ArrayList<Song> songs = new ArrayList<>();
        int idCart = 0;
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_CART_BY_ID_USER);
            preparedStatement.setInt(1, idUser);
            preparedStatement.setInt(2, idUser);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idSong = resultSet.getInt(1);
                String songName = resultSet.getString(2);
                String songLink = resultSet.getString(3);
                String songImg = resultSet.getString(4);
                double songPrice = resultSet.getDouble(5);
                idCart = resultSet.getInt(8);
                songs.add(new Song(idSong, songName, songLink, songImg, songPrice));
            }
            cart = new Cart(idCart, songs, idUser);
//            String singName = resultSet.getString(6);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }

    public void addNewCartUser(int idUser) {
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_NEW_CART_USER);
            preparedStatement.setInt(1, idUser);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getFinalCartIdByIdUser(int idUser) {
        int idCart = 0;
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_FINAL_CART_ID_BY_ID_USER);
            preparedStatement.setInt(1, idUser);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                idCart = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idCart;
    }
}
