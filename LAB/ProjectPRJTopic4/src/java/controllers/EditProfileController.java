package controllers;

import dal.AccountDAO;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Account;

@MultipartConfig
public class EditProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("accountId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String accountId = (String) session.getAttribute("accountId");

        AccountDAO dao = new AccountDAO();
        Account account = dao.getAccountById(accountId);

        request.setAttribute("account", account);
        RequestDispatcher rd = request.getRequestDispatcher("/views/EditProfile.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("accountId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String accountId = (String) session.getAttribute("accountId");
        String username = request.getParameter("username");
        String email = request.getParameter("email");

        // Xử lý upload avatar
        String avatar = null;
        jakarta.servlet.http.Part filePart = request.getPart("avatar");
        String fileName = java.nio.file.Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        if (fileName != null && !fileName.isEmpty()) {
            String imagesDir = request.getServletContext().getRealPath("/images");
            java.io.File dir = new java.io.File(imagesDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            String uploadPath = imagesDir + java.io.File.separator + fileName;
            filePart.write(uploadPath);
            avatar = fileName;
        } else {
            // Nếu không upload file mới, giữ nguyên avatar cũ
            AccountDAO dao = new AccountDAO();
            Account account = dao.getAccountById(accountId);
            avatar = account != null ? account.getAvatar() : null;
        }

        AccountDAO dao = new AccountDAO();
        // Lấy mật khẩu cũ từ DB
        Account account = dao.getAccountById(accountId);
        String password = account != null ? account.getPassword() : null;
        dao.updateAccount(accountId, username, email, password, avatar);
        // Lưu avatar vào session để các trang hiển thị đúng
        session.setAttribute("avatar", avatar);

        response.sendRedirect(request.getContextPath() + "/profile");
    }
}