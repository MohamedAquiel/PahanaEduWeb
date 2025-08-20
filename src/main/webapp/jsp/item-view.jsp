<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pahanaedu.model.Item" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Item - Pahana Edu</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .item-header {
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            position: relative;
            overflow: hidden;
        }

        .item-header::before {
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

        .item-info-header {
            display: flex;
            align-items: center;
            gap: 1.5rem;
            margin-bottom: 1rem;
        }

        .item-icon-large {
            width: 80px;
            height: 80px;
            background: rgba(255,255,255,0.2);
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            border: 3px solid rgba(255,255,255,0.3);
        }

        .item-basic-info h1 {
            margin: 0 0 0.5rem 0;
            font-size: 2.2rem;
        }

        .item-basic-info p {
            margin: 0;
            opacity: 0.9;
            font-size: 1.1rem;
        }

        .item-status {
            position: absolute;
            top: 2rem;
            right: 2rem;
            background: rgba(255,255,255,0.2);
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: 600;
            backdrop-filter: blur(10px);
        }

        .item-details-container {
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

        .detail-value.price {
            color: #27ae60;
            font-size: 1.3rem;
            font-weight: bold;
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

        .stat-item.price-stat {
            border-left-color: #27ae60;
            background: linear-gradient(135deg, #f0fff4 0%, #d4edda 100%);
        }

        .stat-item.stock-stat {
            border-left-color: #f39c12;
            background: linear-gradient(135deg, #fff8dc 0%, #ffeaa7 100%);
        }

        .stat-item.value-stat {
            border-left-color: #9b59b6;
            background: linear-gradient(135deg, #f8f0ff 0%, #e8d5ff 100%);
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

        .stock-display {
            background: linear-gradient(135deg, #fff3cd 0%, #ffeaa7 100%);
            border: 2px solid #f39c12;
            border-radius: 10px;
            padding: 1rem;
            text-align: center;
            margin: 1rem 0;
        }

        .stock-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: #f39c12;
            margin: 0;
        }

        .stock-label {
            color: #856404;
            font-weight: 600;
            margin: 0;
        }

        .stock-status {
            margin-top: 0.5rem;
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.85rem;
            font-weight: 600;
            display: inline-block;
        }

        .stock-high { background: #d4edda; color: #155724; }
        .stock-medium { background: #fff3cd; color: #856404; }
        .stock-low { background: #f8d7da; color: #721c24; }
        .stock-out { background: #e2e3e5; color: #495057; }

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

        .item-activity {
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

        .description-box {
            background: #f8f9fa;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 1rem;
            margin-top: 1rem;
        }

        .description-box h5 {
            margin: 0 0 0.5rem 0;
            color: #2c3e50;
        }

        .description-text {
            color: #6c757d;
            line-height: 1.6;
            margin: 0;
        }

        @media (max-width: 768px) {
            .item-details-container {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .item-info-header {
                flex-direction: column;
                text-align: center;
            }

            .item-status {
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

            .item-header {
                text-align: center;
            }

            .item-header::before {
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

    Item item = (Item) request.getAttribute("item");
    if (item == null) {
        response.sendRedirect(request.getContextPath() + "/item");
        return;
    }

    SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy 'at' HH:mm");

    // Calculate stock status
    String stockStatus = "";
    String stockClass = "";
    if (item.getStock() == 0) {
        stockStatus = "Out of Stock";
        stockClass = "stock-out";
    } else if (item.getStock() < 10) {
        stockStatus = "Low Stock";
        stockClass = "stock-low";
    } else if (item.getStock() < 50) {
        stockStatus = "Medium Stock";
        stockClass = "stock-medium";
    } else {
        stockStatus = "Well Stocked";
        stockClass = "stock-high";
    }

    // Calculate total value
    double totalValue = item.getPrice().doubleValue() * item.getStock();
%>

<!-- Navigation Bar -->
<nav class="navbar">
    <div class="navbar-content">
        <a href="${pageContext.request.contextPath}/dashboard" class="navbar-brand">
            Pahana Edu Management
        </a>
        <ul class="navbar-nav">
            <li><a href="${pageContext.request.contextPath}/dashboard" class="nav-link">Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/customer" class="nav-link">Customers</a></li>
            <li><a href="${pageContext.request.contextPath}/item" class="nav-link active">Items</a></li>
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

    <!-- Item Header -->
    <div class="item-header">
        <div class="item-info-header">
            <div class="item-icon-large">
                📚
            </div>
            <div class="item-basic-info">
                <h1><%= item.getItemName() %></h1>
                <p>Item ID: <%= item.getItemId() %></p>
            </div>
        </div>
        <div class="item-status">
            <%= stockStatus %>
        </div>
    </div>

    <!-- Item Details -->
    <div class="item-details-container">
        <!-- Main Details -->
        <div class="main-details">
            <div class="details-header">
                <h3>📋 Item Information</h3>
            </div>
            <div class="details-content">
                <div class="detail-group">
                    <div class="detail-label">Item ID</div>
                    <div class="detail-value highlight"><%= item.getItemId() %></div>
                </div>

                <div class="detail-group">
                    <div class="detail-label">Item Name</div>
                    <div class="detail-value"><%= item.getItemName() %></div>
                </div>

                <div class="detail-group">
                    <div class="detail-label">Unit Price</div>
                    <div class="detail-value price">LKR <%= String.format("%.2f", item.getPrice()) %></div>
                </div>

                <div class="detail-group">
                    <div class="detail-label">Current Stock</div>
                    <div class="detail-value">
                        <%= item.getStock() %> units
                        <span class="stock-status <%= stockClass %>"><%= stockStatus %></span>
                    </div>
                </div>

                <div class="detail-group">
                    <div class="detail-label">Total Inventory Value</div>
                    <div class="detail-value price">LKR <%= String.format("%.2f", totalValue) %></div>
                </div>

                <div class="detail-group">
                    <div class="detail-label">Date Added</div>
                    <div class="detail-value">
                        <% if (item.getCreatedAt() != null) { %>
                        <%= dateFormat.format(item.getCreatedAt()) %>
                        <% } else { %>
                        Not available
                        <% } %>
                    </div>
                </div>

                <div class="detail-group">
                    <div class="detail-label">Last Updated</div>
                    <div class="detail-value">
                        <% if (item.getUpdatedAt() != null) { %>
                        <%= dateFormat.format(item.getUpdatedAt()) %>
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
                <div class="stock-display">
                    <h2 class="stock-number"><%= item.getStock() %></h2>
                    <p class="stock-label">Units in Stock</p>
                    <span class="stock-status <%= stockClass %>"><%= stockStatus %></span>
                </div>

                <div class="stat-item price-stat">
                    <h3 class="stat-number">LKR <%= String.format("%.2f", item.getPrice()) %></h3>
                    <p class="stat-label">Unit Price</p>
                </div>

                <div class="stat-item value-stat">
                    <h3 class="stat-number">LKR <%= String.format("%.2f", totalValue) %></h3>
                    <p class="stat-label">Total Value</p>
                </div>

                <div class="stat-item stock-stat">
                    <h3 class="stat-number">
                        <%
                            String availability = item.getStock() == 0 ? "Unavailable" :
                                    item.getStock() < 10 ? "Limited" : "Available";
                        %>
                        <%= availability %>
                    </h3>
                    <p class="stat-label">Availability</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Description Section -->
    <% if (item.getDescription() != null && !item.getDescription().trim().isEmpty()) { %>
    <div class="description-box">
        <h5>📝 Description</h5>
        <p class="description-text"><%= item.getDescription() %></p>
    </div>
    <% } %>

    <!-- Item Activity -->
    <div class="item-activity">
        <div class="activity-header">
            <h3>📈 Item Activity & Status</h3>
        </div>
        <div class="activity-content">
            <div class="activity-item">
                <div class="activity-icon">📦</div>
                <div class="activity-details">
                    <h4>Item Added to Inventory</h4>
                    <p>
                        <% if (item.getCreatedAt() != null) { %>
                        Item was added to inventory on <%= dateFormat.format(item.getCreatedAt()) %>
                        <% } else { %>
                        Item creation date not available
                        <% } %>
                    </p>
                </div>
            </div>

            <% if (item.getUpdatedAt() != null &&
                    !item.getUpdatedAt().equals(item.getCreatedAt())) { %>
            <div class="activity-item">
                <div class="activity-icon">✏️</div>
                <div class="activity-details">
                    <h4>Item Information Updated</h4>
                    <p>Last updated on <%= dateFormat.format(item.getUpdatedAt()) %></p>
                </div>
            </div>
            <% } %>

            <div class="activity-item">
                <div class="activity-icon">📊</div>
                <div class="activity-details">
                    <h4>Current Stock Status</h4>
                    <p>
                        <% if (item.getStock() == 0) { %>
                        ⚠️ Item is out of stock and needs immediate restocking
                        <% } else if (item.getStock() < 10) { %>
                        ⚠️ Low stock alert - only <%= item.getStock() %> units remaining
                        <% } else if (item.getStock() < 50) { %>
                        ✅ Moderate stock levels - <%= item.getStock() %> units available
                        <% } else { %>
                        ✅ Well stocked - <%= item.getStock() %> units available
                        <% } %>
                    </p>
                </div>
            </div>

            <div class="activity-item">
                <div class="activity-icon">💰</div>
                <div class="activity-details">
                    <h4>Pricing Information</h4>
                    <p>
                        Unit price: LKR <%= String.format("%.2f", item.getPrice()) %> •
                        Total inventory value: LKR <%= String.format("%.2f", totalValue) %>
                    </p>
                </div>
            </div>

            <div class="activity-item">
                <div class="activity-icon">🏷️</div>
                <div class="activity-details">
                    <h4>Item Classification</h4>
                    <p>
                        <% if (item.getPrice().doubleValue() > 1000) { %>
                        High-value item - premium pricing category
                        <% } else if (item.getPrice().doubleValue() > 500) { %>
                        Medium-value item - standard pricing category
                        <% } else { %>
                        Budget-friendly item - affordable pricing category
                        <% } %>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Action Buttons -->
    <div class="action-buttons">
        <a href="${pageContext.request.contextPath}/item?action=edit&itemId=<%= item.getItemId() %>"
           class="btn-action btn-edit">
            ✏️ Edit Item
        </a>

        <a href="${pageContext.request.contextPath}/item?action=delete&itemId=<%= item.getItemId() %>"
           class="btn-action btn-delete"
           onclick="return confirm('Are you sure you want to delete this item? This action cannot be undone.')">
            🗑️ Delete Item
        </a>

        <a href="${pageContext.request.contextPath}/item"
           class="btn-action btn-back">
            ← Back to Items
        </a>
    </div>
</div>

<script>
    // Print item details
    function printItemDetails() {
        window.print();
    }

    // Copy item ID to clipboard
    function copyItemId() {
        const itemId = '<%= item.getItemId() %>';
        navigator.clipboard.writeText(itemId).then(function() {
            alert('Item ID copied to clipboard: ' + itemId);
        });
    }

    // Keyboard shortcuts
    document.addEventListener('keydown', function(e) {
        if (e.ctrlKey) {
            switch(e.key) {
                case 'e':
                    e.preventDefault();
                    window.location.href = '${pageContext.request.contextPath}/item?action=edit&itemId=<%= item.getItemId() %>';
                    break;
                case 'p':
                    e.preventDefault();
                    printItemDetails();
                    break;
                case 'c':
                    e.preventDefault();
                    copyItemId();
                    break;
            }
        }

        // ESC key to go back
        if (e.key === 'Escape') {
            window.location.href = '${pageContext.request.contextPath}/item';
        }
    });

    // Add tooltips for keyboard shortcuts
    document.addEventListener('DOMContentLoaded', function() {
        const editBtn = document.querySelector('.btn-edit');

        if (editBtn) {
            editBtn.title = 'Edit Item (Ctrl+E)';
        }
    });

    // Animate stats on page load
    document.addEventListener('DOMContentLoaded', function() {
        const stockNumber = document.querySelector('.stock-number');
        const finalValue = <%= item.getStock() %>;

        if (stockNumber && finalValue > 0) {
            let currentValue = 0;
            const increment = Math.ceil(finalValue / 20);
            const timer = setInterval(function() {
                currentValue += increment;
                if (currentValue >= finalValue) {
                    currentValue = finalValue;
                    clearInterval(timer);
                }
                stockNumber.textContent = currentValue;
            }, 50);
        }
    });

    // Stock level indicator animation
    function updateStockIndicator() {
        const stockStatus = document.querySelector('.stock-status');
        const stockValue = <%= item.getStock() %>;

        if (stockValue === 0) {
            stockStatus.style.animation = 'pulse 1s infinite';
        } else if (stockValue < 10) {
            stockStatus.style.animation = 'blink 2s infinite';
        }
    }

    // Add CSS animations
    const style = document.createElement('style');
    style.textContent = `
            @keyframes pulse {
                0% { transform: scale(1); }
                50% { transform: scale(1.05); }
                100% { transform: scale(1); }
            }
            @keyframes blink {
                0%, 50% { opacity: 1; }
                51%, 100% { opacity: 0.7; }
            }
        `;
    document.head.appendChild(style);

    updateStockIndicator();

    console.log('✅ Item view page initialized');
</script>
</body>
</html>