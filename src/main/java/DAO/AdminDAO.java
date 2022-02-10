package DAO;

import connection.MyConnection;
import model.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminDAO implements IManageDAO<Admin> {
    MyConnection myConnection = new MyConnection();

    private static final String GET_ROLES = "select id_role from tbl_account where userName = ? and password = ?;";

    @Override
    public ArrayList<Admin> getAll() {
        return null;
    }

    @Override
    public ArrayList<Admin> findByName() {
        return null;
    }

    @Override
    public Admin getById(int id) {
        return null;
    }

    @Override
    public boolean createCity(Admin admin) {
        return false;
    }

    @Override
    public void deleteCity(int id) {

    }

    @Override
    public void updateCity(Admin admin, int id) {

    }

    public int getRoles(String user, String passWord) {
        int role = 0;
        Connection connection = myConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ROLES);
            preparedStatement.setString(1, user);
            preparedStatement.setString(2, passWord);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                role = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return role;
    }
}
