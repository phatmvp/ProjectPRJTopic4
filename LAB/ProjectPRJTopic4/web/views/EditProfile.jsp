<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Account" %>
<%
    Account account = (Account) request.getAttribute("account");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa thông tin cá nhân</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(120deg, #fdf6e3 0%, #ffe0e0 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .edit-container {
            background: #fff;
            padding: 32px 28px 24px 28px;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(16,24,40,0.10);
            width: 100%;
            max-width: 420px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .edit-container h2 {
            margin-bottom: 18px;
            color: #ff6b6b;
            font-size: 1.6rem;
            font-weight: 700;
            letter-spacing: 1px;
        }
        .avatar-preview {
            width: 96px;
            height: 96px;
            border-radius: 50%;
            object-fit: cover;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            margin-bottom: 18px;
            background: #f3f4f6;
        }
        .form-group {
            margin-bottom: 18px;
            width: 100%;
        }
        .form-group label {
            display: block;
            margin-bottom: 7px;
            font-weight: 600;
            color: #444;
        }
        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #e3e3e3;
            border-radius: 6px;
            font-size: 1rem;
            background: #fafafa;
            transition: border-color 0.2s;
        }
        .form-group input:focus {
            border-color: #ff6b6b;
            outline: none;
        }
        .form-group input[type="file"] {
            padding: 6px 0;
        }
        .form-actions {
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin-top: 10px;
        }
        .btn {
            padding: 10px 24px;
            border: none;
            border-radius: 999px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 600;
            transition: background 0.2s, color 0.2s;
        }
        .btn-primary {
            background-color: #ff6b6b;
            color: #fff;
            box-shadow: 0 2px 8px rgba(255,107,107,0.08);
        }
        .btn-primary:hover {
            background-color: #e34f4f;
        }
        .btn-secondary {
            background-color: #feca57;
            color: #fff;
        }
        .btn-secondary:hover {
            background-color: #e9b34c;
        }
        @media (max-width: 600px) {
            .edit-container {
                padding: 18px 6px;
                max-width: 98vw;
            }
        }
    </style>
</head>
<body>
    <div class="edit-container">
        <h2>Chỉnh sửa thông tin cá nhân</h2>
        <img class="avatar-preview" id="avatarPreview" src="<%= account != null && account.getAvatar() != null && !account.getAvatar().isEmpty() ? (request.getContextPath() + "/images/" + account.getAvatar()) : (request.getContextPath() + "/images/avatar.svg") %>" alt="avatar">
        <form action="<%= request.getContextPath() %>/updateProfile" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="username">Tên đăng nhập</label>
                <input type="text" id="username" name="username" value="<%= account != null ? account.getUsername() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="<%= account != null ? account.getEmail() : "" %>" required>
            </div>
            <!-- Không cho chỉnh sửa mật khẩu -->
            <div class="form-group">
                <label for="avatar">Ảnh đại diện</label>
                <input type="file" id="avatar" name="avatar" accept="image/*" onchange="previewAvatar(event)">
            </div>
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                <a href="<%= request.getContextPath() %>/profile" class="btn btn-secondary">Hủy</a>
            </div>
        </form>
    </div>
    <script>
        function previewAvatar(event) {
            const input = event.target;
            const preview = document.getElementById('avatarPreview');
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</body>
</html>