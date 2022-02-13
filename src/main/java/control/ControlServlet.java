package control;

import DAO.*;
import model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import static java.lang.System.out;

@WebServlet(name = "ControlServlet", value = "/home")
public class ControlServlet extends HttpServlet {
    AccountDAO accountDAO = new AccountDAO();
    AdminDAO adminDAO = new AdminDAO();
    SingerDAO singerDAO = new SingerDAO();
    UserDAO userDAO = new UserDAO();
    BillDAO billDAO = new BillDAO();
    SongDAO songDAO = new SongDAO();
    CartDAO cartDAO = new CartDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action(request, response);
    }

    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "checkLoginAndRole":
                checkLoginAndRole(request, response);
                break;
            case "loginPost":
                loginPost(request, response);
                break;
            case "registerPost":
                registerPost(request, response);
                break;
            case "deleteSinger":
                deleteSinger(request, response);
                break;
            case "getProfileSinger":
                getProfileSinger(request, response);
                break;
            case "getInfoAccount":
                getInfoAccount(request, response);
                break;
            case "deleteSong":
                deleteSong(request, response);
                break;
            case "createNewSong":
                createNewSong(request, response);
                break;
            case "updateSingerInformation":
                updateSingerInformation(request, response);
                break;
            case "addToCart":
                addToCart(request, response);
                break;
            case "getCart":
                getCart(request, response);
                break;
            case "deleteSongFromCart":
                deleteSongFromCart(request, response);
                break;
            case "payMent":
                payMent(request, response);
                break;
            case "getPlaylist":
                getPlaylist(request, response);
                break;
            case "getContact":
                getContact(request, response);
                break;
            case "getSongDetail":
                getSongDetail(request, response);
            default:
                display(request, response);
                break;
        }
    }

    private void payMent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        int idCart = Integer.parseInt(request.getParameter("idCart"));
        int idUser = accountDAO.getAccountId(userName,password);
        Date createDate = new Date(System.currentTimeMillis());
        java.sql.Date createDateToSQL = new java.sql.Date(createDate.getTime());
        billDAO.addBill(idCart,createDateToSQL);
        cartDAO.addNewCartUser(idUser);
        Cart cart = cartDAO.getCartByIdUser(idUser);

        double total = 0;
        for (Song song : cart.getSongs()) {
            total += song.getPrice();
        }
        ArrayList<SongBySinger> songOwns = songDAO.getSongOwn(idUser);
        request.setAttribute("songOwns", songOwns);
        request.setAttribute("total", total);
        request.setAttribute("cart", cart);
        request.setAttribute("userName", userName);
        request.setAttribute("password", password);
        request.setAttribute("idCart", idCart);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/cart/cart.jsp");
        requestDispatcher.forward(request, response);

    }

    private void deleteSongFromCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        int idSong = Integer.parseInt(request.getParameter("idSong"));
        int idUser = accountDAO.getAccountId(userName, password);
        int idCart = cartDAO.getFinalCartIdByIdUser(idUser);
        if (idCart == 0) {
            cartDAO.addNewCartUser(idUser);
            idCart = cartDAO.getFinalCartIdByIdUser(idUser);
        } else {
            ArrayList<Bill> bills = billDAO.getBillListByUserId(idUser);
            for (Bill bill : bills) {
                if (bill.getIdCart() == idCart) {
                    cartDAO.addNewCartUser(idUser);
                    idCart = cartDAO.getFinalCartIdByIdUser(idUser);
                    break;
                }
            }
        }
        cartDAO.addToCart(idSong, idCart);
        User user = userDAO.getUser(idUser);
        ArrayList<SongBySinger> songBySingers = songDAO.getSongAndSingerName();
        ArrayList<SongBySinger> songOwns = songDAO.getSongOwn(idUser);
        ArrayList<SongBySinger> songNotOwns = new ArrayList<>();
        for (SongBySinger song : songBySingers) {
            boolean check = false;
            for (SongBySinger songOwn : songOwns) {
                if (song.getSong().getId() == songOwn.getSong().getId()) {
                    check = true;
                    break;
                }
            }
            if (!check) {
                songNotOwns.add(song);
            }
        }
        request.setAttribute("user", user);
        request.setAttribute("id", idUser);
        request.setAttribute("userName", userName);
        request.setAttribute("password", password);

        request.setAttribute("songOwns", songOwns);
        request.setAttribute("songNotOwns", songNotOwns);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/users/index.jsp");
        requestDispatcher.forward(request, response);

    }

    private void getSongDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idSong = Integer.parseInt(request.getParameter("idSong"));
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        SongBySinger song = songDAO.getSongById(idSong);

        request.setAttribute("userName", userName);
        request.setAttribute("password", password);
        request.setAttribute("song", song);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/details/detail.jsp");
        requestDispatcher.forward(request, response);

    }

    private void getContact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        User user = userDAO.getUser(idUser);

        request.setAttribute("user", user);
        request.setAttribute("id", idUser);
        request.setAttribute("userName", userName);
        request.setAttribute("password", password);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/users/contact.jsp");
        requestDispatcher.forward(request, response);
    }

    private void getPlaylist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        User user = userDAO.getUser(idUser);

        ArrayList<SongBySinger> songOwns = songDAO.getSongOwn(idUser);
        request.setAttribute("songOwns", songOwns);
        request.setAttribute("user", user);
        request.setAttribute("id", idUser);
        request.setAttribute("userName", userName);
        request.setAttribute("password", password);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/users/albums-store.jsp");
        requestDispatcher.forward(request, response);
    }

    private void getCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        int idCart = cartDAO.getFinalCartIdByIdUser(idUser);
        Cart cart;
        if (idCart == 0) {
            cartDAO.addNewCartUser(idUser);
            cart = cartDAO.getCartByIdUser(idUser);
        } else {
            cart = cartDAO.getCartByIdUser(idUser);
            ArrayList<Bill> bills = billDAO.getBillListByUserId(idUser);
            for (Bill bill : bills) {
                if (bill.getIdCart() == cart.getId()) {
                    cartDAO.addNewCartUser(idUser);
                    cart = cartDAO.getCartByIdUser(idUser);
                }
            }
        }
        double total = 0;
        for (Song song : cart.getSongs()) {
            total += song.getPrice();
        }
        ArrayList<SongBySinger> songOwns = songDAO.getSongOwn(idUser);

        request.setAttribute("songOwns", songOwns);
        request.setAttribute("total", total);
        request.setAttribute("cart", cart);
//        request.setAttribute("id", idUser);
        request.setAttribute("userName", userName);
        request.setAttribute("password", password);
        request.setAttribute("idCart", idCart);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/cart/cart.jsp");
        requestDispatcher.forward(request, response);
    }

    private void updateSingerInformation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idSinger = Integer.parseInt(request.getParameter("idSinger"));
        String nameSinger = request.getParameter("nameSinger");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        singerDAO.updateSingerInformation(nameSinger, phoneNumber, email, address, idSinger);
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        Singer singer = singerDAO.getSinger(idSinger);
        ArrayList<SongByDownload> songByDownloads = songDAO.getSongsDetailBySingerId(idSinger);
        ArrayList<Song> songs = songDAO.getSongBySingerId(idSinger);
        int totalSong = songs.size();
        int totalRevenue = 0;
        for (SongByDownload song : songByDownloads) {
            totalRevenue += song.getSong().getPrice() * song.getNumberOfDownload();
        }
        request.setAttribute("singer", singer);
        request.setAttribute("totalSong", totalSong);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("userName", userName);
        request.setAttribute("password", password);
        request.setAttribute("songByDownloads", songByDownloads);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/singers/dashboard.jsp");
        requestDispatcher.forward(request, response);
    }

    private void deleteSong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idSinger"));
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        int idSong = Integer.parseInt(request.getParameter("idSong"));
        songDAO.deleteSongBySongId(idSong);

        Singer singer = singerDAO.getSinger(id);
        ArrayList<SongByDownload> songByDownloads = songDAO.getSongsDetailBySingerId(id);
        ArrayList<Song> songs = songDAO.getSongBySingerId(id);
        int totalSong = songs.size();
        int totalRevenue = 0;
        for (SongByDownload song : songByDownloads) {
            totalRevenue += song.getSong().getPrice() * song.getNumberOfDownload();
        }
        request.setAttribute("singer", singer);
        request.setAttribute("totalSong", totalSong);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("userName", userName);
        request.setAttribute("password", password);
        request.setAttribute("songByDownloads", songByDownloads);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/singers/dashboard.jsp");
        requestDispatcher.forward(request, response);
    }

    private void createNewSong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idSinger = Integer.parseInt(request.getParameter("idSinger"));
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String song_name = request.getParameter("song_name");
        String song_link = request.getParameter("song_link");
        String song_img = request.getParameter("song_img");
        double price = Double.parseDouble(request.getParameter("price"));
        songDAO.addNewSong(song_name, idSinger, song_link, song_img, price);

        Singer singer = singerDAO.getSinger(idSinger);
        ArrayList<SongByDownload> songByDownloads = songDAO.getSongsDetailBySingerId(idSinger);
        ArrayList<Song> songs = songDAO.getSongBySingerId(idSinger);
        int totalSong = songs.size();
        int totalRevenue = 0;
        for (SongByDownload song : songByDownloads) {
            totalRevenue += song.getSong().getPrice() * song.getNumberOfDownload();
        }
        request.setAttribute("singer", singer);
        request.setAttribute("totalSong", totalSong);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("userName", userName);
        request.setAttribute("password", password);
        request.setAttribute("songByDownloads", songByDownloads);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/singers/dashboard.jsp");
        requestDispatcher.forward(request, response);
    }

    private void getProfileSinger(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idSinger = Integer.parseInt(request.getParameter("idSinger"));
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        Singer singer = singerDAO.getSinger(idSinger);
        String nameSinger = singer.getNameSinger();
        String phoneNumber = singer.getPhoneNumber();
        String email = singer.getEmail();
        String address = singer.getAddress();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/singers/profile.jsp");
        request.setAttribute("id", idSinger);
        request.setAttribute("userName", userName);
        request.setAttribute("password", password);
        request.setAttribute("nameSinger", nameSinger);
        request.setAttribute("phoneNumber", phoneNumber);
        request.setAttribute("email", email);
        request.setAttribute("address", address);
        requestDispatcher.forward(request, response);
    }

    private void getInfoAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idAdmin = Integer.parseInt(request.getParameter("idAdmin"));
        Admin admin = adminDAO.getAdminById(idAdmin);
        ArrayList<Account> accounts = accountDAO.displayAllAccount();
        ArrayList<AccountRoleName> accountRoleNames = new ArrayList<>();
        for (Account account : accounts) {
            String roleName;
            if (account.getIdRole() == 1) {
                roleName = "admin";
            } else if (account.getIdRole() == 2) {
                roleName = "singer";
            } else if (account.getIdRole() == 3) {
                roleName = "user";
            } else {
                roleName = "block";
            }
            accountRoleNames.add(new AccountRoleName(roleName, account));
        }
        request.setAttribute("admin", admin);
        request.setAttribute("accountRoleNames", accountRoleNames);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admins/account-table.jsp");
        requestDispatcher.forward(request, response);

    }

    private void deleteSinger(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int totalSinger = accountDAO.getTotalSinger();
        int totalUser = accountDAO.getTotalUser();
        int idAdmin = Integer.parseInt(request.getParameter("idAdmin"));
        int idSinger = Integer.parseInt(request.getParameter("idSinger"));
        Admin admin = adminDAO.getAdminById(idAdmin);
        accountDAO.deleteSingerById(idSinger);
        double revenue = billDAO.getTotalRevenue();
        ArrayList<SingerByRevenue> singerByRevenue = billDAO.getSingerListByRevenue();
        ArrayList<UserByRevenue> userByRevenue = billDAO.getUserListByRevenue();
        request.setAttribute("admin", admin);
        request.setAttribute("totalSinger", totalSinger);
        request.setAttribute("totalUser", totalUser);
        request.setAttribute("revenue", revenue);
        request.setAttribute("singerByRevenue", singerByRevenue);
        request.setAttribute("userByRevenue", userByRevenue);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admins/dashboard.jsp");
        requestDispatcher.forward(request, response);
    }

    private void checkLoginAndRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        int idRole = accountDAO.getAccountRole(userName, password);
        int idLogin = accountDAO.getAccountId(userName, password);
        int idAdmin = accountDAO.getAccountId(userName, password);
        if (idRole == 1) {
            Admin admin = new Admin(idAdmin, userName, password, idRole);
            int totalSinger = accountDAO.getTotalSinger();
            int totalUser = accountDAO.getTotalUser();
            double revenue = billDAO.getTotalRevenue();
            ArrayList<SingerByRevenue> singerByRevenue = billDAO.getSingerListByRevenue();
            ArrayList<UserByRevenue> userByRevenue = billDAO.getUserListByRevenue();
            request.setAttribute("admin", admin);
            request.setAttribute("totalSinger", totalSinger);
            request.setAttribute("totalUser", totalUser);
            request.setAttribute("revenue", revenue);
            request.setAttribute("singerByRevenue", singerByRevenue);
            request.setAttribute("userByRevenue", userByRevenue);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admins/dashboard.jsp");
            requestDispatcher.forward(request, response);
        } else if (idRole == 2) {
            Singer singer = singerDAO.getSinger(idLogin);
            ArrayList<SongByDownload> songByDownloads = songDAO.getSongsDetailBySingerId(idLogin);
            ArrayList<Song> songs = songDAO.getSongBySingerId(idLogin);
            int totalSong = songs.size();
            int totalRevenue = 0;
            for (SongByDownload song : songByDownloads) {
                totalRevenue += song.getSong().getPrice() * song.getNumberOfDownload();
            }
            request.setAttribute("singer", singer);
            request.setAttribute("totalSong", totalSong);
            request.setAttribute("totalRevenue", totalRevenue);
            request.setAttribute("userName", userName);
            request.setAttribute("password", password);
            request.setAttribute("songByDownloads", songByDownloads);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/singers/dashboard.jsp");
            requestDispatcher.forward(request, response);
        } else if (idRole == 3) {
            User user = userDAO.getUser(idLogin);
            ArrayList<SongBySinger> songBySingers = songDAO.getSongAndSingerName();
            ArrayList<SongBySinger> songOwns = songDAO.getSongOwn(idLogin);
            ArrayList<SongBySinger> songNotOwns = new ArrayList<>();
            for (SongBySinger song : songBySingers) {
                boolean check = false;
                for (SongBySinger songOwn : songOwns) {
                    if (song.getSong().getId() == songOwn.getSong().getId()) {
                        check = true;
                        break;
                    }
                }
                if (!check) {
                    songNotOwns.add(song);
                }
            }
//            User user = userDAO.getUser(idLogin);
//            user.getNameUser()
            request.setAttribute("user", user);
            request.setAttribute("id", idLogin);
            request.setAttribute("userName", userName);
            request.setAttribute("password", password);

            request.setAttribute("songOwns", songOwns);
            request.setAttribute("songNotOwns", songNotOwns);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/users/index.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    private void loginPost(HttpServletRequest request, HttpServletResponse response) throws NullPointerException, ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
//        if (!accountDAO.checkAccount(userName, password)) {
        int role = Integer.parseInt(request.getParameter("role"));
        String fullName = request.getParameter("fullName");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Account account = new Account(userName, password, role);
        accountDAO.addAccount(account);
        int id = accountDAO.getAccountId(userName, password);
        switch (role) {
            case 2:
                singerDAO.addSinger(id, fullName, phoneNumber, email, address);
                break;
            case 3:
                userDAO.addUser(id, fullName, phoneNumber, email, address);
                break;
        }
        response.sendRedirect("/login-or-register/login-or-register.jsp");
//        }

    }

    private void registerPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        int role = Integer.parseInt(request.getParameter("role"));
        if (accountDAO.checkAccount(userName, password)) {
            out.println("Account already exist");
        } else {
            request.setAttribute("userName", userName);
            request.setAttribute("password", password);
            request.setAttribute("role", role);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/update-information/update-information.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    private void display(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/login-or-register/login-or-register.jsp");
    }
}
