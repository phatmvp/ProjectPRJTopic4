<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Account" %>
<%
    Account account = (Account) request.getAttribute("account");
%>
        <style>
            :root {
                --bg: linear-gradient(120deg, #fdf6e3 0%, #ffe0e0 100%);
                --surface: #fff;
                --muted: #6b7280;
                --primary: #ff6b6b;
                --primary-dark: #e34f4f;
                --accent: #feca57;
                --radius: 16px;
                --shadow: 0 8px 32px rgba(16,24,40,0.10);
                --mono: "Segoe UI", Roboto, Arial, sans-serif;
            }
            body {
                min-height: 100vh;
                margin: 0;
                background: var(--bg);
                font-family: var(--mono);
                color: #222;
                line-height: 1.6;
            }
            .container {
                max-width: 1200px;
                margin: 40px auto;
                padding: 56px;
                background: var(--surface);
                border-radius: var(--radius);
                box-shadow: var(--shadow);
            }
            .profile-wrap {
                display: flex;
                gap: 64px;
                flex-wrap: wrap;
                align-items: flex-start;
            }
            .profile-card {
                flex: 1 1 100%;
                text-align: center;
                padding: 0;
            }
            .avatar {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                object-fit: cover;
                border: 5px solid var(--accent);
                box-shadow: 0 2px 12px rgba(255,107,107,0.10);
                margin: -60px auto 16px auto;
            }
            .meta {
                margin-top: 16px;
            }
            .meta .name {
                font-size: 1.3rem;
                font-weight: 700;
                color: var(--primary-dark);
            }
            .meta .email {
                color: var(--muted);
                font-size: 1rem;
            }
            .profile-info {
                flex: 1;
            }
            .profile-info h2 {
                font-size: 1.5rem;
                font-weight: 600;
                margin-bottom: 18px;
                color: var(--primary);
            }
            table {
                width: 100%;
                border-collapse: collapse;
                background: transparent;
                margin-bottom: 12px;
            }
            table td {
                padding: 12px 18px;
                border-bottom: 1px solid #f3f4f6;
                font-size: 1rem;
                color: #444;
            }
            table tr:last-child td {
                border-bottom: none;
            }
            .btn {
                display: inline-block;
                padding: 10px 22px;
                border-radius: 999px;
                border: none;
                font-weight: 600;
                font-size: 1rem;
                cursor: pointer;
                transition: background 0.18s, box-shadow 0.18s;
                margin-right: 8px;
            }
            .btn-primary {
                background: linear-gradient(90deg, var(--primary), var(--primary-dark));
                color: #fff;
                box-shadow: 0 4px 16px rgba(255,107,107,0.12);
            }
            .btn-primary:hover {
                background: linear-gradient(90deg, var(--primary-dark), var(--primary));
            }
            .btn-outline {
                background: #fff;
                color: var(--primary);
                border: 2px solid var(--primary);
            }
            .btn-outline:hover {
                background: var(--primary);
                color: #fff;
            }
            @media (max-width: 700px) {
                .container {
                    padding: 12px;
                }
                .profile-wrap {
                    flex-direction: column;
                    gap: 24px;
                }
                .profile-card {
                    padding-bottom: 0;
                }
                .avatar {
                    width: 80px;
                    height: 80px;
                }
            }
        </style>
           
    </head>
    <body>
 


        <div class="container card profile-wrap">
            <div class="profile-card">
                <img src="<%= account != null && account.getAvatar() != null && !account.getAvatar().isEmpty() ? (request.getContextPath() + "/images/" + account.getAvatar()) : (request.getContextPath() + "/images/avatar.svg") %>" alt="avatar" class="avatar">
                <div class="meta">
                    <div class="name"><%= account != null ? account.getUsername() : "Người dùng" %></div>
                    <div class="email"><%= account != null ? account.getEmail() : "" %></div>
                </div>
            </div>

            <div class="profile-info">
                <h2>Thông tin cá nhân</h2>
                <table>
                    <tr><td>Mã tài khoản:</td><td><%= account != null ? account.getAccountId() : "" %></td></tr>
                    <tr><td>Tên đăng nhập:</td><td><%= account != null ? account.getUsername() : "" %></td></tr>
                    <tr><td>Email:</td><td><%= account != null ? account.getEmail() : "" %></td></tr>
                    <tr><td>Ngày tạo:</td><td><%= account != null ? account.getCreatedAt() : "" %></td></tr>
                    <tr><td>Vai trò:</td><td><%= account != null && account.getRole() != null ? account.getRole().getRoleName() : "" %></td></tr>
                </table>
                <div style="margin-top:18px">
                    <a class="btn btn-primary" href="<%= request.getContextPath() %>/logout" style="margin-left:8px">Đăng xuất</a>
                </div>
            </div>
        </div>
        <div class="edit-profile" style="margin-top: 24px; text-align: center;">
                <a class="btn btn-outline" href="<%= request.getContextPath() %>/editProfile">Chỉnh sửa thông tin cá nhân</a>
            </div>
             <a class="btn btn-outline" href="<%= request.getContextPath() %>/homepage">Trang chủ</a>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
