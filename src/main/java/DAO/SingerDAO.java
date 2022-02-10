package DAO;

import model.Singer;

import java.util.ArrayList;

public class SingerDAO implements IManageDAO<Singer> {
    @Override
    public ArrayList<Singer> getAll() {
        return null;
    }

    @Override
    public ArrayList<Singer> findByName() {
        return null;
    }

    @Override
    public Singer getById(int id) {
        return null;
    }

    @Override
    public boolean createCity(Singer singer) {
        return false;
    }

    @Override
    public void deleteCity(int id) {

    }

    @Override
    public void updateCity(Singer singer, int id) {

    }
}
