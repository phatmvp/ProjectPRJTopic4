<%-- 
    Document   : RegisterPage
    Created on : Oct 19, 2025, 3:18:22 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cook - Đăng Ký</title>
    
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
        
        html, body {
            height: 100%;
            overflow-x: hidden;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #feca57 0%, #ff6b6b 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
        }
        
        /* Static Background Elements */
        body::before {
            content: '';
            position: fixed;
            width: 600px;
            height: 600px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            top: -300px;
            left: -300px;
            z-index: 0;
        }
        
        body::after {
            content: '';
            position: fixed;
            width: 450px;
            height: 450px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 50%;
            bottom: -225px;
            right: -225px;
            z-index: 0;
        }
        
        .register-container {
            position: relative;
            z-index: 1;
            width: 100%;
            max-width: 500px;
            margin: auto;
        }
        
        .register-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 25px;
            padding: 45px 40px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .register-card:hover {
            box-shadow: 0 25px 70px rgba(0, 0, 0, 0.25);
        }
        
        .register-header {
            text-align: center;
            margin-bottom: 35px;
        }
        
        .logo-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #feca57, #ff6b6b);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 40px;
            color: white;
            box-shadow: 0 10px 30px rgba(254, 202, 87, 0.4);
        }
        
        .register-header h2 {
            color: #333;
            font-weight: 700;
            font-size: 32px;
            margin-bottom: 10px;
        }
        
        .register-header p {
            color: #666;
            font-size: 15px;
            font-weight: 400;
        }
        
        .form-group {
            margin-bottom: 22px;
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
            color: #feca57;
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
            border-color: #feca57;
            box-shadow: 0 0 0 0.2rem rgba(254, 202, 87, 0.15);
            background: white;
            transform: translateY(-2px);
        }
        
        .form-control:hover {
            border-color: #ff6b6b;
            background: white;
        }
        
        .password-strength {
            height: 4px;
            background: #e0e0e0;
            border-radius: 2px;
            margin-top: 8px;
            overflow: hidden;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        
        .password-strength.show {
            opacity: 1;
        }
        
        .password-strength-bar {
            height: 100%;
            width: 0;
            transition: all 0.3s ease;
            border-radius: 2px;
        }
        
        .strength-weak {
            width: 33%;
            background: #ff6b6b;
        }
        
        .strength-medium {
            width: 66%;
            background: #feca57;
        }
        
        .strength-strong {
            width: 100%;
            background: #26de81;
        }
        
        .btn-register {
            width: 100%;
            padding: 15px;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #feca57 0%, #ff6b6b 100%);
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 5px 20px rgba(254, 202, 87, 0.4);
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
            margin-top: 10px;
        }
        
        .btn-register::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%);
            transition: left 0.5s ease;
        }
        
        .btn-register:hover::before {
            left: 0;
        }
        
        .btn-register span {
            position: relative;
            z-index: 1;
        }
        
        .btn-register:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 30px rgba(254, 202, 87, 0.6);
        }
        
        .btn-register:active {
            transform: translateY(-1px);
        }
        
        .alert {
            border-radius: 12px;
            padding: 15px 20px;
            margin-bottom: 25px;
            border: none;
            animation: slideInAlert 0.5s ease;
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 14px;
        }
        
        @keyframes slideInAlert {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
        
        .alert-danger {
            background: linear-gradient(135deg, #ff6b6b, #ff8787);
            color: white;
            box-shadow: 0 5px 20px rgba(255, 107, 107, 0.3);
        }
        
        .alert-success {
            background: linear-gradient(135deg, #26de81, #20bf6b);
            color: white;
            box-shadow: 0 5px 20px rgba(38, 222, 129, 0.3);
        }
        
        .alert i {
            font-size: 20px;
        }
        
        .divider {
            text-align: center;
            margin: 25px 0;
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
        
        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #666;
        }
        
        .login-link a {
            color: #feca57;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .login-link a:hover {
            color: #ff6b6b;
            text-decoration: underline;
        }
        
        .password-toggle {
            position: absolute;
            right: 20px;
            top: 42px;
            cursor: pointer;
            color: #999;
            transition: color 0.3s ease;
            z-index: 10;
        }
        
        .password-toggle:hover {
            color: #feca57;
        }
        
        .input-wrapper {
            position: relative;
        }
        
        .input-icon {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
            pointer-events: none;
            transition: color 0.3s ease;
        }
        
        .form-control:focus ~ .input-icon {
            color: #feca57;
        }
        
        .form-control.has-icon {
            padding-left: 50px;
        }
        
        .requirements {
            font-size: 12px;
            color: #999;
            margin-top: 8px;
            padding-left: 5px;
        }
        
        .requirements.show {
            animation: fadeIn 0.3s ease;
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        
        .requirement-item {
            display: flex;
            align-items: center;
            gap: 6px;
            margin-top: 4px;
        }
        
        .requirement-item i {
            font-size: 10px;
        }
        
        .requirement-item.valid {
            color: #26de81;
        }
        
        .requirement-item.valid i {
            color: #26de81;
        }
        
        @media (max-width: 576px) {
            .register-card {
                padding: 35px 25px;
            }
            
            .register-header h2 {
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
    <div class="register-container">
        <div class="register-card">
            <div class="register-header">
                <div class="logo-icon">
                    <i class="fas fa-utensils"></i>
                </div>
                <h2>Cook</h2>
                <p>Tạo tài khoản mới</p>
            </div>
            
            <% 
                String error = (String) request.getAttribute("error");
                String success = (String) request.getAttribute("success");
                if (error != null && !error.isEmpty()) {
            %>
                <div class="alert alert-danger" role="alert">
                    <i class="fas fa-exclamation-circle"></i>
                    <span><%= error %></span>
                </div>
            <% } %>
            
            <% if (success != null && !success.isEmpty()) { %>
                <div class="alert alert-success" role="alert">
                    <i class="fas fa-check-circle"></i>
                    <span><%= success %></span>
                </div>
            <% } %>
            
            <form action="register" method="POST" id="registerForm">
                <div class="form-group">
                    <label class="form-label" for="username">
                        <i class="fas fa-user"></i>
                        Tên người dùng
                    </label>
                    <input 
                        type="text" 
                        class="form-control" 
                        id="username" 
                        name="username" 
                        placeholder="Nhập tên người dùng"
                        required 
                        autofocus
                        minlength="3"
                    >
                </div>
                
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
                        placeholder="Tạo mật khẩu mạnh"
                        required
                        minlength="6"
                    >
                    <i class="fas fa-eye password-toggle" id="togglePassword"></i>
                    <div class="password-strength" id="passwordStrength">
                        <div class="password-strength-bar" id="strengthBar"></div>
                    </div>
                    <div class="requirements" id="passwordRequirements">
                        <div class="requirement-item" id="req-length">
                            <i class="fas fa-circle"></i>
                            <span>Tối thiểu 6 ký tự</span>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="confirmPassword">
                        <i class="fas fa-lock"></i>
                        Xác nhận mật khẩu
                    </label>
                    <input 
                        type="password" 
                        class="form-control" 
                        id="confirmPassword" 
                        name="confirmPassword" 
                        placeholder="Nhập lại mật khẩu"
                        required
                    >
                    <i class="fas fa-eye password-toggle" id="toggleConfirmPassword" style="top: 42px;"></i>
                </div>
                
                <button type="submit" class="btn btn-register">
                    <span><i class="fas fa-user-plus"></i> Đăng ký</span>
                </button>
            </form>
            
            <div class="login-link">
                Đã có tài khoản? <a href="login"><i class="fas fa-sign-in-alt"></i> Đăng nhập ngay</a>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Toggle Password Visibility
        const togglePassword = document.getElementById('togglePassword');
        const passwordInput = document.getElementById('password');
        const toggleConfirmPassword = document.getElementById('toggleConfirmPassword');
        const confirmPasswordInput = document.getElementById('confirmPassword');
        
        if (togglePassword) {
            togglePassword.addEventListener('click', function() {
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            });
        }
        
        if (toggleConfirmPassword) {
            toggleConfirmPassword.addEventListener('click', function() {
                const type = confirmPasswordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                confirmPasswordInput.setAttribute('type', type);
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            });
        }
        
        // Password Strength Checker
        const strengthBar = document.getElementById('strengthBar');
        const passwordStrength = document.getElementById('passwordStrength');
        const passwordRequirements = document.getElementById('passwordRequirements');
        const reqLength = document.getElementById('req-length');
        
        passwordInput.addEventListener('input', function() {
            const password = this.value;
            const length = password.length;
            
            if (length > 0) {
                passwordStrength.classList.add('show');
                passwordRequirements.classList.add('show');
            } else {
                passwordStrength.classList.remove('show');
                passwordRequirements.classList.remove('show');
            }
            
            // Check length requirement
            if (length >= 6) {
                reqLength.classList.add('valid');
            } else {
                reqLength.classList.remove('valid');
            }
            
            // Calculate strength
            let strength = 0;
            if (length >= 6) strength++;
            if (length >= 10) strength++;
            if (/[A-Z]/.test(password)) strength++;
            if (/[0-9]/.test(password)) strength++;
            if (/[^A-Za-z0-9]/.test(password)) strength++;
            
            // Update strength bar
            strengthBar.className = 'password-strength-bar';
            if (strength <= 2) {
                strengthBar.classList.add('strength-weak');
            } else if (strength <= 4) {
                strengthBar.classList.add('strength-medium');
            } else {
                strengthBar.classList.add('strength-strong');
            }
        });
        
        // Form Validation
        const form = document.getElementById('registerForm');
        
        form.addEventListener('submit', function(e) {
            const password = passwordInput.value;
            const confirmPassword = confirmPasswordInput.value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Mật khẩu xác nhận không khớp!');
                confirmPasswordInput.focus();
                return false;
            }
            
            if (password.length < 6) {
                e.preventDefault();
                alert('Mật khẩu phải có ít nhất 6 ký tự!');
                passwordInput.focus();
                return false;
            }
        });
        
        // Add smooth animation on input focus
        const inputs = document.querySelectorAll('.form-control');
        inputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.classList.remove('focused');
            });
        });
        
        // Real-time password match indicator
        confirmPasswordInput.addEventListener('input', function() {
            const password = passwordInput.value;
            const confirmPassword = this.value;
            
            if (confirmPassword.length > 0) {
                if (password === confirmPassword) {
                    this.style.borderColor = '#26de81';
                } else {
                    this.style.borderColor = '#ff6b6b';
                }
            } else {
                this.style.borderColor = '#e0e0e0';
            }
        });
    </script>
</body>
</html>