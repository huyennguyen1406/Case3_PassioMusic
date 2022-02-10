package model;

public class Cart {
    private int id;
    private Song song;
    private int idUser;

    public Cart() {
    }

    public Cart(int id, Song song, int idUser) {
        this.id = id;
        this.song = song;
        this.idUser = idUser;
    }

    public Cart(Song song, int idUser) {
        this.song = song;
        this.idUser = idUser;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Song getSong() {
        return song;
    }

    public void setSong(Song song) {
        this.song = song;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }
}
