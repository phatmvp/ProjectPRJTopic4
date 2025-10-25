/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.AccountDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.Account;

/**
 *
 * @author Admin
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("views/LoginPage.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AccountDAO dao = new AccountDAO();
        Account account = dao.getAccountByEmail(email);

        try {
            if (account != null && password.equals(account.getPassword())) {

                HttpSession session = request.getSession();
                session.setAttribute("accountId", account.getAccountId());
                session.setAttribute("username", account.getUsername());
                session.setAttribute("roleId", account.getRole().getRoleId());
                session.setAttribute("avatar", account.getAvatar());

                if ("Admin".equals(account.getRole().getRoleName())) {
                    response.sendRedirect(request.getContextPath() + "/admin");
                } else {
                    response.sendRedirect(request.getContextPath() + "/homepage");
                }

            } else {

                request.setAttribute("error", "Email hoặc mật khẩu không chính xác!");
                RequestDispatcher rd = request.getRequestDispatcher("views/LoginPage.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {

            request.setAttribute("error", "Lỗi hệ thống: " + e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("views/LoginPage.jsp");
            rd.forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
