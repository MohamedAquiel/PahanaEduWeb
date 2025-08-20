<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Not Found - Pahana Edu</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .error-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            text-align: center;
            padding: 2rem;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        }

        .error-card {
            background: white;
            border-radius: 20px;
            padding: 3rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            max-width: 500px;
            width: 100%;
        }

        .error-icon {
            font-size: 5rem;
            margin-bottom: 1rem;
            color: #e74c3c;
        }

        .error-code {
            font-size: 4rem;
            font-weight: bold;
            color: #e74c3c;
            margin: 0;
        }

        .error-title {
            font-size: 1.5rem;
            color: #2c3e50;
            margin: 1rem 0;
        }

        .error-message {
            color: #7f8c8d;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .error-actions {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn-primary {
            background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%);
            color: white;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #229954 0%, #27ae60 100%);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(39, 174, 96, 0.3);
        }

        .btn-secondary {
            background: #ecf0f1;
            color: #2c3e50;
        }

        .btn-secondary:hover {
            background: #d5dbdb;
        }

        .error-details {
            margin-top: 2rem;
            padding: 1rem;
            background: #f8f9fa;
            border-radius: 8px;
            font-size: 0.9rem;
            color: #6c757d;
        }

        @media (max-width: 768px) {
            .error-card {
                padding: 2rem;
                margin: 1rem;
            }

            .error-code {
                font-size: 3rem;
            }

            .error-actions {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
<div class="error-container">
    <div class="error-card">
        <div class="error-icon">🔍</div>
        <h1 class="error-code">404</h1>
        <h2 class="error-title">Page Not Found</h2>
        <p class="error-message">
            Sorry, the page you are looking for could not be found.
            It might have been moved, deleted, or you entered the wrong URL.
        </p>

        <div class="error-actions">
            <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-primary">
                🏠 Go to Dashboard
            </a>
            <a href="javascript:history.back()" class="btn btn-secondary">
                ← Go Back
            </a>
        </div>

        <div class="error-details">
            <strong>Requested URL:</strong> <%= request.getRequestURL() %><br>
            <strong>Time:</strong> <%= new java.util.Date() %><br>
            <strong>User Agent:</strong> <%= request.getHeader("User-Agent") != null ? request.getHeader("User-Agent") : "Unknown" %>
        </div>
    </div>
</div>

<script>
    // Auto-redirect after 10 seconds
    let countdown = 10;
    const redirectTimer = setInterval(() => {
        countdown--;
        if (countdown <= 0) {
            clearInterval(redirectTimer);
            window.location.href = '${pageContext.request.contextPath}/dashboard';
        }
    }, 1000);

    // Log error for debugging
    console.error('404 Error - Page not found:', window.location.href);
</script>
</body>
</html>