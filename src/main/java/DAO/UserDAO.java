package DAO;

import model.User;

import java.util.ArrayList;

public class UserDAO implements IManageDAO<User> {
    @Override
    public ArrayList<User> getAll() {
        return null;
    }

    @Override
    public ArrayList<User> findByName() {
        return null;
    }

    @Override
    public User getById(int id) {
        return null;
    }

    @Override
    public boolean createCity(User user) {
        return false;
    }

    @Override
    public void deleteCity(int id) {

    }

    @Override
    public void updateCity(User user, int id) {

    }
}
