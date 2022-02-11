package DAO;

import connection.MyConnection;
import model.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {
    MyConnection myConnection = new MyConnection();

    private static final String SELECT_ADMIN_BY_NAME = "select * from tbl_account where id = ?";


}
