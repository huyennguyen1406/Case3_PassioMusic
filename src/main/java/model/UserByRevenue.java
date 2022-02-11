package model;

public class UserByRevenue {
    private User user;
    private double revenue;

    public UserByRevenue(User user, double revenue) {
        this.user = user;
        this.revenue = revenue;
    }

    public UserByRevenue() {
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }
}
