<%-- 
    Document   : navbar
    Created on : Oct 19, 2025, 3:42:15 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpServletRequest" %>
<%
    String username = null;
    boolean loggedIn = false;
    HttpServletRequest httpReq = (HttpServletRequest) request;
    String uri = httpReq.getRequestURI();
    boolean isProfile = uri != null && uri.contains("/profile");
    if(session != null && session.getAttribute("accountId") != null) {
        username = (String) session.getAttribute("username");
        loggedIn = true;
    }
%>

<style>
    /* Sidebar mode for profile page */
    <% if (isProfile) { %>
    body{padding-left:220px}
    .sidebar {
        position:fixed;left:12px;top:20px;bottom:20px;width:200px;background:var(--surface, #fff);border-radius:12px;box-shadow:0 8px 30px rgba(16,24,40,0.06);padding:18px;}
    .sidebar .nav-link{display:block;padding:10px 12px;color:#374151}
    .sidebar .nav-link.active{color:var(--primary-500)}
    .sidebar .avatar{width:72px;height:72px;border-radius:50%;border:3px solid rgba(255,107,107,0.12);display:block;margin-bottom:12px}
    .sidebar .brand{font-weight:700;color:var(--primary-700);margin-bottom:8px}
    <% } %>
    .navbar-custom {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        box-shadow: 0 2px 20px rgba(0,0,0,0.08);
    }

    .navbar-brand {
        font-weight: 700;
        font-size: 1.5rem;
        background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }

    .nav-link {
        font-weight: 500;
        color: #555 !important;
        transition: color 0.3s ease;
    }

    .nav-link:hover, .nav-link.active {
        color: #ff6b6b !important;
    }

    .search-form {
        position: relative;
    }

    .search-form input {
        border-radius: 25px;
        border: 2px solid #f0f0f0;
        padding: 8px 40px 8px 20px;
        transition: all 0.3s ease;
    }

    .search-form input:focus {
        border-color: #ff6b6b;
        box-shadow: 0 0 0 0.2rem rgba(255, 107, 107, 0.15);
    }

    .search-form button {
        position: absolute;
        right: 5px;
        top: 50%;
        transform: translateY(-50%);
        border: none;
        background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%);
        color: white;
        border-radius: 20px;
        padding: 6px 15px;
        transition: all 0.3s ease;
    }

    .search-form button:hover {
        transform: translateY(-50%) scale(1.05);
    }

    .btn-login {
        background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%);
        color: white;
        border: none;
        border-radius: 20px;
        padding: 8px 20px;
        font-weight: 600;
        transition: all 0.3s ease;
    }

    .btn-login:hover {
        transform: scale(1.05);
        box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
        color: white;
    }

    .btn-register {
        border: 2px solid #ff6b6b;
        color: #ff6b6b;
        border-radius: 20px;
        padding: 8px 20px;
        font-weight: 600;
        transition: all 0.3s ease;
    }

    .btn-register:hover {
        background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%);
        color: white;
        border-color: transparent;
    }

    .avatar-dropdown img {
        border: 2px solid #ff6b6b;
        transition: all 0.3s ease;
        cursor: pointer;
    }

    .avatar-dropdown img:hover {
        transform: scale(1.1);
        box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
    }

    .dropdown-menu {
        border-radius: 15px;
        border: none;
        box-shadow: 0 5px 25px rgba(0,0,0,0.15);
        margin-top: 10px;
    }

    .dropdown-item {
        padding: 10px 20px;
        transition: all 0.3s ease;
    }

    .dropdown-item:hover {
        background: linear-gradient(135deg, rgba(255, 107, 107, 0.1), rgba(254, 202, 87, 0.1));
        color: #ff6b6b;
    }

    .dropdown-header {
        color: #ff6b6b;
        font-size: 1rem;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-light navbar-custom sticky-top">
    <div class="container">
        <a class="navbar-brand" href="homepage">
            <i class="bi bi-fire"></i> CookManager
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navMain">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="#">
                        <i class="bi bi-house-door"></i> Trang chủ
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="bi bi-grid"></i> Danh mục
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="bi bi-star"></i> Nổi bật
                    </a>
                </li>
            </ul>

            <form class="d-flex me-3 search-form">
                <input class="form-control" type="search" placeholder="Tìm công thức..." aria-label="Search">
                <button type="submit">
                    <i class="bi bi-search"></i>
                </button>
            </form>

            <% if(loggedIn) { %>
            <div class="dropdown avatar-dropdown">
                <a href="#" class="d-flex align-items-center text-decoration-none" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="<%= session != null && session.getAttribute("avatar") != null && !((String)session.getAttribute("avatar")).isEmpty() ? (request.getContextPath() + "/images/" + (String)session.getAttribute("avatar")) : (request.getContextPath() + "/images/avatar.svg") %>" 
                    alt="Avatar" width="38" height="38" class="rounded-circle">
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown" style="min-width: 220px;">
                    <li class="dropdown-header">
                        <i class="bi bi-person-circle"></i> <%= username %>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li>
                        <a class="dropdown-item" href="<%= request.getContextPath() %>/profile">
                            <i class="bi bi-person"></i> Hồ Sơ Cá Nhân
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="<%= request.getContextPath() %>/usermanager">
                            <i class="bi bi-file-earmark-text"></i> Công Thức Của Tôi
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="<%= request.getContextPath() %>/favorites">
                            <i class="bi bi-heart"></i> Món Ăn Yêu Thích
                        </a>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li>
                        <a class="dropdown-item text-danger" href="<%= request.getContextPath() %>/logout">
                            <i class="bi bi-box-arrow-right"></i> Đăng Xuất
                        </a>
                    </li>
                </ul>
            </div>
            <% } else { %>
            <a href="<%= request.getContextPath() %>/login" class="btn btn-sm btn-login me-2">
                <i class="bi bi-box-arrow-in-right"></i> Đăng nhập
            </a>
            <a href="<%= request.getContextPath() %>/register" class="btn btn-sm btn-register">
                <i class="bi bi-person-plus"></i> Đăng ký
            </a>
            <% } %>
        </div>
    </div>
</nav>