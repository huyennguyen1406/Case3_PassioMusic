package model;

public class SongBySinger {
    private Song song;
    private String nameSinger;

    public SongBySinger(Song song, String nameSinger) {
        this.song = song;
        this.nameSinger = nameSinger;
    }

    public Song getSong() {
        return song;
    }

    public void setSong(Song song) {
        this.song = song;
    }

    public String getNameSinger() {
        return nameSinger;
    }

    public void setNameSinger(String nameSinger) {
        this.nameSinger = nameSinger;
    }
}
