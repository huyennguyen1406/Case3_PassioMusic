package DAO;

import java.util.ArrayList;

public interface IManageDAO<T>{
    ArrayList<T> getAll();

    ArrayList<T> findByName();

    T getById(int id);

    boolean createCity(T t);

    void deleteCity(int id);

    void updateCity(T t, int id);
}
