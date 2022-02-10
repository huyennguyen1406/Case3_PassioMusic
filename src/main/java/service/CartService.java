package service;

import model.Cart;
import model.Song;

import java.util.ArrayList;

public class CartService {
    private final static ArrayList<Cart> carts = new ArrayList<>();

    public ArrayList<Cart> getCarts() {
        return carts;
    }

    public void addSongToCart(Song song) {
        boolean check = false;
        for (Cart cart : carts) {
            if (cart.getSong().getId() == song.getId());
        }

        if (!check) {
            Cart cart = new Cart(song);
            carts.add(cart);
        }
    }

    public void deleteCartById(int id) {
        Cart cartDel = null;
        for (Cart cart : carts) {
            if (cart.getSong().getId() == id) {
                cartDel = cart;
            }
        }
        if (cartDel != null) {
            carts.remove(cartDel);
        }
    }

    public Double payMoney() {
        double sum = 0;
        for (Cart cart : carts) {
            sum += cart.getSong().getPrice();
        }
        carts.clear();
        return sum;
    }

    public void addSong(Song song) {
    }

    public void deleteSongById(int id) {
    }

    public void deleteSingerById(int id) {
    }
}