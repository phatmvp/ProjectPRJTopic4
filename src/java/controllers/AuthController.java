/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author Admin
 */
public class AuthController implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        String role = "Guest"; // mặc định

        if (session != null && session.getAttribute("roleId") != null) {
            int roleId = (int) session.getAttribute("roleId");
            switch (roleId) {
                case 1 ->
                    role = "Admin";
                case 2 ->
                    role = "User";
                default ->
                    role = "Guest";
            }
        }

        String uri = req.getRequestURI();

        if (role.equals("Admin")) {
            chain.doFilter(request, response); 
        } else if (role.equals("User")) {
            if (uri.startsWith(req.getContextPath() + "/admin")) {
                req.setAttribute("error", "Access denied! Admins only.");
                req.getRequestDispatcher("/views/HomePage.jsp").forward(req, res);
            } else {
                chain.doFilter(request, response);
            }
        } else { // Guest
            if (uri.startsWith(req.getContextPath() + "/admin") || uri.startsWith(req.getContextPath() + "/user")) {
                req.setAttribute("error", "Please login first to access this page.");
                req.getRequestDispatcher("/views/LoginPage.jsp").forward(req, res);
            } else {
                chain.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {

    }

}
