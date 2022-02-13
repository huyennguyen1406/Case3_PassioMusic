package model;

public class Account {
    private int id;
    private String userName;
    private String password;
    private int idRole;

    public Account() {
    }

    public Account(int id) {
        this.id = id;
    }

    public Account(int id, String userName, String password, int idRole) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.idRole = idRole;
    }

    public Account(String userName, String password, int idRole) {
        this.userName = userName;
        this.password = password;
        this.idRole = idRole;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }
}
