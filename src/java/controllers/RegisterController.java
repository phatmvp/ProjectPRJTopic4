package controllers;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dal.AccountDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Account;
import models.Role;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("views/RegisterPage.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Lấy dữ liệu từ form
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AccountDAO dao = new AccountDAO();
        Account existing = dao.getAccountByEmail(email);

        if (existing != null) {
            // Email đã tồn tại
            request.setAttribute("error", "Email đã tồn tại!");
            RequestDispatcher rd = request.getRequestDispatcher("views/RegisterPage.jsp");
            rd.forward(request, response);
            return;
        }

        // Tạo account mới
        Account newAccount = new Account();
        newAccount.setAccountId(Utils.generateId(8));
        newAccount.setUsername(username);
        newAccount.setEmail(email);
        newAccount.setPassword(password);
        newAccount.setRole(new Role(2, "User"));

        boolean created = dao.createAccountByUser(newAccount);

        if (created) {
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            request.setAttribute("error", "Đăng ký thất bại. Thử lại!");
            RequestDispatcher rd = request.getRequestDispatcher("views/RegisterPage.jsp");
            rd.forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
