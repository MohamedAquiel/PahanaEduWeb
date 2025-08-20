<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pahanaedu.model.Customer" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Details - Pahana Edu</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .customer-header {
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            position: relative;
            overflow: hidden;
        }

        .customer-header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -10%;
            width: 100px;
            height: 100px;
            background: rgba(255,255,255,0.1);
            border-radius: 50%;
            transform: rotate(45deg);
        }

        .customer-info-header {
            display: flex;
            align-items: center;
            gap: 1.5rem;
            margin-bottom: 1rem;
        }

        .customer-avatar {
            width: 80px;
            height: 80px;
            background: rgba(255,255,255,0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            font-weight: bold;
            border: 3px solid rgba(255,255,255,0.3);
        }

        .customer-basic-info h1 {
            margin: 0 0 0.5rem 0;
            font-size: 2.2rem;
        }

        .customer-basic-info p {
            margin: 0;
            opacity: 0.9;
            font-size: 1.1rem;
        }

        .customer-status {
            position: absolute;
            top: 2rem;
            right: 2rem;
            background: rgba(255,255,255,0.2);
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: 600;
            backdrop-filter: blur(10px);
        }

        .customer-details-container {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .main-details {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .details-header {
            background: #f8f9fa;
            padding: 1.5rem;
            border-bottom: 1px solid #e9ecef;
        }

        .details-header h3 {
            margin: 0;
            color: #2c3e50;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .details-content {
            padding: 1.5rem;
        }

        .detail-group {
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #f8f9fa;
        }

        .detail-group:last-child {
            border-bottom: none;
            margin-bottom: 0;
        }

        .detail-label {
            font-size: 0.9rem;
            color: #7f8c8d;
            margin-bottom: 0.25rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-weight: 600;
        }

        .detail-value {
            font-size: 1.1rem;
            color: #2c3e50;
            font-weight: 500;
            word-break: break-word;
        }

        .detail-value.highlight {
            color: #3498db;
            font-weight: 600;
        }

        .quick-stats {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            overflow: hidden;
            height: fit-content;
        }

        .stats-header {
            background: linear-gradient(135deg, #f39c12 0%, #e67e22 100%);
            color: white;
            padding: 1.5rem;
            text-align: center;
        }

        .stats-header h3 {
            margin: 0;
            font-size: 1.3rem;
        }

        .stats-content {
            padding: 1.5rem;
        }

        .stat-item {
            text-align: center;
            margin-bottom: 1.5rem;
            padding: 1rem;
            background: #f8f9fa;
            border-radius: 10px;
            border-left: 4px solid #3498db;
        }

        .stat-item:last-child {
            margin-bottom: 0;
        }

        .stat-number {
            font-size: 2rem;
            font-weight: bold;
            color: #2c3e50;
            margin: 0;
        }

        .stat-label {
            font-size: 0.9rem;
            color: #7f8c8d;
            margin: 0;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .units-display {
            background: linear-gradient(135deg, #e8f5e8 0%, #f0fff0 100%);
            border: 2px solid #27ae60;
            border-radius: 10px;
            padding: 1rem;
            text-align: center;
            margin: 1rem 0;
        }

        .units-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: #27ae60;
            margin: 0;
        }

        .units-label {
            color: #2c3e50;
            font-weight: 600;
            margin: 0;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
            flex-wrap: wrap;
        }

        .btn-action {
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            min-width: 140px;
            justify-content: center;
        }

        .btn-edit {
            background: linear-gradient(135deg, #f39c12 0%, #e67e22 100%);
            color: white;
        }

        .btn-bill {
            background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%);
            color: white;
        }

        .btn-delete {
            background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
            color: white;
        }

        .btn-back {
            background: linear-gradient(135deg, #95a5a6 0%, #7f8c8d 100%);
            color: white;
        }

        .btn-action:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        }

        .customer-activity {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            margin-top: 2rem;
            overflow: hidden;
        }

        .activity-header {
            background: #f8f9fa;
            padding: 1.5rem;
            border-bottom: 1px solid #e9ecef;
        }

        .activity-header h3 {
            margin: 0;
            color: #2c3e50;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .activity-content {
            padding: 1.5rem;
        }

        .activity-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem 0;
            border-bottom: 1px solid #f8f9fa;
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            background: #e8f4f8;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            color: #3498db;
        }

        .activity-details h4 {
            margin: 0 0 0.25rem 0;
            color: #2c3e50;
            font-size: 1rem;
        }

        .activity-details p {
            margin: 0;
            color: #7f8c8d;
            font-size: 0.9rem;
        }

        .billing-estimate {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1.5rem;
            border-radius: 10px;
            margin: 1rem 0;
            text-align: center;
        }

        .billing-estimate h4 {
            margin: 0 0 0.5rem 0;
            font-size: 1.1rem;
        }

        .billing-amount {
            font-size: 2rem;
            font-weight: bold;
            margin: 0;
        }

        @media (max-width: 768px) {
            .customer-details-container {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .customer-info-header {
                flex-direction: column;
                text-align: center;
            }

            .customer-status {
                position: static;
                margin-top: 1rem;
                align-self: center;
            }

            .action-buttons {
                flex-direction: column;
                align-items: center;
            }

            .btn-action {
                width: 100%;
                max-width: 300px;
            }

            .customer-header {
                text-align: center;
            }

            .customer-header::before {
                display: none;
            }
        }
    </style>
</head>
<body>
<!-- Check if user is logged in -->
<%
    if (session == null || session.getAttribute("adminUser") == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }

    Customer customer = (Customer) request.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect(request.getContextPath() + "/customer");
        return;
    }

    SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy 'at' HH:mm");
%>

<!-- Navigation Bar -->
<nav class="navbar">
    <div class="navbar-content">
        <a href="${pageContext.request.contextPath}/dashboard" class="navbar-brand">
            Pahana Edu Management
        </a>
        <ul class="navbar-nav">
            <li><a href="${pageContext.request.contextPath}/dashboard" class="nav-link">Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/customer" class="nav-link active">Customers</a></li>
            <li><a href="${pageContext.request.contextPath}/item" class="nav-link">Items</a></li>
            <li><a href="${pageContext.request.contextPath}/bill" class="nav-link">Billing</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/help.jsp" class="nav-link">Help</a></li>
            <li><a href="${pageContext.request.contextPath}/logout" class="nav-link logout">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <!-- Display Success Messages -->
    <% if (request.getParameter("success") != null) { %>
    <div class="alert alert-success">
        <i class="icon-success">✓</i>
        <%= request.getParameter("success") %>
    </div>
    <% } %>

    <!-- Customer Header -->
    <div class="customer-header">
        <div class="customer-info-header">
            <div class="customer-avatar">
                <%= customer.getName().substring(0, 1).toUpperCase() %>
            </div>
            <div class="customer-basic-info">
                <h1><%= customer.getName() %></h1>
                <p>Account: <%= customer.getAccountNumber() %></p>
            </div>
        </div>
        <div class="customer-status">
            <% if (customer.getUnitsConsumed() > 0) { %>
            ✅ Active Customer
            <% } else { %>
            ⏸️ Inactive Customer
            <% } %>
        </div>
    </div>

    <!-- Customer Details -->
    <div class="customer-details-container">
        <!-- Main Details -->
        <div class="main-details">
            <div class="details-header">
                <h3>📋 Customer Information</h3>
            </div>
            <div class="details-content">
                <div class="detail-group">
                    <div class="detail-label">Account Number</div>
                    <div class="detail-value highlight"><%= customer.getAccountNumber() %></div>
                </div>

                <div class="detail-group">
                    <div class="detail-label">Full Name</div>
                    <div class="detail-value"><%= customer.getName() %></div>
                </div>

                <div class="detail-group">
                    <div class="detail-label">Address</div>
                    <div class="detail-value"><%= customer.getAddress() %></div>
                </div>

                <div class="detail-group">
                    <div class="detail-label">Telephone</div>
                    <div class="detail-value">
                        <a href="tel:<%= customer.getTelephone() %>" style="color: #3498db; text-decoration: none;">
                            📞 <%= customer.getTelephone() %>
                        </a>
                    </div>
                </div>

                <div class="detail-group">
                    <div class="detail-label">Account Created</div>
                    <div class="detail-value">
                        <% if (customer.getCreatedAt() != null) { %>
                        <%= dateFormat.format(customer.getCreatedAt()) %>
                        <% } else { %>
                        Not available
                        <% } %>
                    </div>
                </div>

                <div class="detail-group">
                    <div class="detail-label">Last Updated</div>
                    <div class="detail-value">
                        <% if (customer.getUpdatedAt() != null) { %>
                        <%= dateFormat.format(customer.getUpdatedAt()) %>
                        <% } else { %>
                        Never updated
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Stats -->
        <div class="quick-stats">
            <div class="stats-header">
                <h3>📊 Quick Stats</h3>
            </div>
            <div class="stats-content">
                <div class="units-display">
                    <h2 class="units-number"><%= customer.getUnitsConsumed() %></h2>
                    <p class="units-label">Units Consumed</p>
                </div>

                <div class="stat-item">
                    <h3 class="stat-number">
                        <%= customer.getUnitsConsumed() > 0 ? "Active" : "Inactive" %>
                    </h3>
                    <p class="stat-label">Account Status</p>
                </div>

                <div class="stat-item">
                    <h3 class="stat-number">
                        <%
                            String priority = customer.getUnitsConsumed() >= 100 ? "High" :
                                    customer.getUnitsConsumed() >= 50 ? "Medium" : "Low";
                        %>
                        <%= priority %>
                    </h3>
                    <p class="stat-label">Priority Level</p>
                </div>

                <!-- Billing Estimate -->
                <div class="billing-estimate">
                    <h4>💰 Estimated Bill</h4>
                    <p class="billing-amount">
                        LKR <%= String.format("%.2f", customer.getUnitsConsumed() * 50.0 * 1.08) %>
                    </p>
                    <small>Based on current units (incl. tax)</small>
                </div>
            </div>
        </div>
    </div>

    <!-- Customer Activity -->
    <div class="customer-activity">
        <div class="activity-header">
            <h3>📈 Recent Activity</h3>
        </div>
        <div class="activity-content">
            <div class="activity-item">
                <div class="activity-icon">👤</div>
                <div class="activity-details">
                    <h4>Customer Account Created</h4>
                    <p>
                        <% if (customer.getCreatedAt() != null) { %>
                        Account was created on <%= dateFormat.format(customer.getCreatedAt()) %>
                        <% } else { %>
                        Account creation date not available
                        <% } %>
                    </p>
                </div>
            </div>

            <% if (customer.getUpdatedAt() != null &&
                    !customer.getUpdatedAt().equals(customer.getCreatedAt())) { %>
            <div class="activity-item">
                <div class="activity-icon">✏️</div>
                <div class="activity-details">
                    <h4>Account Information Updated</h4>
                    <p>Last updated on <%= dateFormat.format(customer.getUpdatedAt()) %></p>
                </div>
            </div>
            <% } %>

            <div class="activity-item">
                <div class="activity-icon">📊</div>
                <div class="activity-details">
                    <h4>Current Usage Status</h4>
                    <p>
                        <% if (customer.getUnitsConsumed() > 0) { %>
                        Customer has consumed <%= customer.getUnitsConsumed() %> units and is ready for billing
                        <% } else { %>
                        No units consumed yet - new customer account
                        <% } %>
                    </p>
                </div>
            </div>

            <div class="activity-item">
                <div class="activity-icon">🏷️</div>
                <div class="activity-details">
                    <h4>Account Classification</h4>
                    <p>
                        <% if (customer.getUnitsConsumed() >= 100) { %>
                        High-value customer - eligible for premium discounts
                        <% } else if (customer.getUnitsConsumed() >= 50) { %>
                        Medium-value customer - eligible for standard discounts
                        <% } else if (customer.getUnitsConsumed() > 0) { %>
                        Standard customer - basic billing rates apply
                        <% } else { %>
                        New customer - no consumption history yet
                        <% } %>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Action Buttons -->
    <div class="action-buttons">
        <a href="${pageContext.request.contextPath}/customer?action=edit&accountNumber=<%= customer.getAccountNumber() %>"
           class="btn-action btn-edit">
            ✏️ Edit Customer
        </a>

        <a href="${pageContext.request.contextPath}/bill?action=generate&accountNumber=<%= customer.getAccountNumber() %>"
           class="btn-action btn-bill">
            🧾 Generate Bill
        </a>

        <a href="${pageContext.request.contextPath}/customer?action=delete&accountNumber=<%= customer.getAccountNumber() %>"
           class="btn-action btn-delete"
           onclick="return confirm('Are you sure you want to delete this customer? This action cannot be undone.')">
            🗑️ Delete Customer
        </a>

        <a href="${pageContext.request.contextPath}/customer"
           class="btn-action btn-back">
            ← Back to List
        </a>
    </div>
</div>

<script>
    // Print customer details
    function printCustomerDetails() {
        window.print();
    }

    // Copy account number to clipboard
    function copyAccountNumber() {
        const accountNumber = '<%= customer.getAccountNumber() %>';
        navigator.clipboard.writeText(accountNumber).then(function() {
            alert('Account number copied to clipboard: ' + accountNumber);
        });
    }

    // Keyboard shortcuts
    document.addEventListener('keydown', function(e) {
        if (e.ctrlKey) {
            switch(e.key) {
                case 'e':
                    e.preventDefault();
                    window.location.href = '${pageContext.request.contextPath}/customer?action=edit&accountNumber=<%= customer.getAccountNumber() %>';
                    break;
                case 'b':
                    e.preventDefault();
                    window.location.href = '${pageContext.request.contextPath}/bill?action=generate&accountNumber=<%= customer.getAccountNumber() %>';
                    break;
                case 'p':
                    e.preventDefault();
                    printCustomerDetails();
                    break;
                case 'c':
                    e.preventDefault();
                    copyAccountNumber();
                    break;
            }
        }

        // ESC key to go back
        if (e.key === 'Escape') {
            window.location.href = '${pageContext.request.contextPath}/customer';
        }
    });

    // Add tooltips for keyboard shortcuts
    document.addEventListener('DOMContentLoaded', function() {
        const editBtn = document.querySelector('.btn-edit');
        const billBtn = document.querySelector('.btn-bill');

        if (editBtn) {
            editBtn.title = 'Edit Customer (Ctrl+E)';
        }
        if (billBtn) {
            billBtn.title = 'Generate Bill (Ctrl+B)';
        }
    });

    // Animate stats on page load
    document.addEventListener('DOMContentLoaded', function() {
        const unitsNumber = document.querySelector('.units-number');
        const finalValue = <%= customer.getUnitsConsumed() %>;

        if (unitsNumber && finalValue > 0) {
            let currentValue = 0;
            const increment = Math.ceil(finalValue / 20);
            const timer = setInterval(function() {
                currentValue += increment;
                if (currentValue >= finalValue) {
                    currentValue = finalValue;
                    clearInterval(timer);
                }
                unitsNumber.textContent = currentValue;
            }, 50);
        }
    });
</script>
</body>
</html>