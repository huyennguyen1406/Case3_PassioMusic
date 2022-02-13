package model;

public class SongByDownload {
    private Song song;
    private int numberOfDownload;

    public SongByDownload() {
    }

    public SongByDownload(Song song, int numberOfDownload) {
        this.song = song;
        this.numberOfDownload = numberOfDownload;
    }

    public Song getSong() {
        return song;
    }

    public void setSong(Song song) {
        this.song = song;
    }

    public int getNumberOfDownload() {
        return numberOfDownload;
    }

    public void setNumberOfDownload(int numberOfDownload) {
        this.numberOfDownload = numberOfDownload;
    }
}
