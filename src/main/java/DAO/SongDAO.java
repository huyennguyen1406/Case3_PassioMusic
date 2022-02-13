package DAO;

import connection.MyConnection;
import model.Song;
import model.SongByDownload;

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
    private static final String DELETE_SONG_BY_SONG_ID = "UPDATE tbl_song SET song_name = '', song_link = '', song_img = '', song_price = 0 WHERE id_song = ?;";
    private static final String ADD_NEW_SONG = "INSERT INTO tbl_song (song_name, id_sing, song_link, song_img, song_price) VALUES (?, ?, ?, ?, ?);";

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
            preparedStatement.setString(1,song_name);
            preparedStatement.setInt(2,idSinger);
            preparedStatement.setString(3,song_link);
            preparedStatement.setString(4,song_img);
            preparedStatement.setDouble(5,price);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
