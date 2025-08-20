<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.math.BigDecimal" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Pahana Edu Management System</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .dashboard-welcome {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            text-align: center;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        }

        .dashboard-welcome h1 {
            margin: 0 0 0.5rem 0;
            font-size: 2.5rem;
            font-weight: 700;
        }

        .dashboard-welcome p {
            margin: 0;
            font-size: 1.2rem;
            opacity: 0.9;
        }

        .quick-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: white;
            padding: 1.5rem;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            border-left: 5px solid #3498db;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .stat-card.customers { border-left-color: #e74c3c; }
        .stat-card.items { border-left-color: #f39c12; }
        .stat-card.revenue { border-left-color: #27ae60; }
        .stat-card.bills { border-left-color: #9b59b6; }

        .stat-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1rem;
        }

        .stat-icon {
            font-size: 2rem;
            opacity: 0.7;
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: #2c3e50;
            margin: 0;
        }

        .stat-label {
            color: #7f8c8d;
            font-size: 1rem;
            margin: 0;
        }

        .stat-change {
            font-size: 0.9rem;
            margin-top: 0.5rem;
        }

        .stat-change.positive {
            color: #27ae60;
        }

        .stat-change.negative {
            color: #e74c3c;
        }

        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .action-card {
            background: white;
            padding: 1.5rem;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }

        .action-card:hover {
            transform: translateY(-3px);
        }

        .action-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: #3498db;
        }

        .action-title {
            font-size: 1.3rem;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 0.5rem;
        }

        .action-description {
            color: #7f8c8d;
            margin-bottom: 1.5rem;
            line-height: 1.5;
        }

        .recent-activity {
            background: white;
            padding: 1.5rem;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .activity-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #e9ecef;
        }

        .activity-item {
            padding: 1rem 0;
            border-bottom: 1px solid #f8f9fa;
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            background: #f8f9fa;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            color: #3498db;
        }

        .activity-content {
            flex: 1;
        }

        .activity-title {
            font-weight: 600;
            color: #2c3e50;
            margin: 0 0 0.25rem 0;
        }

        .activity-time {
            color: #7f8c8d;
            font-size: 0.9rem;
            margin: 0;
        }

        .low-stock-alert {
            background: linear-gradient(135deg, #ff7675 0%, #fd79a8 100%);
            color: white;
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .alert-icon {
            font-size: 1.5rem;
        }

        .no-data {
            text-align: center;
            color: #7f8c8d;
            font-style: italic;
            padding: 2rem;
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

    String adminUsername = (String) session.getAttribute("username");
    if (adminUsername == null) adminUsername = "Admin";

    // Get dashboard data
    Integer totalCustomers = (Integer) request.getAttribute("totalCustomers");
    Integer totalItems = (Integer) request.getAttribute("totalItems");
    Integer totalStock = (Integer) request.getAttribute("totalStock");
    BigDecimal inventoryValue = (BigDecimal) request.getAttribute("inventoryValue");
    Integer lowStockCount = (Integer) request.getAttribute("lowStockCount");
    BigDecimal todaysRevenue = (BigDecimal) request.getAttribute("todaysRevenue");
    BigDecimal monthlyRevenue = (BigDecimal) request.getAttribute("monthlyRevenue");
    String billStats = (String) request.getAttribute("billStats");
    Boolean hasLowStock = (Boolean) request.getAttribute("hasLowStock");
    Boolean hasCustomers = (Boolean) request.getAttribute("hasCustomers");
    Boolean hasItems = (Boolean) request.getAttribute("hasItems");

    // Set default values if null
    if (totalCustomers == null) totalCustomers = 0;
    if (totalItems == null) totalItems = 0;
    if (totalStock == null) totalStock = 0;
    if (inventoryValue == null) inventoryValue = BigDecimal.ZERO;
    if (lowStockCount == null) lowStockCount = 0;
    if (todaysRevenue == null) todaysRevenue = BigDecimal.ZERO;
    if (monthlyRevenue == null) monthlyRevenue = BigDecimal.ZERO;
    if (billStats == null) billStats = "No billing data available";
    if (hasLowStock == null) hasLowStock = false;
    if (hasCustomers == null) hasCustomers = false;
    if (hasItems == null) hasItems = false;
%>

<!-- Navigation Bar -->
<nav class="navbar">
    <div class="navbar-content">
        <a href="${pageContext.request.contextPath}/dashboard" class="navbar-brand">
            Pahana Edu Management
        </a>
        <ul class="navbar-nav">
            <li><a href="${pageContext.request.contextPath}/dashboard" class="nav-link active">Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/customer" class="nav-link">Customers</a></li>
            <li><a href="${pageContext.request.contextPath}/item" class="nav-link">Items</a></li>
            <li><a href="${pageContext.request.contextPath}/bill" class="nav-link">Billing</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/help.jsp" class="nav-link">Help</a></li>
            <li><a href="${pageContext.request.contextPath}/logout" class="nav-link logout">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <!-- Welcome Section -->
    <div class="dashboard-welcome">
        <h1>Welcome, <%= adminUsername %>!</h1>
        <p>Pahana Edu Bookshop Management System Dashboard</p>
    </div>

    <!-- Display success/error messages -->
    <% if (request.getParameter("success") != null) { %>
    <div class="alert alert-success">
        <i class="icon-success">✓</i>
        <%= request.getParameter("success") %>
    </div>
    <% } %>

    <% if (request.getAttribute("errorMessage") != null) { %>
    <div class="alert alert-error">
        <i class="icon-error">✗</i>
        <%= request.getAttribute("errorMessage") %>
    </div>
    <% } %>

    <!-- Low Stock Alert -->
    <% if (hasLowStock && lowStockCount > 0) { %>
    <div class="low-stock-alert">
        <span class="alert-icon">⚠️</span>
        <div>
            <strong>Low Stock Alert!</strong>
            <%= lowStockCount %> item(s) are running low on stock.
            <a href="${pageContext.request.contextPath}/item?action=lowStock"
               style="color: white; text-decoration: underline; margin-left: 1rem;">View Items</a>
        </div>
    </div>
    <% } %>

    <!-- Quick Statistics -->
    <div class="quick-stats">
        <div class="stat-card customers">
            <div class="stat-header">
                <div>
                    <h2 class="stat-number"><%= totalCustomers %></h2>
                    <p class="stat-label">Total Customers</p>
                </div>
                <span class="stat-icon">👥</span>
            </div>
            <% if (hasCustomers) { %>
            <div class="stat-change positive">📈 Active customer base</div>
            <% } else { %>
            <div class="stat-change">No customers registered yet</div>
            <% } %>
        </div>

        <div class="stat-card items">
            <div class="stat-header">
                <div>
                    <h2 class="stat-number"><%= totalItems %></h2>
                    <p class="stat-label">Total Items</p>
                </div>
                <span class="stat-icon">📚</span>
            </div>
            <div class="stat-change">
                <%= totalStock %> units in stock
                <% if (lowStockCount > 0) { %>
                • <span style="color: #e74c3c;"><%= lowStockCount %> low stock</span>
                <% } %>
            </div>
        </div>

        <div class="stat-card revenue">
            <div class="stat-header">
                <div>
                    <h2 class="stat-number">LKR <%= String.format("%.2f", todaysRevenue) %></h2>
                    <p class="stat-label">Today's Revenue</p>
                </div>
                <span class="stat-icon">💰</span>
            </div>
            <div class="stat-change">
                Monthly: LKR <%= String.format("%.2f", monthlyRevenue) %>
            </div>
        </div>

        <div class="stat-card bills">
            <div class="stat-header">
                <div>
                    <h2 class="stat-number">LKR <%= String.format("%.2f", inventoryValue) %></h2>
                    <p class="stat-label">Inventory Value</p>
                </div>
                <span class="stat-icon">📊</span>
            </div>
            <div class="stat-change">Total asset value</div>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="quick-actions">
        <div class="action-card">
            <div class="action-icon">👤</div>
            <div class="action-title">Manage Customers</div>
            <div class="action-description">Add, edit, or view customer information and account details</div>
            <a href="${pageContext.request.contextPath}/customer" class="btn btn-primary">Go to Customers</a>
        </div>

        <div class="action-card">
            <div class="action-icon">📚</div>
            <div class="action-title">Manage Items</div>
            <div class="action-description">Add new books, update inventory, and manage stock levels</div>
            <a href="${pageContext.request.contextPath}/item" class="btn btn-warning">Go to Items</a>
        </div>

        <div class="action-card">
            <div class="action-icon">🧾</div>
            <div class="action-title">Generate Bills</div>
            <div class="action-description">Create customer bills, calculate charges, and print invoices</div>
            <a href="${pageContext.request.contextPath}/bill" class="btn btn-success">Go to Billing</a>
        </div>

        <div class="action-card">
            <div class="action-icon">❓</div>
            <div class="action-title">Help & Support</div>
            <div class="action-description">View system usage guidelines and get help with features</div>
            <a href="${pageContext.request.contextPath}/jsp/help.jsp" class="btn btn-info">Get Help</a>
        </div>
    </div>

    <!-- Recent Activity / System Status -->
    <div class="recent-activity">
        <div class="activity-header">
            <h3>System Status</h3>
            <small>Last updated: <%= new java.util.Date() %></small>
        </div>

        <div class="activity-item">
            <div class="activity-icon">📊</div>
            <div class="activity-content">
                <p class="activity-title">Billing Statistics</p>
                <p class="activity-time"><%= billStats %></p>
            </div>
        </div>

        <div class="activity-item">
            <div class="activity-icon">📚</div>
            <div class="activity-content">
                <p class="activity-title">Inventory Status</p>
                <p class="activity-time">
                    <%= totalItems %> items with <%= totalStock %> total units
                    <% if (lowStockCount > 0) { %>
                    • <%= lowStockCount %> items need restocking
                    <% } else { %>
                    • All items adequately stocked
                    <% } %>
                </p>
            </div>
        </div>

        <div class="activity-item">
            <div class="activity-icon">👥</div>
            <div class="activity-content">
                <p class="activity-title">Customer Base</p>
                <p class="activity-time">
                    <%= totalCustomers %> registered customers
                    <% if (hasCustomers) { %>
                    • Ready for billing operations
                    <% } else { %>
                    • Add customers to start billing
                    <% } %>
                </p>
            </div>
        </div>

        <% if (!hasCustomers && !hasItems) { %>
        <div class="activity-item">
            <div class="activity-icon">🚀</div>
            <div class="activity-content">
                <p class="activity-title">Getting Started</p>
                <p class="activity-time">
                    Welcome to Pahana Edu! Start by adding customers and items to begin using the system.
                </p>
            </div>
        </div>
        <% } %>
    </div>
</div>

<script>
    // Auto-refresh dashboard every 5 minutes
    setTimeout(function() {
        window.location.reload();
    }, 300000); // 5 minutes

    // Add loading animation for action buttons
    document.querySelectorAll('.action-card .btn').forEach(function(btn) {
        btn.addEventListener('click', function() {
            this.innerHTML = '<span class="spinner"></span> Loading...';
            this.disabled = true;
        });
    });

    // Show time since page load
    let startTime = Date.now();
    function updateTimestamp() {
        let elapsed = Math.floor((Date.now() - startTime) / 1000);
        let minutes = Math.floor(elapsed / 60);
        let seconds = elapsed % 60;

        let timeString = minutes > 0 ?
            minutes + 'm ' + seconds + 's ago' :
            seconds + 's ago';

        document.querySelector('.activity-header small').textContent =
            'Last updated: ' + timeString;
    }

    // Update timestamp every second
    setInterval(updateTimestamp, 1000);
</script>
</body>
</html>