<%-- 
    Document   : HomePage
    Created on : Oct 18, 2025, 10:02:45 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Account" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cook - Admin Dashboard</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: #f8f9fa;
            overflow-x: hidden;
        }
        
        /* Sidebar Styles */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            width: 280px;
            background: linear-gradient(135deg, #feca57 0%, #ff6b6b 100%);
            box-shadow: 4px 0 15px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            transition: all 0.3s ease;
            overflow-y: auto;
        }
        
        .sidebar-header {
            padding: 30px 25px;
            background: rgba(255, 255, 255, 0.1);
            border-bottom: 2px solid rgba(255, 255, 255, 0.2);
        }
        
        .sidebar-logo {
            display: flex;
            align-items: center;
            gap: 15px;
            color: white;
            text-decoration: none;
        }
        
        .sidebar-logo i {
            font-size: 36px;
            background: white;
            color: #ff6b6b;
            width: 55px;
            height: 55px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .sidebar-logo-text h2 {
            font-size: 24px;
            font-weight: 700;
            margin: 0;
        }
        
        .sidebar-logo-text p {
            font-size: 12px;
            margin: 0;
            opacity: 0.9;
        }
        
        .sidebar-menu {
            padding: 20px 0;
        }
        
        .menu-section-title {
            padding: 15px 25px 10px;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: rgba(255, 255, 255, 0.7);
            font-weight: 600;
        }
        
        .sidebar-menu-item {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px 25px;
            color: white;
            text-decoration: none;
            transition: all 0.3s ease;
            border-left: 4px solid transparent;
            cursor: pointer;
        }
        
        .sidebar-menu-item:hover {
            background: rgba(255, 255, 255, 0.15);
            border-left-color: white;
            padding-left: 30px;
        }
        
        .sidebar-menu-item.active {
            background: rgba(255, 255, 255, 0.2);
            border-left-color: white;
            font-weight: 600;
        }
        
        .sidebar-menu-item i {
            font-size: 18px;
            width: 24px;
            text-align: center;
        }
        
        .sidebar-menu-item span {
            font-size: 15px;
        }
        
        /* Main Content */
        .main-content {
            margin-left: 280px;
            min-height: 100vh;
            background: #f8f9fa;
        }
        
        /* Top Bar */
        .top-bar {
            background: white;
            padding: 20px 40px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 999;
        }
        
        .top-bar-title h1 {
            font-size: 28px;
            font-weight: 700;
            color: #333;
            margin: 0;
        }
        
        .top-bar-actions {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .admin-profile {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 8px 15px;
            background: linear-gradient(135deg, #feca57, #ff6b6b);
            border-radius: 25px;
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .admin-profile:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(254, 202, 87, 0.4);
        }
        
        .admin-profile img {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            border: 2px solid white;
        }
        
        .admin-profile-icon {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background: white;
            color: #ff6b6b;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
        }
        
        /* Content Area */
        .content-area {
            padding: 40px;
        }
        
        .content-section {
            display: none;
        }
        
        .content-section.active {
            display: block;
            animation: fadeIn 0.5s ease;
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Stats Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }
        
        .stat-card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
            display: flex;
            align-items: center;
            gap: 20px;
            transition: all 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
        }
        
        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: white;
        }
        
        .stat-icon.accounts {
            background: linear-gradient(135deg, #feca57, #ff6b6b);
        }
        
        .stat-icon.recipes {
            background: linear-gradient(135deg, #26de81, #20bf6b);
        }
        
        .stat-icon.categories {
            background: linear-gradient(135deg, #4b7bec, #3867d6);
        }
        
        .stat-icon.pending {
            background: linear-gradient(135deg, #fc5c65, #eb3b5a);
        }
        
        .stat-info h3 {
            font-size: 32px;
            font-weight: 700;
            color: #333;
            margin: 0;
        }
        
        .stat-info p {
            font-size: 14px;
            color: #666;
            margin: 5px 0 0;
        }
        
        /* Card Styles */
        .card-custom {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
            overflow: hidden;
        }
        
        .card-header-custom {
            padding: 25px 30px;
            background: linear-gradient(135deg, #feca57, #ff6b6b);
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .card-header-custom h3 {
            font-size: 20px;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 12px;
        }
        
        .card-body-custom {
            padding: 30px;
        }
        
        /* Table Styles */
        .table-custom {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 10px;
        }
        
        .table-custom thead th {
            background: #f8f9fa;
            color: #555;
            font-weight: 600;
            padding: 15px 20px;
            text-transform: uppercase;
            font-size: 12px;
            letter-spacing: 0.5px;
            border: none;
        }
        
        .table-custom tbody tr {
            background: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }
        
        .table-custom tbody tr:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
        }
        
        .table-custom tbody td {
            padding: 18px 20px;
            border: none;
            vertical-align: middle;
        }
        
        .table-custom tbody tr td:first-child {
            border-radius: 10px 0 0 10px;
        }
        
        .table-custom tbody tr td:last-child {
            border-radius: 0 10px 10px 0;
        }
        
        /* Badge Styles */
        .badge-custom {
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .badge-admin {
            background: linear-gradient(135deg, #feca57, #ff6b6b);
            color: white;
        }
        
        .badge-user {
            background: linear-gradient(135deg, #4b7bec, #3867d6);
            color: white;
        }
        
        /* Button Styles */
        .btn-custom {
            padding: 10px 20px;
            border-radius: 8px;
            border: none;
            font-weight: 500;
            transition: all 0.3s ease;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            font-size: 14px;
        }
        
        .btn-add {
            background: linear-gradient(135deg, #26de81, #20bf6b);
            color: white;
            box-shadow: 0 5px 15px rgba(38, 222, 129, 0.3);
        }
        
        .btn-add:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(38, 222, 129, 0.4);
            color: white;
        }
        
        .btn-edit {
            background: linear-gradient(135deg, #4b7bec, #3867d6);
            color: white;
            padding: 8px 16px;
        }
        
        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(75, 123, 236, 0.4);
            color: white;
        }
        
        .btn-delete {
            background: linear-gradient(135deg, #fc5c65, #eb3b5a);
            color: white;
            padding: 8px 16px;
        }
        
        .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(252, 92, 101, 0.4);
            color: white;
        }
        
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        
        /* Search Box */
        .search-box {
            position: relative;
            max-width: 400px;
        }
        
        .search-box input {
            width: 100%;
            padding: 12px 45px 12px 20px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-size: 14px;
            transition: all 0.3s ease;
        }
        
        .search-box input:focus {
            outline: none;
            border-color: #feca57;
            box-shadow: 0 0 0 3px rgba(254, 202, 87, 0.1);
        }
        
        .search-box i {
            position: absolute;
            right: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
        }
        
        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
        }
        
        .empty-state i {
            font-size: 80px;
            color: #e0e0e0;
            margin-bottom: 20px;
        }
        
        .empty-state h3 {
            color: #666;
            font-size: 20px;
            margin-bottom: 10px;
        }
        
        .empty-state p {
            color: #999;
            font-size: 14px;
        }
        
        /* Responsive */
        @media (max-width: 992px) {
            .sidebar {
                width: 0;
                transform: translateX(-280px);
            }
            
            .sidebar.active {
                transform: translateX(0);
            }
            
            .main-content {
                margin-left: 0;
            }
            
            .top-bar {
                padding: 15px 20px;
            }
            
            .content-area {
                padding: 20px;
            }
        }
        
        @media (max-width: 768px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .top-bar-title h1 {
                font-size: 20px;
            }
            
            .table-custom {
                font-size: 13px;
            }
            
            .action-buttons {
                flex-direction: column;
            }
        }
        
        /* Mobile Menu Toggle */
        .mobile-menu-toggle {
            display: none;
            background: linear-gradient(135deg, #feca57, #ff6b6b);
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 20px;
        }
        
        @media (max-width: 992px) {
            .mobile-menu-toggle {
                display: block;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <a href="#" class="sidebar-logo">
                <i class="fas fa-utensils"></i>
                <div class="sidebar-logo-text">
                    <h2>Cook</h2>
                    <p>Admin Dashboard</p>
                </div>
            </a>
        </div>
        
        <div class="sidebar-menu">
            <div class="menu-section-title">Quản Lý</div>
            
            <a href="#" class="sidebar-menu-item active" data-section="accounts">
                <i class="fas fa-users"></i>
                <span>Quản Lý Tài Khoản</span>
            </a>
            
            <a href="#" class="sidebar-menu-item" data-section="recipes">
                <i class="fas fa-book"></i>
                <span>Quản Lý Công Thức</span>
            </a>
            
            <a href="#" class="sidebar-menu-item" data-section="categories">
                <i class="fas fa-list"></i>
                <span>Quản Lý Danh Mục</span>
            </a>
            
            <a href="#" class="sidebar-menu-item" data-section="approvals">
                <i class="fas fa-clipboard-check"></i>
                <span>Quản Lý Đơn Duyệt</span>
            </a>
            
            <div class="menu-section-title">Hệ Thống</div>
            
            <a href="homepage" class="sidebar-menu-item">
                <i class="fas fa-home"></i>
                <span>Về Trang Chủ</span>
            </a>
            
            <a href="logout" class="sidebar-menu-item">
                <i class="fas fa-sign-out-alt"></i>
                <span>Đăng Xuất</span>
            </a>
        </div>
    </div>
    
    <!-- Main Content -->
    <div class="main-content">
        <!-- Top Bar -->
        <div class="top-bar">
            <div class="d-flex align-items-center gap-3">
                <button class="mobile-menu-toggle" id="menuToggle">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="top-bar-title">
                    <h1 id="pageTitle">Quản Lý Tài Khoản</h1>
                </div>
            </div>
            
            <div class="top-bar-actions">
                <div class="admin-profile">
                    <div class="admin-profile-icon">
                        <i class="fas fa-user-shield"></i>
                    </div>
                    <span>Admin</span>
                </div>
            </div>
        </div>
        
        <!-- Content Area -->
        <div class="content-area">
            <!-- Stats Cards -->
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon accounts">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="stat-info">
                        <h3><%= request.getAttribute("accounts") != null ? ((List<Account>)request.getAttribute("accounts")).size() : 0 %></h3>
                        <p>Tài Khoản</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon recipes">
                        <i class="fas fa-book"></i>
                    </div>
                    <div class="stat-info">
                        <h3>0</h3>
                        <p>Công Thức</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon categories">
                        <i class="fas fa-list"></i>
                    </div>
                    <div class="stat-info">
                        <h3>0</h3>
                        <p>Danh Mục</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon pending">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div class="stat-info">
                        <h3>0</h3>
                        <p>Chờ Duyệt</p>
                    </div>
                </div>
            </div>
            
            <!-- Accounts Section -->
            <div class="content-section active" id="section-accounts">
                <div class="card-custom">
                    <div class="card-header-custom">
                        <h3>
                            <i class="fas fa-users"></i>
                            Danh Sách Tài Khoản
                        </h3>
                        <button class="btn-custom btn-add">
                            <i class="fas fa-plus"></i>
                            Thêm Tài Khoản
                        </button>
                    </div>
                    <div class="card-body-custom">
                        <div class="search-box mb-4">
                            <input type="text" placeholder="Tìm kiếm tài khoản..." id="searchAccounts">
                            <i class="fas fa-search"></i>
                        </div>
                        
                        <% 
                        List<Account> accounts = (List<Account>) request.getAttribute("accounts");
                        if (accounts != null && !accounts.isEmpty()) {
                        %>
                        <table class="table-custom">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên Người Dùng</th>
                                    <th>Email</th>
                                    <th>Vai Trò</th>
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Account acc : accounts) { %>
                                <tr>
                                    <td><strong>#<%= acc.getAccountId() %></strong></td>
                                    <td><%= acc.getUsername() %></td>
                                    <td><%= acc.getEmail() %></td>
                                    <td>
                                        <span class="badge-custom <%= acc.getRole().getRoleName().equals("Admin") ? "badge-admin" : "badge-user" %>">
                                            <%= acc.getRole().getRoleName() %>
                                        </span>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <a href="#" class="btn-custom btn-edit">
                                                <i class="fas fa-edit"></i> Sửa
                                            </a>
                                            <a href="#" class="btn-custom btn-delete">
                                                <i class="fas fa-trash"></i> Xóa
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                        <% } else { %>
                        <div class="empty-state">
                            <i class="fas fa-users"></i>
                            <h3>Chưa có tài khoản nào</h3>
                            <p>Hãy thêm tài khoản đầu tiên của bạn</p>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
            
            <!-- Recipes Section -->
            <div class="content-section" id="section-recipes">
                <div class="card-custom">
                    <div class="card-header-custom">
                        <h3>
                            <i class="fas fa-book"></i>
                            Danh Sách Công Thức
                        </h3>
                        <button class="btn-custom btn-add">
                            <i class="fas fa-plus"></i>
                            Thêm Công Thức
                        </button>
                    </div>
                    <div class="card-body-custom">
                        <div class="empty-state">
                            <i class="fas fa-book"></i>
                            <h3>Chưa có công thức nào</h3>
                            <p>Hãy thêm công thức đầu tiên của bạn</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Categories Section -->
            <div class="content-section" id="section-categories">
                <div class="card-custom">
                    <div class="card-header-custom">
                        <h3>
                            <i class="fas fa-list"></i>
                            Danh Sách Danh Mục
                        </h3>
                        <button class="btn-custom btn-add">
                            <i class="fas fa-plus"></i>
                            Thêm Danh Mục
                        </button>
                    </div>
                    <div class="card-body-custom">
                        <div class="empty-state">
                            <i class="fas fa-list"></i>
                            <h3>Chưa có danh mục nào</h3>
                            <p>Hãy thêm danh mục đầu tiên của bạn</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Approvals Section -->
            <div class="content-section" id="section-approvals">
                <div class="card-custom">
                    <div class="card-header-custom">
                        <h3>
                            <i class="fas fa-clipboard-check"></i>
                            Danh Sách Đơn Duyệt
                        </h3>
                    </div>
                    <div class="card-body-custom">
                        <div class="empty-state">
                            <i class="fas fa-clipboard-check"></i>
                            <h3>Chưa có đơn duyệt nào</h3>
                            <p>Tất cả đơn đã được xử lý</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Navigation
        const menuItems = document.querySelectorAll('.sidebar-menu-item[data-section]');
        const sections = document.querySelectorAll('.content-section');
        const pageTitle = document.getElementById('pageTitle');
        
        const sectionTitles = {
            'accounts': 'Quản Lý Tài Khoản',
            'recipes': 'Quản Lý Công Thức',
            'categories': 'Quản Lý Danh Mục',
            'approvals': 'Quản Lý Đơn Duyệt'
        };
        
        menuItems.forEach(item => {
            item.addEventListener('click', function(e) {
                e.preventDefault();
                
                // Remove active class from all items
                menuItems.forEach(i => i.classList.remove('active'));
                
                // Add active class to clicked item
                this.classList.add('active');
                
                // Hide all sections
                sections.forEach(s => s.classList.remove('active'));
                
                // Show selected section
                const sectionId = this.getAttribute('data-section');
                document.getElementById('section-' + sectionId).classList.add('active');
                
                // Update page title
                pageTitle.textContent = sectionTitles[sectionId];
                
                // Close mobile menu
                if (window.innerWidth <= 992) {
                    sidebar.classList.remove('active');
                }
            });
        });
        
        // Mobile Menu Toggle
        const menuToggle = document.getElementById('menuToggle');
        const sidebar = document.getElementById('sidebar');
        
        menuToggle.addEventListener('click', function() {
            sidebar.classList.toggle('active');
        });
        
        // Search functionality
        const searchInput = document.getElementById('searchAccounts');
        if (searchInput) {
            searchInput.addEventListener('input', function() {
                const searchTerm = this.value.toLowerCase();
                const rows = document.querySelectorAll('#section-accounts tbody tr');
                
                rows.forEach(row => {
                    const text = row.textContent.toLowerCase();
                    if (text.includes(searchTerm)) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            });
        }
        
        // Confirm delete
        const deleteButtons = document.querySelectorAll('.btn-delete');
        deleteButtons.forEach(btn => {
            btn.addEventListener('click', function(e) {
                if (!confirm('Bạn có chắc chắn muốn xóa?')) {
                    e.preventDefault();
                }
            });
        });
    </script>
</body>
</html>