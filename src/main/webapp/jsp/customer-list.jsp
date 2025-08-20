<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.pahanaedu.model.Customer" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Management - Pahana Edu</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .customers-header {
            background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .customers-header h1 {
            margin: 0;
            font-size: 2.5rem;
        }

        .customers-header p {
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
            border-color: #e74c3c;
            box-shadow: 0 0 0 0.2rem rgba(231, 76, 60, 0.25);
        }

        .customers-stats {
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
            border-left: 4px solid #e74c3c;
        }

        .stat-number {
            font-size: 2rem;
            font-weight: bold;
            color: #e74c3c;
            margin: 0;
        }

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

        .customers-table {
            width: 100%;
            border-collapse: collapse;
        }

        .customers-table th {
            background: #2c3e50;
            color: white;
            padding: 1rem;
            text-align: left;
            font-weight: 600;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .customers-table td {
            padding: 1rem;
            border-bottom: 1px solid #e9ecef;
            vertical-align: middle;
        }

        .customers-table tbody tr:hover {
            background-color: #f8f9fa;
        }

        .customer-info {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .customer-avatar {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 1.1rem;
        }

        .customer-details h4 {
            margin: 0;
            color: #2c3e50;
            font-size: 1rem;
        }

        .customer-details p {
            margin: 0;
            color: #7f8c8d;
            font-size: 0.9rem;
        }

        .units-badge {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.85rem;
            font-weight: 600;
        }

        .units-low { background: #fee; color: #c53030; }
        .units-medium { background: #fff3cd; color: #856404; }
        .units-high { background: #d4edda; color: #155724; }

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
        .btn-bill { background: #28a745; color: white; }

        .btn-action:hover {
            transform: translateY(-1px);
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
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
            .customers-header {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }

            .search-form {
                flex-direction: column;
            }

            .customers-table {
                font-size: 0.875rem;
            }

            .customers-table th,
            .customers-table td {
                padding: 0.75rem 0.5rem;
            }

            .action-buttons {
                flex-direction: column;
            }

            .customer-info {
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
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
    if (customers == null) {
        customers = new ArrayList<>();
    }
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
    <!-- Page Header -->
    <div class="customers-header">
        <div>
            <h1>👥 Customer Management</h1>
            <p>Manage customer accounts and information</p>
        </div>
        <div class="header-actions">
            <a href="${pageContext.request.contextPath}/customer?action=add" class="btn btn-success btn-lg">
                ➕ Add New Customer
            </a>
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

    <!-- Search Container -->
    <div class="search-container">
        <form class="search-form" method="get" action="${pageContext.request.contextPath}/customer">
            <input type="hidden" name="action" value="list">
            <div class="search-group">
                <label for="searchName">Search by Name</label>
                <input type="text" id="searchName" name="searchName" class="search-input"
                       placeholder="Enter customer name..."
                       value="<%= request.getParameter("searchName") != null ? request.getParameter("searchName") : "" %>">
            </div>
            <div class="search-group">
                <label for="searchAccount">Search by Account</label>
                <input type="text" id="searchAccount" name="searchAccount" class="search-input"
                       placeholder="Enter account number..."
                       value="<%= request.getParameter("searchAccount") != null ? request.getParameter("searchAccount") : "" %>">
            </div>
            <div>
                <button type="submit" class="btn btn-primary">🔍 Search</button>
                <a href="${pageContext.request.contextPath}/customer?action=list" class="btn btn-secondary">Clear</a>
            </div>
        </form>
    </div>

    <!-- Customer Statistics -->
    <div class="customers-stats">
        <div class="stat-box">
            <h2 class="stat-number"><%= customers.size() %></h2>
            <p class="stat-label">Total Customers</p>
        </div>
        <div class="stat-box">
            <h2 class="stat-number">
                <%
                    int activeCustomers = 0;
                    for (Customer customer : customers) {
                        if (customer.getUnitsConsumed() > 0) {
                            activeCustomers++;
                        }
                    }
                %>
                <%= activeCustomers %>
            </h2>
            <p class="stat-label">Active Customers</p>
        </div>
        <div class="stat-box">
            <h2 class="stat-number">
                <%
                    int totalUnits = 0;
                    for (Customer customer : customers) {
                        totalUnits += customer.getUnitsConsumed();
                    }
                %>
                <%= totalUnits %>
            </h2>
            <p class="stat-label">Total Units</p>
        </div>
        <div class="stat-box">
            <h2 class="stat-number">
                <%= customers.size() > 0 ? String.format("%.1f", (double)totalUnits / customers.size()) : "0.0" %>
            </h2>
            <p class="stat-label">Avg Units/Customer</p>
        </div>
    </div>

    <!-- Customers Table -->
    <div class="table-container">
        <div class="table-header">
            <h3 class="table-title">Customer List</h3>
            <div class="table-filters">
                <select class="filter-select" onchange="filterTable(this.value)">
                    <option value="all">All Customers</option>
                    <option value="active">Active (Units > 0)</option>
                    <option value="inactive">Inactive (Units = 0)</option>
                    <option value="high">High Usage (Units > 50)</option>
                </select>
                <button onclick="exportToCSV()" class="btn btn-info btn-sm">📊 Export CSV</button>
            </div>
        </div>

        <% if (customers.size() > 0) { %>
        <table class="customers-table" id="customersTable">
            <thead>
            <tr>
                <th>Customer</th>
                <th>Account Number</th>
                <th>Contact</th>
                <th>Units Consumed</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (Customer customer : customers) { %>
            <tr data-units="<%= customer.getUnitsConsumed() %>">
                <td>
                    <div class="customer-info">
                        <div class="customer-avatar">
                            <%= customer.getName().substring(0, 1).toUpperCase() %>
                        </div>
                        <div class="customer-details">
                            <h4><%= customer.getName() %></h4>
                            <p><%= customer.getAddress().length() > 30 ?
                                    customer.getAddress().substring(0, 30) + "..." :
                                    customer.getAddress() %></p>
                        </div>
                    </div>
                </td>
                <td>
                    <strong><%= customer.getAccountNumber() %></strong>
                </td>
                <td>
                    <div>
                        <strong>📞 <%= customer.getTelephone() %></strong>
                    </div>
                </td>
                <td>
                                    <span class="units-badge <%=
                                        customer.getUnitsConsumed() == 0 ? "units-low" :
                                        customer.getUnitsConsumed() <= 25 ? "units-medium" : "units-high" %>">
                                        <%= customer.getUnitsConsumed() %> units
                                    </span>
                </td>
                <td>
                    <% if (customer.getUnitsConsumed() > 0) { %>
                    <span class="badge badge-success">Active</span>
                    <% } else { %>
                    <span class="badge badge-warning">Inactive</span>
                    <% } %>
                </td>
                <td>
                    <div class="action-buttons">
                        <a href="${pageContext.request.contextPath}/customer?action=view&accountNumber=<%= customer.getAccountNumber() %>"
                           class="btn-action btn-view" title="View Details">
                            👁️ View
                        </a>
                        <a href="${pageContext.request.contextPath}/customer?action=edit&accountNumber=<%= customer.getAccountNumber() %>"
                           class="btn-action btn-edit" title="Edit Customer">
                            ✏️ Edit
                        </a>
                        <a href="${pageContext.request.contextPath}/bill?action=generate&accountNumber=<%= customer.getAccountNumber() %>"
                           class="btn-action btn-bill" title="Generate Bill">
                            🧾 Bill
                        </a>
                        <a href="${pageContext.request.contextPath}/customer?action=delete&accountNumber=<%= customer.getAccountNumber() %>"
                           class="btn-action btn-delete" title="Delete Customer"
                           onclick="return confirm('Are you sure you want to delete this customer?')">
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
                Showing <%= customers.size() %> customer(s)
            </div>
        </div>
        <% } else { %>
        <div class="empty-state">
            <div class="empty-state-icon">👥</div>
            <h3>No Customers Found</h3>
            <p>You haven't added any customers yet. Start by adding your first customer!</p>
            <a href="${pageContext.request.contextPath}/customer?action=add" class="btn btn-primary btn-lg">
                ➕ Add Your First Customer
            </a>
        </div>
        <% } %>
    </div>
</div>

<script>
    // Filter table functionality
    function filterTable(filter) {
        const table = document.getElementById('customersTable');
        const rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

        for (let row of rows) {
            const units = parseInt(row.getAttribute('data-units'));
            let show = true;

            switch(filter) {
                case 'active':
                    show = units > 0;
                    break;
                case 'inactive':
                    show = units === 0;
                    break;
                case 'high':
                    show = units > 50;
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
        const table = document.getElementById('customersTable');
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
        a.download = 'customers_' + new Date().toISOString().split('T')[0] + '.csv';
        a.click();
        window.URL.revokeObjectURL(url);
    }

    // Search functionality
    document.getElementById('searchName').addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase();
        filterByName(searchTerm);
    });

    function filterByName(searchTerm) {
        const table = document.getElementById('customersTable');
        if (!table) return;

        const rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');

        for (let row of rows) {
            const nameCell = row.getElementsByTagName('td')[0];
            const name = nameCell.innerText.toLowerCase();

            if (name.includes(searchTerm)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        }
    }

    // Auto-refresh functionality
    let refreshInterval;
    function startAutoRefresh() {
        refreshInterval = setInterval(function() {
            window.location.reload();
        }, 60000); // Refresh every minute
    }

    function stopAutoRefresh() {
        if (refreshInterval) {
            clearInterval(refreshInterval);
        }
    }

    // Start auto-refresh when page loads
    document.addEventListener('DOMContentLoaded', function() {
        startAutoRefresh();
    });

    // Stop auto-refresh when user is interacting
    document.addEventListener('click', stopAutoRefresh);
    document.addEventListener('keypress', stopAutoRefresh);
</script>
</body>
</html>