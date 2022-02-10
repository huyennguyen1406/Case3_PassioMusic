package controller;

import model.Cart;
import model.Song;
import service.CartService;
import service.SongService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ControlServlet", value = "/home")
public class ControlServlet extends HttpServlet {
    private final SongService songService = new SongService();
    private final CartService cartService = new CartService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action(request, response);

    }

    private void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "detail":
                displayDetail(request, response);
                break;
            case "addToCart":
                addToCart(request, response);
                break;
            case "deleteCart":
                deleteCart(request, response);
                break;
            case "cart":
                displayAllOfCart(request, response);
                break;
            case "pay":
                payment(request, response);
                break;
            default:
                displayAllOfSong(request, response);
        }
    }

    private void payment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double money = cartService.payMoney();
        request.setAttribute("money", money);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
        requestDispatcher.forward(request, response);
    }

    private void deleteCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        cartService.deleteCartById(id);
        displayAllOfCart(request, response);
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Song song = songService.getSong();
        cartService.addSongToCart(song);
        displayAllOfSong(request, response);
    }

    private void displayDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Song song = songService.getSong();
        request.setAttribute("song", song);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view-detail.jsp");
        requestDispatcher.forward(request, response);
    }

    private void displayAllOfSong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Song songs = songService.getSong();
        request.setAttribute("songs", songs);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void displayAllOfCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Cart> carts = cartService.getCarts();
        request.setAttribute("carts", carts);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
        requestDispatcher.forward(request, response);
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Cart> carts = cartService.getCarts();
        request.setAttribute("user", createUser());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart.jsp");
        requestDispatcher.forward(request, response);
    }

    private Object createUser() {
        return null;
    }

    private void addSongBySinger (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Song song = songService.getSong();
        cartService.addSong(song);
        displayAllOfSong(request, response);
    }

    private void deleteSong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        cartService.deleteSongById(id);
        displayAllOfSong(request, response);
    }

    private void deleteSinger(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        cartService.deleteSingerById(id);
        displayAllOfSong(request, response);
    }
}
