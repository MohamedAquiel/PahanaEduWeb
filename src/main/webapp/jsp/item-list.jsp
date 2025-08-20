<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.pahanaedu.model.Item" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Item Management - Pahana Edu</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .items-header {
            background: linear-gradient(135deg, #f39c12 0%, #e67e22 100%);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .items-header h1 {
            margin: 0;
            font-size: 2.5rem;
        }

        .items-header p {
            margin: 0.5rem 0 0 0;
            opacity: 0.9;
        }

        .header-actions {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .search-container {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
        }

        .search-form {
            display: flex;
            gap: 1rem;
            align-items: end;
        }

        .search-group {
            flex: 1;
        }

        .search-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: #555;
        }

        .search-input {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid #e9ecef;
            border-radius: 5px;
            font-size: 1rem;
        }

        .search-input:focus {
            outline: none;
            border-color: #f39c12;
            box-shadow: 0 0 0 0.2rem rgba(243, 156, 18, 0.25);
        }

        .items-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .stat-box {
            background: white;
            padding: 1rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
            border-left: 4px solid #f39c12;
        }

        .stat-box.inventory { border-left-color: #3498db; }
        .stat-box.low-stock { border-left-color: #e74c3c; }
        .stat-box.total-value { border-left-color: #27ae60; }

        .stat-number {
            font-size: 2rem;
            font-weight: bold;
            color: #f39c12;
            margin: 0;
        }

        .stat-box.inventory .stat-number { color: #3498db; }
        .stat-box.low-stock .stat-number { color: #e74c3c; }
        .stat-box.total-value .stat-number { color: #27ae60; }

        .stat-label {
            color: #666;
            font-size: 0.9rem;
            margin: 0;
        }

        .table-container {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .table-header {
            background: #f8f9fa;
            padding: 1rem 1.5rem;
            border-bottom: 1px solid #e9ecef;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .table-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: #2c3e50;
            margin: 0;
        }

        .table-filters {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .filter-select {
            padding: 0.5rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 0.9rem;
        }

        .items-table {
            width: 100%;
            border-collapse: collapse;
        }

        .items-table th {
            background: #2c3e50;
            color: white;
            padding: 1rem;
            text-align: left;
            font-weight: 600;
        }

        .items-table td {
            padding: 1rem;
            border-bottom: 1px solid #e9ecef;
            vertical-align: middle;
        }

        .items-table tbody tr:hover {
            background-color: #f8f9fa;
        }

        .item-info {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .item-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #f39c12, #e67e22);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 1.2rem;
        }

        .item-details h4 {
            margin: 0;
            color: #2c3e50;
            font-size: 1rem;
        }

        .item-details p {
            margin: 0;
            color: #7f8c8d;
            font-size: 0.9rem;
        }

        .price-display {
            font-size: 1.2rem;
            font-weight: bold;
            color: #27ae60;
        }

        .stock-badge {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.85rem;
            font-weight: 600;
        }

        .stock-high { background: #d4edda; color: #155724; }
        .stock-medium { background: #fff3cd; color: #856404; }
        .stock-low { background: #f8d7da; color: #721c24; }
        .stock-out { background: #e2e3e5; color: #495057; }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
            align-items: center;
        }

        .btn-action {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 0.875rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
        }

        .btn-view { background: #17a2b8; color: white; }
        .btn-edit { background: #ffc107; color: #212529; }
        .btn-delete { background: #dc3545; color: white; }

        .btn-action:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
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

        .empty-state {
            text-align: center;
            padding: 3rem;
            color: #7f8c8d;
        }

        .empty-state-icon {
            font-size: 4rem;
            margin-bottom: 1rem;
            opacity: 0.5;
        }

        .empty-state h3 {
            margin: 0 0 1rem 0;
            color: #2c3e50;
        }

        .empty-state p {
            margin: 0 0 2rem 0;
            font-size: 1.1rem;
        }

        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 1rem;
            padding: 2rem;
            background: #f8f9fa;
        }

        .page-info {
            color: #666;
            font-size: 0.9rem;
        }

        @media (max-width: 768px) {
            .items-header {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }

            .search-form {
                flex-direction: column;
            }

            .items-table {
                font-size: 0.875rem;
            }

            .items-table th,
            .items-table td {
                padding: 0.75rem 0.5rem;
            }

            .action-buttons {
                flex-direction: column;
            }

            .item-info {
                flex-direction: column;
                text-align: center;
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

    @SuppressWarnings("unchecked")
    List<Item> items = (List<Item>) request.getAttribute("items");
    if (items == null) {
        items = new ArrayList<>();
    }

    @SuppressWarnings("unchecked")
    List<Item> lowStockItems = (List<Item>) request.getAttribute("lowStockItems");
    if (lowStockItems == null) {
        lowStockItems = new ArrayList<>();
    }

    Boolean isLowStockView = (Boolean) request.getAttribute("isLowStockView");
    if (isLowStockView == null) isLowStockView = false;
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
    <!-- Page Header -->
    <div class="items-header">
        <div>
            <h1>📚 <%= isLowStockView ? "Low Stock Items" : "Item Management" %></h1>
            <p><%= isLowStockView ? "Items requiring immediate attention" : "Manage bookshop inventory and pricing" %></p>
        </div>
        <div class="header-actions">
            <% if (!isLowStockView) { %>
            <a href="${pageContext.request.contextPath}/item?action=add" class="btn btn-success btn-lg">
                ➕ Add New Item
            </a>
            <% } %>
            <% if (lowStockItems.size() > 0 && !isLowStockView) { %>
            <a href="${pageContext.request.contextPath}/item?action=lowStock" class="btn btn-warning btn-lg">
                ⚠️ Low Stock (<%= lowStockItems.size() %>)
            </a>
            <% } %>
        </div>
    </div>

    <!-- Display Messages -->
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
    <% if (lowStockItems.size() > 0 && !isLowStockView) { %>
    <div class="low-stock-alert">
        <span class="alert-icon">⚠️</span>
        <div>
            <strong>Low Stock Alert!</strong>
            <%= lowStockItems.size() %> item(s) are running low on stock and need restocking.
            <a href="${pageContext.request.contextPath}/item?action=lowStock"
               style="color: white; text-decoration: underline; margin-left: 1rem;">View Low Stock Items</a>
        </div>
    </div>
    <% } %>

    <!-- Search Container -->
    <% if (!isLowStockView) { %>
    <div class="search-container">
        <form class="search-form" method="get" action="${pageContext.request.contextPath}/item">
            <input type="hidden" name="action" value="list">
            <div class="search-group">
                <label for="searchName">Search by Name</label>
                <input type="text" id="searchName" name="searchName" class="search-input"
                       placeholder="Enter item name..."
                       value="<%= request.getParameter("searchName") != null ? request.getParameter("searchName") : "" %>">
            </div>
            <div class="search-group">
                <label for="searchId">Search by ID</label>
                <input type="text" id="searchId" name="searchId" class="search-input"
                       placeholder="Enter item ID..."
                       value="<%= request.getParameter("searchId") != null ? request.getParameter("searchId") : "" %>">
            </div>
            <div>
                <button type="submit" class="btn btn-primary">🔍 Search</button>
                <a href="${pageContext.request.contextPath}/item?action=list" class="btn btn-secondary">Clear</a>
            </div>
        </form>
    </div>
    <% } %>

    <!-- Item Statistics -->
    <div class="items-stats">
        <div class="stat-box">
            <h2 class="stat-number"><%= items.size() %></h2>
            <p class="stat-label"><%= isLowStockView ? "Low Stock Items" : "Total Items" %></p>
        </div>
        <div class="stat-box inventory">
            <h2 class="stat-number">
                <%
                    int totalStock = 0;
                    for (Item item : items) {
                        totalStock += item.getStock();
                    }
                %>
                <%= totalStock %>
            </h2>
            <p class="stat-label">Total Stock Units</p>
        </div>
        <div class="stat-box low-stock">
            <h2 class="stat-number"><%= lowStockItems.size() %></h2>
            <p class="stat-label">Low Stock Items</p>
        </div>
        <div class="stat-box total-value">
            <h2 class="stat-number">
                <%
                    double totalValue = 0;
                    for (Item item : items) {
                        totalValue += item.getPrice().doubleValue() * item.getStock();
                    }
                %>
                <%= String.format("%.0f", totalValue) %>
            </h2>
            <p class="stat-label">Total Value (LKR)</p>
        </div>
    </div>

    <!-- Items Table -->
    <div class="table-container">
        <div class="table-header">
            <h3 class="table-title">
                <%= isLowStockView ? "Low Stock Items" : "Item Inventory" %>
            </h3>
            <div class="table-filters">
                <% if (!isLowStockView) { %>
                <select class="filter-select" onchange="filterTable(this.value)">
                    <option value="all">All Items</option>
                    <option value="in-stock">In Stock (> 0)</option>
                    <option value="low-stock">Low Stock (< 10)</option>
                    <option value="out-of-stock">Out of Stock (0)</option>
                    <option value="high-value">High Value (> LKR 1000)</option>
                </select>
                <% } %>
                <button onclick="exportToCSV()" class="btn btn-info btn-sm">📊 Export CSV</button>
            </div>
        </div>

        <% if (items.size() > 0) { %>
        <table class="items-table" id="itemsTable">
            <thead>
            <tr>
                <th>Item</th>
                <th>Item ID</th>
                <th>Price (LKR)</th>
                <th>Stock</th>
                <th>Value (LKR)</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (Item item : items) { %>
            <tr data-stock="<%= item.getStock() %>" data-price="<%= item.getPrice().doubleValue() %>">
                <td>
                    <div class="item-info">
                        <div class="item-icon">
                            📖
                        </div>
                        <div class="item-details">
                            <h4><%= item.getItemName() %></h4>
                            <p>Book/Educational Material</p>
                        </div>
                    </div>
                </td>
                <td>
                    <strong><%= item.getItemId() %></strong>
                </td>
                <td>
                    <div class="price-display">
                        <%= String.format("%.2f", item.getPrice()) %>
                    </div>
                </td>
                <td>
                                    <span class="stock-badge <%=
                                        item.getStock() == 0 ? "stock-out" :
                                        item.getStock() < 10 ? "stock-low" :
                                        item.getStock() < 50 ? "stock-medium" : "stock-high" %>">
                                        <%= item.getStock() %> units
                                    </span>
                </td>
                <td>
                    <strong><%= String.format("%.2f", item.getPrice().doubleValue() * item.getStock()) %></strong>
                </td>
                <td>
                    <% if (item.getStock() == 0) { %>
                    <span class="badge badge-danger">Out of Stock</span>
                    <% } else if (item.getStock() < 10) { %>
                    <span class="badge badge-warning">Low Stock</span>
                    <% } else { %>
                    <span class="badge badge-success">In Stock</span>
                    <% } %>
                </td>
                <td>
                    <div class="action-buttons">
                        <a href="${pageContext.request.contextPath}/item?action=view&itemId=<%= item.getItemId() %>"
                           class="btn-action btn-view" title="View Details">
                            👁️ View
                        </a>
                        <a href="${pageContext.request.contextPath}/item?action=edit&itemId=<%= item.getItemId() %>"
                           class="btn-action btn-edit" title="Edit Item">
                            ✏️ Edit
                        </a>
                        <a href="${pageContext.request.contextPath}/item?action=delete&itemId=<%= item.getItemId() %>"
                           class="btn-action btn-delete" title="Delete Item"
                           onclick="return confirm('Are you sure you want to delete this item?')">
                            🗑️ Delete
                        </a>
                    </div>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>

        <div class="pagination">
            <div class="page-info">
                Showing <%= items.size() %> item(s)
                <% if (isLowStockView) { %>
                • <a href="${pageContext.request.contextPath}/item?action=list">View All Items</a>
                <% } %>
            </div>
        </div>
        <% } else { %>
        <div class="empty-state">
            <div class="empty-state-icon">📚</div>
            <h3><%= isLowStockView ? "No Low Stock Items" : "No Items Found" %></h3>
            <p>
                <% if (isLowStockView) { %>
                Great! All items are well stocked.
                <% } else { %>
                You haven't added any items yet. Start building your inventory!
                <% } %>
            </p>
            <% if (!isLowStockView) { %>
            <a href="${pageContext.request.contextPath}/item?action=add" class="btn btn-primary btn-lg">
                ➕ Add Your First Item
            </a>
            <% } else { %>
            <a href="${pageContext.request.contextPath}/item?action=list" class="btn btn-primary btn-lg">
                📋 View All Items
            </a>
            <% } %>
        </div>
        <% } %>
    </div>
</div>

<script>
    // Filter table functionality
    function filterTable(filter) {
        const table = document.getElementById('itemsTable');
        const rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

        for (let row of rows) {
            const stock = parseInt(row.getAttribute('data-stock'));
            const price = parseFloat(row.getAttribute('data-price'));
            let show = true;

            switch(filter) {
                case 'in-stock':
                    show = stock > 0;
                    break;
                case 'low-stock':
                    show = stock < 10 && stock > 0;
                    break;
                case 'out-of-stock':
                    show = stock === 0;
                    break;
                case 'high-value':
                    show = price > 1000;
                    break;
                case 'all':
                default:
                    show = true;
                    break;
            }

            row.style.display = show ? '' : 'none';
        }
    }

    // Export to CSV functionality
    function exportToCSV() {
        const table = document.getElementById('itemsTable');
        const rows = table.getElementsByTagName('tr');
        let csv = [];

        for (let i = 0; i < rows.length; i++) {
            const row = rows[i];
            const cols = row.getElementsByTagName(i === 0 ? 'th' : 'td');
            let csvRow = [];

            for (let j = 0; j < cols.length - 1; j++) { // Exclude actions column
                let cellText = cols[j].innerText.replace(/,/g, '');
                csvRow.push('"' + cellText + '"');
            }
            csv.push(csvRow.join(','));
        }

        // Download CSV
        const csvContent = csv.join('\n');
        const blob = new Blob([csvContent], { type: 'text/csv' });
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = 'items_' + new Date().toISOString().split('T')[0] + '.csv';
        a.click();
        window.URL.revokeObjectURL(url);
    }

    console.log('✅ Item list page initialized');
</script>
</body>
</html>