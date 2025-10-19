<%-- 
    Document   : footer
    Created on : Oct 19, 2025, 3:56:34 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .footer-custom {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        border-top: 3px solid;
        border-image: linear-gradient(90deg, #ff6b6b 0%, #feca57 100%) 1;
        margin-top: 60px;
    }
    
    .footer-brand {
        font-weight: 700;
        font-size: 1.5rem;
        background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }
    
    .footer-link {
        color: #666;
        text-decoration: none;
        transition: all 0.3s ease;
        font-weight: 500;
    }
    
    .footer-link:hover {
        color: #ff6b6b;
        transform: translateY(-2px);
    }
    
    .social-icon {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%);
        color: white;
        font-size: 1.2rem;
        transition: all 0.3s ease;
        text-decoration: none;
    }
    
    .social-icon:hover {
        transform: translateY(-5px) scale(1.1);
        box-shadow: 0 5px 15px rgba(255, 107, 107, 0.4);
        color: white;
    }
    
    .footer-description {
        color: #888;
        font-size: 0.95rem;
    }
    
    .footer-section-title {
        color: #ff6b6b;
        font-weight: 600;
        margin-bottom: 15px;
        font-size: 1.1rem;
    }
    
    .copyright {
        background: linear-gradient(135deg, rgba(255, 107, 107, 0.05), rgba(254, 202, 87, 0.05));
        padding: 15px 0;
        margin-top: 30px;
    }
</style>

<footer class="footer-custom text-dark pt-5 pb-3">
    <div class="container">
        <div class="row">
            <!-- Brand Section -->
            <div class="col-md-4 mb-4">
                <h4 class="footer-brand mb-3">
                    <i class="bi bi-fire"></i> CookManager
                </h4>
                <p class="footer-description">
                    Nền tảng chia sẻ công thức nấu ăn hàng đầu, nơi kết nối đam mê ẩm thực và lan tỏa những món ăn tuyệt vời.
                </p>
                <div class="mt-3">
                    <a href="#" class="social-icon me-2">
                        <i class="bi bi-facebook"></i>
                    </a>
                    <a href="#" class="social-icon me-2">
                        <i class="bi bi-instagram"></i>
                    </a>
                    <a href="#" class="social-icon me-2">
                        <i class="bi bi-youtube"></i>
                    </a>
                    <a href="#" class="social-icon">
                        <i class="bi bi-tiktok"></i>
                    </a>
                </div>
            </div>
            
            <!-- Quick Links -->
            <div class="col-md-3 col-6 mb-4">
                <h6 class="footer-section-title">Khám phá</h6>
                <ul class="list-unstyled">
                    <li class="mb-2">
                        <a href="#" class="footer-link">
                            <i class="bi bi-chevron-right"></i> Trang chủ
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="#" class="footer-link">
                            <i class="bi bi-chevron-right"></i> Danh mục
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="#" class="footer-link">
                            <i class="bi bi-chevron-right"></i> Công thức mới
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="#" class="footer-link">
                            <i class="bi bi-chevron-right"></i> Món ăn phổ biến
                        </a>
                    </li>
                </ul>
            </div>
            
            <!-- Support Links -->
            <div class="col-md-3 col-6 mb-4">
                <h6 class="footer-section-title">Hỗ trợ</h6>
                <ul class="list-unstyled">
                    <li class="mb-2">
                        <a href="#" class="footer-link">
                            <i class="bi bi-chevron-right"></i> Về chúng tôi
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="#" class="footer-link">
                            <i class="bi bi-chevron-right"></i> Liên hệ
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="#" class="footer-link">
                            <i class="bi bi-chevron-right"></i> Điều khoản
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="#" class="footer-link">
                            <i class="bi bi-chevron-right"></i> Chính sách
                        </a>
                    </li>
                </ul>
            </div>
            
            <!-- Contact Info -->
            <div class="col-md-2 mb-4">
                <h6 class="footer-section-title">Liên hệ</h6>
                <ul class="list-unstyled footer-description">
                    <li class="mb-2">
                        <i class="bi bi-envelope"></i> phat@gmail.com
                    </li>
                    <li class="mb-2">
                        <i class="bi bi-telephone"></i> 0123 456 789
                    </li>
                    <li class="mb-2">
                        <i class="bi bi-geo-alt"></i> Hải Phòng
                    </li>
                </ul>
            </div>
        </div>
        
        
    </div>
</footer>