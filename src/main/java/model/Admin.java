package model;

public class Admin extends Account{

    public Admin() {
    }

    public Admin(int id, String userName, String password, int idRole) {
        super(id, userName, password, idRole);
    }

    public Admin(String userName, String password, int idRole) {
        super(userName, password, idRole);
    }



}
