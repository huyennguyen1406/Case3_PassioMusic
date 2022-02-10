package control;

import DAO.AdminDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ControlServlet", value = "/home")
public class ControlServlet extends HttpServlet {
    AdminDAO adminDAO = new AdminDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action(request,response);
    }

    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "checkLogin":

            case "loginPost":
                loginPost(request,response);
                break;
            case "registerPost":
                registerPost(request,response);
                break;
            case "updateInfo":
                updateInfo(request,response);
                break;
            default:
                display(request,response);
                break;
        }
    }

    private void loginPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            // Lấy thông tin, lưu vào trong database
        response.sendRedirect("/login-or-register/login-or-register.jsp");
    }

    private void registerPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        request.setAttribute("userName",userName);
        request.setAttribute("password",password);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/update-information/update-information.jsp");
        requestDispatcher.forward(request,response);
    }

    private void updateInfo(HttpServletRequest request, HttpServletResponse response) {

    }

    private void display(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println("Hello");
        response.sendRedirect("/login-or-register/login-or-register.jsp");
    }
}
