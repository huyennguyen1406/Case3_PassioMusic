package DAO;

import connection.MyConnection;
import model.Song;
import model.SongByDownload;
import model.SongBySinger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SongDAO {
    MyConnection myConnection = new MyConnection();

    private static final String GET_SONG_BY_SINGER_ID = "select * from tbl_song where id_sing = ?;";
    private static final String GET_SONG_SPECIFIC_BY_SINGER_ID = "select tbl_song.id_song,id_sing,song_name,count(id_cart),song_price from tbl_song\n" +
            "left join tbl_cartdetail on tbl_song.id_song = tbl_cartdetail.id_song\n" +
            "group by id_song having id_sing = ?;";
    private static final String GET_SONG_BY_ID_SONG = "select * from tbl_song where id_song = ?";
    private static final String DELETE_SONG_BY_SONG_ID = "UPDATE tbl_song SET song_name = '', song_link = '', song_img = '', song_price = 0 WHERE id_song = ?;";
    private static final String ADD_NEW_SONG = "INSERT INTO tbl_song (song_name, id_sing, song_link, song_img, song_price) VALUES (?, ?, ?, ?, ?);";
    private static final String SONG_AND_SINGER_DETAIL = "SELECT id_song,song_name,song_link,song_img,song_price,sing_name FROM case_modules_3.tbl_song\n" +
            "left join tbl_singer on tbl_singer.id_sing = tbl_song.id_sing;";
    private static final String GET_SONG_BY_ID = "SELECT id_song,song_name,song_link,song_img,song_price,sing_name FROM case_modules_3.tbl_song\n" +
            "inner join tbl_singer on tbl_song.id_sing = tbl_singer.id_sing where id_song = ?;";
    private static final String GET_SONG_OWN = "SELECT tbl_song.id_song,song_name,song_link,song_img,song_price,sing_name FROM case_modules_3.tbl_bill\n" +
            "inner join tbl_cartdetail on tbl_bill.id_cart = tbl_cartdetail.id_cart\n" +
            "inner join tbl_cart on tbl_cart.id_cart = tbl_cartdetail.id_cart\n" +
            "inner join tbl_song on tbl_song.id_song = tbl_cartdetail.id_song\n" +
            "inner join tbl_singer on tbl_singer.id_sing = tbl_song.id_sing\n" +
            "where id_user = ?;";

    public ArrayList<SongBySinger> getSongOwn(int idUser) {
        ArrayList<SongBySinger> songBySingers = new ArrayList<>();
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_SONG_OWN);
            preparedStatement.setInt(1, idUser);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idSong = resultSet.getInt(1);
                String nameSong = resultSet.getString(2);
                String linkSong = resultSet.getString(3);
                String linkImg = resultSet.getString(4);
                double price = resultSet.getDouble(5);
                String nameSinger = resultSet.getString(6);
                songBySingers.add(new SongBySinger(new Song(idSong, nameSong, linkSong, linkImg, price), nameSinger));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return songBySingers;
    }

    public Song getSongByIdSong (int idSong){
        Song song = null;
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_SONG_BY_ID);
            preparedStatement.setInt(1, idSong);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
//                int id = resultSet.getInt(1);
                String songName = resultSet.getString(2);
                String songLink = resultSet.getString(4);
                String songImg = resultSet.getString(5);
                double songPrice = resultSet.getDouble(6);
                song = new Song(idSong,songName,songLink,songImg,songPrice);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return song;
    }

    public SongBySinger getSongById(int idSong) {
        SongBySinger song = null;
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_SONG_BY_ID);
            preparedStatement.setInt(1, idSong);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
//                int id = resultSet.getInt(1);
                String nameSong = resultSet.getString(2);
                String linkSong = resultSet.getString(3);
                String linkImg = resultSet.getString(4);
                double price = resultSet.getDouble(5);
                String nameSinger = resultSet.getString(6);
                song = (new SongBySinger(new Song(idSong, nameSong, linkSong, linkImg, price), nameSinger));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return song;
    }

    public ArrayList<SongBySinger> getSongAndSingerName() {
        ArrayList<SongBySinger> songBySingers = new ArrayList<>();
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SONG_AND_SINGER_DETAIL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idSong = resultSet.getInt(1);
                String nameSong = resultSet.getString(2);
                String linkSong = resultSet.getString(3);
                String linkImg = resultSet.getString(4);
                double price = resultSet.getDouble(5);
                String nameSinger = resultSet.getString(6);
                songBySingers.add(new SongBySinger(new Song(idSong, nameSong, linkSong, linkImg, price), nameSinger));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return songBySingers;
    }

    public ArrayList<Song> getSongBySingerId(int idSinger) {
        ArrayList<Song> songs = new ArrayList<>();
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_SONG_BY_SINGER_ID);
            preparedStatement.setInt(1, idSinger);
//            preparedStatement.executeUpdate();
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idSong = resultSet.getInt(1);
                String nameSong = resultSet.getString(2);
                double price = resultSet.getDouble(6);
                songs.add(new Song(idSong, nameSong, price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return songs;
    }

    public ArrayList<SongByDownload> getSongsDetailBySingerId(int idSinger) {
        ArrayList<SongByDownload> songByDownloads = new ArrayList<>();
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_SONG_SPECIFIC_BY_SINGER_ID);
            preparedStatement.setInt(1, idSinger);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idSong = resultSet.getInt(1);
                String nameSong = resultSet.getString(3);
                double price = resultSet.getDouble(5);
                int download = resultSet.getInt(4);
                Song song = new Song(idSong, nameSong, price);
                songByDownloads.add(new SongByDownload(song, download));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return songByDownloads;
    }

    public void deleteSongBySongId(int idSong) {
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SONG_BY_SONG_ID);
            preparedStatement.setInt(1, idSong);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addNewSong(String song_name, int idSinger, String song_link, String song_img, double price) {
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_NEW_SONG);
            preparedStatement.setString(1, song_name);
            preparedStatement.setInt(2, idSinger);
            preparedStatement.setString(3, song_link);
            preparedStatement.setString(4, song_img);
            preparedStatement.setDouble(5, price);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
