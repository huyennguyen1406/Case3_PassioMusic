package model;

import java.util.ArrayList;

public class Song {
    private int id;
    private String nameSong;
    private int singerId;
    private String linkSong;
    private String linkImg;
    private double price;

    public Song(int idCart, ArrayList<Song> songs, int idUser) {
    }

    public Song(int id, String nameSong, double price) {
        this.id = id;
        this.nameSong = nameSong;
        this.price = price;
    }

    public Song(int id, String nameSong, String linkSong, String linkImg, double price) {
        this.id = id;
        this.nameSong = nameSong;
        this.linkSong = linkSong;
        this.linkImg = linkImg;
        this.price = price;
    }

    public Song(int id, String nameSong, int singerId, String linkSong, String linkImg, double price) {
        this.id = id;
        this.nameSong = nameSong;
        this.singerId = singerId;
        this.linkSong = linkSong;
        this.linkImg = linkImg;
        this.price = price;
    }

    public Song(String nameSong, int singerId, String linkSong, String linkImg, double price) {
        this.nameSong = nameSong;
        this.singerId = singerId;
        this.linkSong = linkSong;
        this.linkImg = linkImg;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameSong() {
        return nameSong;
    }

    public void setNameSong(String nameSong) {
        this.nameSong = nameSong;
    }

    public int getSingerId() {
        return singerId;
    }

    public void setSingerId(int singerId) {
        this.singerId = singerId;
    }

    public String getLinkSong() {
        return linkSong;
    }

    public void setLinkSong(String linkSong) {
        this.linkSong = linkSong;
    }

    public String getLinkImg() {
        return linkImg;
    }

    public void setLinkImg(String linkImg) {
        this.linkImg = linkImg;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
