package model;

import java.util.ArrayList;

public class Cart {
    private int id;
    private ArrayList<Song> songs;
    private int idUser;

    public Cart() {
    }

    public Cart(int idUser) {
        this.idUser = idUser;
    }

    public Cart(int id, int idUser) {
        this.id = id;
        this.idUser = idUser;
    }

    public Cart(int id, ArrayList<Song> songs, int idUser) {
        this.id = id;
        this.songs = songs;
        this.idUser = idUser;
    }

    public Cart(ArrayList<Song> songs, int idUser) {
        this.songs = songs;
        this.idUser = idUser;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ArrayList<Song> getSongs() {
        return songs;
    }

    public void setSongs(ArrayList<Song> songs) {
        this.songs = songs;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }
}
