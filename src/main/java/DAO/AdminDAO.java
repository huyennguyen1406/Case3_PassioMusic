package DAO;

import connection.MyConnection;
import model.Account;
import model.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {
    MyConnection myConnection = new MyConnection();

    private static final String SELECT_ADMIN_BY_ID = "select * from tbl_account where id_acc = ?";

    public Admin getAdminById(int id){
        Admin account = null;
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ADMIN_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idAdmin = resultSet.getInt(1);
                String userName = resultSet.getString(2);
                String password = resultSet.getString(3);
                int idRole = resultSet.getInt(4);
                account = new Admin(idAdmin,userName,password,idRole);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

}
