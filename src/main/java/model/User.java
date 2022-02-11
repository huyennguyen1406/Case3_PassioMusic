package model;

public class User extends Account {
    private String nameUser;
    private String phoneNumber;
    private String email;
    private String address;

    public User() {
    }

    public User(int id, String userName, String password, int idRole, String nameUser, String phoneNumber, String email, String address) {
        super(id, userName, password, idRole);
        this.nameUser = nameUser;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
    }

    public User(String nameUser, String phoneNumber, String email, String address) {
        this.nameUser = nameUser;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
    }

    public User(String userName, String password, int idRole, String nameUser, String phoneNumber, String email, String address) {
        super(userName, password, idRole);
        this.nameUser = nameUser;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
    }

    public String getNameUser() {
        return nameUser;
    }

    public void setNameUser(String nameUser) {
        this.nameUser = nameUser;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
