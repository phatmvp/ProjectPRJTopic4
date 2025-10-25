package controllers;

import dal.AccountDAO;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Account;

/**
 * Servlet hiển thị trang Profile cho user đã đăng nhập
 */
public class ProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("accountId") == null) {
            // Chưa đăng nhập -> chuyển tới trang login
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String accountId = (String) session.getAttribute("accountId");

        AccountDAO dao = new AccountDAO();
        Account account = dao.getAccountById(accountId);

        request.setAttribute("account", account);
        RequestDispatcher rd = request.getRequestDispatcher("/views/ProfilePage.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nếu cần hỗ trợ cập nhật profile sau này
        doGet(request, response);
    }
}
