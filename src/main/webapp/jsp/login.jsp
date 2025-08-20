<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Pahana Edu Management System</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body class="login-page">
<div class="login-container">
    <div class="login-header">
        <h1>Pahana Edu</h1>
        <h2>Bookshop Management System</h2>
        <p>Admin Login</p>
    </div>

    <div class="login-form-container">
        <!-- Display success message if logout was successful -->
        <% if ("success".equals(request.getParameter("logout"))) { %>
        <div class="alert alert-success">
            <i class="icon-success">✓</i>
            You have been successfully logged out.
        </div>
        <% } %>

        <!-- Display error message if logout failed -->
        <% if ("logout_failed".equals(request.getParameter("error"))) { %>
        <div class="alert alert-error">
            <i class="icon-error">✗</i>
            Logout failed. Please try again.
        </div>
        <% } %>

        <!-- Display error message from servlet -->
        <% if (request.getAttribute("errorMessage") != null) { %>
        <div class="alert alert-error">
            <i class="icon-error">✗</i>
            <%= request.getAttribute("errorMessage") %>
        </div>
        <% } %>

        <!-- Display success message from servlet -->
        <% if (request.getAttribute("successMessage") != null) { %>
        <div class="alert alert-success">
            <i class="icon-success">✓</i>
            <%= request.getAttribute("successMessage") %>
        </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/login" method="post" class="login-form" id="loginForm">
            <input type="hidden" name="action" value="login">

            <div class="form-group">
                <label for="username">Username</label>
                <div class="input-container">
                    <input type="text"
                           id="username"
                           name="username"
                           value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>"
                           placeholder="Enter your username"
                           required
                           autocomplete="username"
                           maxlength="50">
                    <span class="input-icon">👤</span>
                </div>
                <span class="error-message" id="usernameError"></span>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <div class="input-container">
                    <input type="password"
                           id="password"
                           name="password"
                           placeholder="Enter your password"
                           required
                           autocomplete="current-password"
                           maxlength="255">
                    <span class="input-icon">🔒</span>
                    <button type="button" class="toggle-password" id="togglePassword">👁</button>
                </div>
                <span class="error-message" id="passwordError"></span>
            </div>

            <div class="form-group">
                <button type="submit" class="btn-login" id="loginBtn">
                    <span class="btn-text">Login</span>
                    <span class="btn-loading" style="display: none;">
                            <span class="spinner"></span>
                            Logging in...
                        </span>
                </button>
            </div>
        </form>

        <div class="login-help">
            <div class="demo-credentials">
                <h4>Demo Credentials:</h4>
                <p><strong>Username:</strong> admin</p>
                <p><strong>Password:</strong> admin123</p>
            </div>

            <div class="system-info">
                <p><small>© 2025 Pahana Edu Bookshop Management System</small></p>
                <p><small>Version 1.0.0</small></p>
            </div>
        </div>
    </div>
</div>

<!-- Loading overlay -->
<div id="loadingOverlay" class="loading-overlay" style="display: none;">
    <div class="loading-spinner">
        <div class="spinner-large"></div>
        <p>Authenticating...</p>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/login.js"></script>
<script>
    // Auto-hide alerts after 5 seconds
    document.addEventListener('DOMContentLoaded', function() {
        const alerts = document.querySelectorAll('.alert');
        alerts.forEach(function(alert) {
            setTimeout(function() {
                alert.style.opacity = '0';
                setTimeout(function() {
                    alert.style.display = 'none';
                }, 300);
            }, 5000);
        });

        // Focus on username field
        const usernameField = document.getElementById('username');
        if (usernameField && !usernameField.value) {
            usernameField.focus();
        } else {
            const passwordField = document.getElementById('password');
            if (passwordField) {
                passwordField.focus();
            }
        }
    });

    // Password toggle functionality
    document.getElementById('togglePassword').addEventListener('click', function() {
        const passwordField = document.getElementById('password');
        const toggleBtn = this;

        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            toggleBtn.textContent = '🙈';
        } else {
            passwordField.type = 'password';
            toggleBtn.textContent = '👁';
        }
    });

    // Form submission handling
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        const loginBtn = document.getElementById('loginBtn');
        const btnText = loginBtn.querySelector('.btn-text');
        const btnLoading = loginBtn.querySelector('.btn-loading');
        const overlay = document.getElementById('loadingOverlay');

        // Show loading state
        btnText.style.display = 'none';
        btnLoading.style.display = 'inline-flex';
        loginBtn.disabled = true;
        overlay.style.display = 'flex';

        // Basic client-side validation
        const username = document.getElementById('username').value.trim();
        const password = document.getElementById('password').value.trim();

        if (!username || !password) {
            e.preventDefault();

            // Reset button state
            btnText.style.display = 'inline';
            btnLoading.style.display = 'none';
            loginBtn.disabled = false;
            overlay.style.display = 'none';

            if (!username) {
                document.getElementById('usernameError').textContent = 'Username is required';
            }
            if (!password) {
                document.getElementById('passwordError').textContent = 'Password is required';
            }
        }
    });

    // Clear error messages on input
    ['username', 'password'].forEach(function(fieldId) {
        document.getElementById(fieldId).addEventListener('input', function() {
            document.getElementById(fieldId + 'Error').textContent = '';
        });
    });
</script>
</body>
</html>