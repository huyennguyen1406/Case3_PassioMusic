package model;

public class Singer extends Account {
    private String nameSinger;
    private Long phoneNumber;
    private String email;
    private String address;

    public Singer() {
    }

    public Singer(String userName, String password, int idRole, String nameSinger, Long phoneNumber, String email, String address) {
        super(userName, password, idRole);
        this.nameSinger = nameSinger;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
    }

    public Singer(int id, String userName, String password, int idRole, String nameSinger, Long phoneNumber, String email, String address) {
        super(id, userName, password, idRole);
        this.nameSinger = nameSinger;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
    }

    public String getNameSinger() {
        return nameSinger;
    }

    public void setNameSinger(String nameSinger) {
        this.nameSinger = nameSinger;
    }

    public Long getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Long phoneNumber) {
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
