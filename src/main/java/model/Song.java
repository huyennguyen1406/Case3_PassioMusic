package model;

public class Song {
    private int id;
    private String nameSong;
    private String singerName;
    private String linkSong;
    private String linkImg;
    private double price;

    public Song() {
    }

    public Song(int id, String nameSong, String singerName, String linkSong, String linkImg, double price) {
        this.id = id;
        this.nameSong = nameSong;
        this.singerName = singerName;
        this.linkSong = linkSong;
        this.linkImg = linkImg;
        this.price = price;
    }

    public Song(String nameSong, String singerName, String linkSong, String linkImg, double price) {
        this.nameSong = nameSong;
        this.singerName = singerName;
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

    public String getSingerName() {
        return singerName;
    }

    public void setSingerName(String singerName) {
        this.singerName = singerName;
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
