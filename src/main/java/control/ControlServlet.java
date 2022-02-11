package control;

import DAO.*;
import model.Account;
import model.Admin;
import model.Singer;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import static java.lang.System.out;

@WebServlet(name = "ControlServlet", value = "/home")
public class ControlServlet extends HttpServlet {
    AccountDAO accountDAO = new AccountDAO();
    AdminDAO adminDAO = new AdminDAO();
    SingerDAO singerDAO = new SingerDAO();
    UserDAO userDAO = new UserDAO();
    BillDAO billDAO = new BillDAO();

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
            case "updateInfo":
                updateInfo(request, response);
                break;
            default:
                display(request, response);
                break;
        }
    }

    private void checkLoginAndRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        int idRole = accountDAO.getAccountRole(userName, password);
        int idLogin = accountDAO.getAccountId(userName, password);
        if (idRole == 1) {
            Admin admin = new Admin(userName, password, idRole);
            int totalSinger = accountDAO.getTotalSinger();
            int totalUser = accountDAO.getTotalUser();
            double revenue = billDAO.getTotalRevenue();
            request.setAttribute("admin", admin);
            request.setAttribute("totalSinger", totalSinger);
            request.setAttribute("totalUser", totalUser);
            request.setAttribute("revenue", revenue);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admins/dashboard.jsp");
            requestDispatcher.forward(request, response);
        } else if (idRole == 2) {
            Singer singer = singerDAO.getSinger(idLogin);
            request.setAttribute("singer", singer);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/singers/home-singers.jsp");
            requestDispatcher.forward(request, response);
        } else if (idRole == 3) {
            User user = userDAO.getUser(idLogin);
            request.setAttribute("user", user);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/users/home-users.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    private void loginPost(HttpServletRequest request, HttpServletResponse response) throws NullPointerException, ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
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
                out.println();
                break;
        }
        response.sendRedirect("/login-or-register/login-or-register.jsp");
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

    private void updateInfo(HttpServletRequest request, HttpServletResponse response) {

    }

    private void display(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/login-or-register/login-or-register.jsp");
    }
}
