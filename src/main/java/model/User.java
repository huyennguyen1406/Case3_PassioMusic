package model;

import java.util.Date;

public class User {
    private int id;
    private String name;
    private String password;
    private Date dob;
    private String phoneNumber;
    private String mail;
    private String address;

    public User() {
    }

    public User(int id, String name, String password, Date dob, String phoneNumber, String mail, String address) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.dob = dob;
        this.phoneNumber = phoneNumber;
        this.mail = mail;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
