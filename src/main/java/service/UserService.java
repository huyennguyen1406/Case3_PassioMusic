package service;

import model.User;

import java.util.ArrayList;

public class UserService {
    private final static ArrayList<User> users = new ArrayList<>();
    public ArrayList<User> getUsers() {
        return users;
    }
}