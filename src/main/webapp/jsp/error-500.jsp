<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Server Error - Pahana Edu</title>
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
            background: linear-gradient(135deg, #fdf2f2 0%, #fce4ec 100%);
        }

        .error-card {
            background: white;
            border-radius: 20px;
            padding: 3rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            max-width: 600px;
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
            margin-bottom: 2rem;
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

        .btn-danger {
            background: #e74c3c;
            color: white;
        }

        .btn-danger:hover {
            background: #c0392b;
        }

        .error-details {
            text-align: left;
            padding: 1rem;
            background: #f8f9fa;
            border-radius: 8px;
            font-size: 0.9rem;
            color: #6c757d;
            margin-top: 2rem;
        }

        .error-technical {
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            border-radius: 8px;
            padding: 1rem;
            margin-top: 1rem;
            text-align: left;
            max-height: 200px;
            overflow-y: auto;
        }

        .error-technical h4 {
            margin: 0 0 0.5rem 0;
            color: #856404;
        }

        .error-technical pre {
            margin: 0;
            font-size: 0.8rem;
            white-space: pre-wrap;
            word-break: break-all;
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
        <div class="error-icon">⚠️</div>
        <h1 class="error-code">500</h1>
        <h2 class="error-title">Internal Server Error</h2>
        <p class="error-message">
            Oops! Something went wrong on our server. We're sorry for the inconvenience.
            Our technical team has been notified and is working to fix this issue.
        </p>

        <div class="error-actions">
            <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-primary">
                🏠 Go to Dashboard
            </a>
            <a href="javascript:location.reload()" class="btn btn-secondary">
                🔄 Try Again
            </a>
            <a href="${pageContext.request.contextPath}/jsp/help.jsp" class="btn btn-danger">
                🆘 Get Help
            </a>
        </div>

        <div class="error-details">
            <strong>Error ID:</strong> <%= System.currentTimeMillis() %><br>
            <strong>Time:</strong> <%= new java.util.Date() %><br>
            <strong>User:</strong> <%= session != null && session.getAttribute("adminUser") != null ? "Logged in" : "Not logged in" %><br>
            <strong>Request URI:</strong> <%= request.getRequestURI() %>
        </div>

        <!-- Technical details (only show in development) -->
        <% if (exception != null) { %>
        <div class="error-technical">
            <h4>🔧 Technical Details</h4>
            <strong>Exception:</strong> <%= exception.getClass().getSimpleName() %><br>
            <strong>Message:</strong> <%= exception.getMessage() != null ? exception.getMessage() : "No message available" %><br>
            <% if (exception.getCause() != null) { %>
            <strong>Cause:</strong> <%= exception.getCause().getMessage() %>
            <% } %>
        </div>
        <% } %>

        <!-- Helpful suggestions -->
        <div class="error-technical">
            <h4>💡 What you can do:</h4>
            <ul style="text-align: left; margin: 0.5rem 0;">
                <li>Try refreshing the page</li>
                <li>Check if you're still logged in</li>
                <li>Go back and try a different action</li>
                <li>Contact support if the problem persists</li>
            </ul>
        </div>
    </div>
</div>

<script>
    // Log error for debugging
    console.error('500 Error - Internal server error occurred');
    console.error('URL:', window.location.href);
    console.error('Time:', new Date().toISOString());

    <% if (exception != null) { %>
    console.error('Exception:', '<%= exception.getClass().getSimpleName() %>');
    console.error('Message:', '<%= exception.getMessage() != null ? exception.getMessage().replace("'", "\\'") : "No message" %>');
    <% } %>

    // Auto-refresh after 30 seconds
    setTimeout(() => {
        if (confirm('Would you like to try refreshing the page?')) {
            location.reload();
        }
    }, 30000);
</script>
</body>
</html>