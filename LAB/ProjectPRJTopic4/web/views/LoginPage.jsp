<%-- 
    Document   : LoginPage
    Created on : Oct 18, 2025, 10:09:22 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Cook - Đăng Nhập</title>

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
                min-height: 100vh;
                background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%);
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
                position: relative;
                overflow: hidden;
            }

            /* Animated Background Elements */
            body::before {
                content: '';
                position: absolute;
                width: 500px;
                height: 500px;
                background: rgba(255, 255, 255, 0.1);
                border-radius: 50%;
                top: -250px;
                right: -250px;
                animation: float 6s ease-in-out infinite;
            }

            body::after {
                content: '';
                position: absolute;
                width: 400px;
                height: 400px;
                background: rgba(255, 255, 255, 0.08);
                border-radius: 50%;
                bottom: -200px;
                left: -200px;
                animation: float 8s ease-in-out infinite reverse;
            }

            @keyframes float {
                0%, 100% {
                    transform: translateY(0) rotate(0deg);
                }
                50% {
                    transform: translateY(-30px) rotate(180deg);
                }
            }

            .login-container {
                position: relative;
                z-index: 1;
                width: 100%;
                max-width: 450px;
                animation: slideIn 0.6s ease-out;
            }

            @keyframes slideIn {
                from {
                    opacity: 0;
                    transform: translateY(-30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .login-card {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(10px);
                border-radius: 25px;
                padding: 50px 40px;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .login-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 25px 70px rgba(0, 0, 0, 0.25);
            }

            .login-header {
                text-align: center;
                margin-bottom: 40px;
            }

            .logo-icon {
                width: 80px;
                height: 80px;
                background: linear-gradient(135deg, #ff6b6b, #feca57);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 20px;
                font-size: 40px;
                color: white;
                box-shadow: 0 10px 30px rgba(255, 107, 107, 0.3);
                animation: pulse 2s ease-in-out infinite;
            }

            @keyframes pulse {
                0%, 100% {
                    transform: scale(1);
                    box-shadow: 0 10px 30px rgba(255, 107, 107, 0.3);
                }
                50% {
                    transform: scale(1.05);
                    box-shadow: 0 15px 40px rgba(255, 107, 107, 0.5);
                }
            }

            .login-header h2 {
                color: #333;
                font-weight: 700;
                font-size: 32px;
                margin-bottom: 10px;
            }

            .login-header p {
                color: #666;
                font-size: 15px;
                font-weight: 400;
            }

            .form-group {
                margin-bottom: 25px;
                position: relative;
            }

            .form-label {
                font-weight: 500;
                color: #555;
                margin-bottom: 10px;
                font-size: 14px;
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .form-label i {
                color: #ff6b6b;
                font-size: 16px;
            }

            .form-control {
                border: 2px solid #e0e0e0;
                border-radius: 12px;
                padding: 14px 20px;
                font-size: 15px;
                transition: all 0.3s ease;
                background: #f8f9fa;
            }

            .form-control:focus {
                border-color: #ff6b6b;
                box-shadow: 0 0 0 0.2rem rgba(255, 107, 107, 0.15);
                background: white;
                transform: translateY(-2px);
            }

            .form-control:hover {
                border-color: #feca57;
                background: white;
            }

            .btn-login {
                width: 100%;
                padding: 15px;
                font-size: 16px;
                font-weight: 600;
                border: none;
                border-radius: 12px;
                background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%);
                color: white;
                cursor: pointer;
                transition: all 0.3s ease;
                box-shadow: 0 5px 20px rgba(255, 107, 107, 0.3);
                text-transform: uppercase;
                letter-spacing: 1px;
                position: relative;
                overflow: hidden;
            }

            .btn-login::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(135deg, #feca57 0%, #ff6b6b 100%);
                transition: left 0.5s ease;
            }

            .btn-login:hover::before {
                left: 0;
            }

            .btn-login span {
                position: relative;
                z-index: 1;
            }

            .btn-login:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 30px rgba(255, 107, 107, 0.5);
            }

            .btn-login:active {
                transform: translateY(-1px);
            }

            .alert {
                border-radius: 12px;
                padding: 15px 20px;
                margin-bottom: 25px;
                border: none;
                animation: shake 0.5s ease;
                display: flex;
                align-items: center;
                gap: 12px;
                font-size: 14px;
            }

            @keyframes shake {
                0%, 100% {
                    transform: translateX(0);
                }
                10%, 30%, 50%, 70%, 90% {
                    transform: translateX(-5px);
                }
                20%, 40%, 60%, 80% {
                    transform: translateX(5px);
                }
            }

            .alert-danger {
                background: linear-gradient(135deg, #ff6b6b, #ff8787);
                color: white;
                box-shadow: 0 5px 20px rgba(255, 107, 107, 0.3);
            }

            .alert i {
                font-size: 20px;
            }

            .divider {
                text-align: center;
                margin: 30px 0;
                position: relative;
            }

            .divider::before {
                content: '';
                position: absolute;
                left: 0;
                top: 50%;
                width: 100%;
                height: 1px;
                background: linear-gradient(to right, transparent, #e0e0e0, transparent);
            }

            .divider span {
                background: white;
                padding: 0 15px;
                color: #999;
                font-size: 13px;
                position: relative;
                z-index: 1;
            }

            .extra-links {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 20px;
                font-size: 14px;
            }

            .extra-links a {
                color: #ff6b6b;
                text-decoration: none;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            .extra-links a:hover {
                color: #feca57;
                transform: translateX(3px);
            }

            .password-toggle {
                position: absolute;
                right: 20px;
                top: 42px;
                cursor: pointer;
                color: #999;
                transition: color 0.3s ease;
            }

            .password-toggle:hover {
                color: #ff6b6b;
            }

            @media (max-width: 576px) {
                .login-card {
                    padding: 40px 30px;
                }

                .login-header h2 {
                    font-size: 26px;
                }

                .logo-icon {
                    width: 70px;
                    height: 70px;
                    font-size: 35px;
                }
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <div class="login-card">
                <div class="login-header">
                    <div class="logo-icon">
                        <i class="fas fa-utensils"></i>
                    </div>
                    <h2>Cook</h2>
                    <p>Đăng nhập để tiếp tục</p>
                </div>

                <% 
                    String error = (String) request.getAttribute("error");
                    if (error != null && !error.isEmpty()) {
                %>
                <div class="alert alert-danger" role="alert">
                    <i class="fas fa-exclamation-circle"></i>
                    <span><%= error %></span>
                </div>
                <% } %>

                <form action="login" method="POST">
                    <div class="form-group">
                        <label class="form-label" for="email">
                            <i class="fas fa-envelope"></i>
                            Email
                        </label>
                        <input 
                            type="email" 
                            class="form-control" 
                            id="email" 
                            name="email" 
                            placeholder="Nhập địa chỉ email của bạn"
                            required 
                            autofocus
                            >
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="password">
                            <i class="fas fa-lock"></i>
                            Mật khẩu
                        </label>
                        <input 
                            type="password" 
                            class="form-control" 
                            id="password" 
                            name="password" 
                            placeholder="Nhập mật khẩu của bạn"
                            required
                            >
                        <i class="fas fa-eye password-toggle" id="togglePassword"></i>
                    </div>

                    <button type="submit" class="btn btn-login">
                        <span>Đăng nhập</span>
                    </button>
                </form>

                <div class="extra-links">
                    <a href="#"><i class="fas fa-key"></i> Quên mật khẩu?</a>
                    <a href="register"><i class="fas fa-user-plus"></i> Đăng ký</a>
                </div>
            </div>
        </div>

        <!-- Bootstrap 5 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            // Toggle Password Visibility
            const togglePassword = document.getElementById('togglePassword');
            const passwordInput = document.getElementById('password');

            if (togglePassword) {
                togglePassword.addEventListener('click', function () {
                    const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                    passwordInput.setAttribute('type', type);
                    this.classList.toggle('fa-eye');
                    this.classList.toggle('fa-eye-slash');
                });
            }

            // Add smooth animation on input focus
            const inputs = document.querySelectorAll('.form-control');
            inputs.forEach(input => {
                input.addEventListener('focus', function () {
                    this.parentElement.classList.add('focused');
                });

                input.addEventListener('blur', function () {
                    this.parentElement.classList.remove('focused');
                });
            });
        </script>
    </body>
</html>