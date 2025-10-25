<%-- 
    Document   : HomePage
    Created on : Oct 18, 2025, 10:02:45 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Quản lý Công thức Nấu ăn</title>

        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

        <style>
            body {
                background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
                min-height: 100vh;
            }

            .hero-section {
                background: linear-gradient(135deg, rgba(255, 107, 107, 0.95), rgba(254, 202, 87, 0.95));
                color: white;
                padding: 50px 0;
                margin-bottom: 40px;
                border-radius: 25px;
                box-shadow: 0 10px 40px rgba(0,0,0,0.15);
            }

            .hero-title {
                font-size: 2.5rem;
                font-weight: 700;
            }

            .search-box {
                background: white;
                border-radius: 50px;
                padding: 8px 15px;
                box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            }

            .search-box input {
                border: none;
                outline: none;
                padding: 8px 15px;
            }

            .btn-gradient {
                background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%);
                color: white;
                border: none;
                padding: 10px 25px;
                border-radius: 25px;
                font-weight: 600;
                transition: all 0.3s ease;
            }

            .btn-gradient:hover {
                transform: scale(1.05);
                box-shadow: 0 5px 15px rgba(255, 107, 107, 0.4);
                color: white;
            }

            .stat-box {
                background: white;
                padding: 25px;
                border-radius: 20px;
                text-align: center;
                box-shadow: 0 5px 20px rgba(0,0,0,0.1);
                transition: transform 0.3s ease;
            }

            .stat-box:hover {
                transform: translateY(-5px);
            }

            .stat-number {
                font-size: 2.2rem;
                font-weight: 700;
                color: #ff6b6b;
            }

            .section-title {
                font-size: 1.8rem;
                font-weight: 700;
                color: #333;
                margin-bottom: 25px;
            }

            .category-card {
                background: white;
                border-radius: 20px;
                overflow: hidden;
                transition: all 0.3s ease;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
                cursor: pointer;
            }

            .category-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 12px 30px rgba(0,0,0,0.2);
            }

            .category-img {
                height: 160px;
                object-fit: cover;
                width: 100%;
            }

            .badge-custom {
                background: linear-gradient(135deg, #ff6b6b 0%, #feca57 100%);
                color: white;
                padding: 5px 15px;
                border-radius: 20px;
                font-size: 0.85rem;
            }

            .recipe-card {
                background: white;
                border-radius: 20px;
                overflow: hidden;
                transition: all 0.3s ease;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
                height: 100%;
            }

            .recipe-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 15px 35px rgba(0,0,0,0.2);
            }

            .recipe-img {
                height: 220px;
                object-fit: cover;
                width: 100%;
            }

            .recipe-meta {
                color: #888;
                font-size: 0.9rem;
            }

            @media (max-width: 768px) {
                .hero-title {
                    font-size: 1.8rem;
                }
                .recipe-img {
                    height: 180px;
                }
            }
        </style>

    </head>
    <body>

        <!-- ===== NAVBAR ===== -->
        <%@ include file="includes/navbar.jsp" %>

        <main class="container my-4">

            <!-- ===== HERO ===== -->
            <section class="hero-section">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-8 mb-4 mb-lg-0">
                            <h1 class="hero-title mb-3">Khám phá Hàng ngàn Công thức Tuyệt vời</h1>
                            <p class="fs-5 mb-4">Nơi chia sẻ đam mê ẩm thực và kết nối những người yêu nấu ăn</p>

                            <div class="search-box d-flex align-items-center mb-3">
                                <i class="bi bi-search text-muted fs-5 ms-2"></i>
                                <input type="text" class="flex-grow-1" placeholder="Tìm kiếm món ăn, nguyên liệu...">
                                <button class="btn btn-gradient">Tìm kiếm</button>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="row g-3">
                                <div class="col-6">
                                    <div class="stat-box">
                                        <div class="stat-number">1.2K+</div>
                                        <div class="text-muted">Công thức</div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="stat-box">
                                        <div class="stat-number">5K+</div>
                                        <div class="text-muted">Người dùng</div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <a href="#" class="btn btn-light w-100 py-3 fw-bold">
                                        <i class="bi bi-plus-circle"></i> Thêm công thức mới
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ===== DANH MỤC ===== -->
            <section class="mb-5">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="section-title mb-0">Danh mục Phổ biến</h2>
                    <a href="#" class="text-decoration-none fw-semibold" style="color: #ff6b6b;">
                        Xem tất cả <i class="bi bi-arrow-right"></i>
                    </a>
                </div>

                <div class="row g-4">
                    <div class="col-6 col-md-3">
                        <div class="category-card">
                            <img src="https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=400" class="category-img" alt="Món Ý">
                            <div class="p-3 text-center">
                                <h5 class="mb-2">Món Ý</h5>
                                <span class="badge-custom">120 công thức</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-md-3">
                        <div class="category-card">
                            <img src="https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=400" class="category-img" alt="Món Nhật">
                            <div class="p-3 text-center">
                                <h5 class="mb-2">Món Nhật</h5>
                                <span class="badge-custom">85 công thức</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-md-3">
                        <div class="category-card">
                            <img src="https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400" class="category-img" alt="Salad">
                            <div class="p-3 text-center">
                                <h5 class="mb-2">Món Salad</h5>
                                <span class="badge-custom">95 công thức</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-md-3">
                        <div class="category-card">
                            <img src="https://images.unsplash.com/photo-1547592166-23ac45744acd?w=400" class="category-img" alt="Canh">
                            <div class="p-3 text-center">
                                <h5 class="mb-2">Canh & Súp</h5>
                                <span class="badge-custom">70 công thức</span>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- ===== CÔNG THỨC ===== -->
            <section>
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2 class="section-title mb-0">Công thức Mới nhất</h2>
                    <a href="#" class="text-decoration-none fw-semibold" style="color: #ff6b6b;">
                        Xem thêm <i class="bi bi-arrow-right"></i>
                    </a>
                </div>

                <div class="row g-4">
                    <div class="col-md-6 col-lg-4">
                        <div class="recipe-card">
                            <img src="https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=400" class="recipe-img" alt="Sushi">
                            <div class="p-4">
                                <span class="badge-custom mb-2">Món Nhật</span>
                                <h5 class="mb-2 mt-2">Sushi Cá Hồi Tươi</h5>
                                <p class="recipe-meta mb-3">
                                    <i class="bi bi-clock"></i> 30 phút • 
                                    <i class="bi bi-people"></i> 2 người
                                </p>
                                <p class="text-muted mb-3">Hướng dẫn làm sushi cá hồi tươi ngon chuẩn vị Nhật Bản với các bước chi tiết.</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="d-flex align-items-center">
                                        <img src="https://i.pravatar.cc/40?img=1" class="rounded-circle me-2" width="35" height="35">
                                        <small class="text-muted">Chef Minh</small>
                                    </div>
                                    <a href="#" class="btn btn-sm btn-gradient">Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-4">
                        <div class="recipe-card">
                            <img src="https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=400" class="recipe-img" alt="Pasta">
                            <div class="p-4">
                                <span class="badge-custom mb-2">Món Ý</span>
                                <h5 class="mb-2 mt-2">Pasta Carbonara</h5>
                                <p class="recipe-meta mb-3">
                                    <i class="bi bi-clock"></i> 25 phút • 
                                    <i class="bi bi-people"></i> 3 người
                                </p>
                                <p class="text-muted mb-3">Món ăn đặc trưng nước Ý với sốt kem trứng béo ngậy và thịt xông khói thơm lừng.</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="d-flex align-items-center">
                                        <img src="https://i.pravatar.cc/40?img=2" class="rounded-circle me-2" width="35" height="35">
                                        <small class="text-muted">Nga Nguyễn</small>
                                    </div>
                                    <a href="#" class="btn btn-sm btn-gradient">Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-4">
                        <div class="recipe-card">
                            <img src="https://images.unsplash.com/photo-1547592166-23ac45744acd?w=400" class="recipe-img" alt="Soup">
                            <div class="p-4">
                                <span class="badge-custom mb-2">Món Canh</span>
                                <h5 class="mb-2 mt-2">Súp Bí Đỏ Kem</h5>
                                <p class="recipe-meta mb-3">
                                    <i class="bi bi-clock"></i> 20 phút • 
                                    <i class="bi bi-people"></i> 4 người
                                </p>
                                <p class="text-muted mb-3">Súp bí đỏ thơm ngon, béo nhẹ và bổ dưỡng, rất phù hợp cho bữa sáng.</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="d-flex align-items-center">
                                        <img src="https://i.pravatar.cc/40?img=3" class="rounded-circle me-2" width="35" height="35">
                                        <small class="text-muted">Thu Hương</small>
                                    </div>
                                    <a href="#" class="btn btn-sm btn-gradient">Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main>

        <!-- ===== Footer ===== -->
        <%@ include file="includes/footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>