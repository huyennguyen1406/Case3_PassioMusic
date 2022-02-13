package model;

public class SingerByRevenue {
    private Singer singer;
    private double revenue;

    public SingerByRevenue(Singer singer, double revenue) {
        this.singer = singer;
        this.revenue = revenue;
    }

    public SingerByRevenue() {
    }

    public Singer getSinger() {
        return singer;
    }

    public void setSinger(Singer singer) {
        this.singer = singer;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }
}
