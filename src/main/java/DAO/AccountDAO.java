package DAO;

import connection.MyConnection;
import model.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AccountDAO {
    MyConnection myConnection = new MyConnection();

    private static final String SELECT_ALL_ACCOUNT = "select * from tbl_account;";
    private static final String SELECT__ACCOUNT_BY_NAME = "select * from tbl_account where userName = ? and password = ?;";
    private static final String INSERT_ACCOUNT = "insert into tbl_account (userName,password,id_role) values (?, ?, ?);";
    private static final String SELECT_ID_ACCOUNT = "select id_acc from tbl_account where userName = ? and password = ?;";
    private static final String SELECT_ID_ROLE_ACCOUNT = "select id_role from tbl_account where userName = ? and password = ?;";
    private static final String TOTAL_SINGER = "select count(id_acc) from tbl_account where id_role = 2;";
    private static final String TOTAL_USER = "select count(id_acc) from tbl_account where id_role = 3;";

    public void addAccount(Account account) {
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ACCOUNT);
            preparedStatement.setString(1, account.getUserName());
            preparedStatement.setString(2, account.getPassword());
            preparedStatement.setInt(3, account.getIdRole());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Account getAccount(String userName, String password){
        Account account = null;
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT__ACCOUNT_BY_NAME);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
//                String userNameGet = resultSet.getString(2);
//                String passwordGet = resultSet.getString(3);
                int idRole = resultSet.getInt(4);
                account = new Account(id,userName,password,idRole);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    public ArrayList<Account> displayAllAccount() {
        ArrayList<Account> accounts = new ArrayList<>();
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ACCOUNT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String userName = resultSet.getString(2);
                String password = resultSet.getString(3);
                int idRole = resultSet.getInt(4);
                accounts.add(new Account(id,userName,password,idRole));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accounts;
    }

    public boolean checkAccount(String userName, String password) {
        ArrayList<Account> accounts = displayAllAccount();
        for (Account account:accounts) {
            if (account.getUserName().equalsIgnoreCase(userName) && account.getPassword().equalsIgnoreCase(password)){
                return true;
            }
        }
        return false;
    }

    public int getAccountId(String userName,String password) {
        int id = 0;
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ID_ACCOUNT);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                id = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    public int getAccountRole(String userName,String password){
        int idRole = 0;
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ID_ROLE_ACCOUNT);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                idRole = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idRole;
    }

    public int getTotalSinger(){
        int totalSinger = 0;
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(TOTAL_SINGER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                totalSinger = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalSinger;
    }

    public int getTotalUser(){
        int totalSinger = 0;
        try {
            Connection connection = myConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(TOTAL_USER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                totalSinger = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalSinger;
    }
}
