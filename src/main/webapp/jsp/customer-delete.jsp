<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pahanaedu.model.Customer" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Customer - Pahana Edu</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .delete-warning-header {
            background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .delete-warning-header::before {
            content: '⚠️';
            position: absolute;
            top: -20px;
            right: -20px;
            font-size: 8rem;
            opacity: 0.1;
            transform: rotate(15deg);
        }

        .warning-icon {
            font-size: 4rem;
            margin-bottom: 1rem;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        .delete-warning-header h1 {
            margin: 0 0 0.5rem 0;
            font-size: 2.5rem;
        }

        .delete-warning-header p {
            margin: 0;
            font-size: 1.2rem;
            opacity: 0.9;
        }

        .delete-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            overflow: hidden;
            max-width: 800px;
            margin: 0 auto;
        }

        .danger-alert {
            background: linear-gradient(135deg, #fff5f5 0%, #fed7d7 100%);
            border-left: 5px solid #e74c3c;
            padding: 1.5rem;
            margin-bottom: 0;
        }

        .danger-alert h3 {
            color: #c53030;
            margin: 0 0 1rem 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .danger-alert ul {
            color: #742a2a;
            margin: 0;
            padding-left: 1.5rem;
        }

        .danger-alert li {
            margin-bottom: 0.5rem;
            line-height: 1.4;
        }

        .customer-summary {
            padding: 2rem;
            border-bottom: 2px solid #f8f9fa;
        }

        .summary-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .summary-header h2 {
            color: #2c3e50;
            margin: 0 0 0.5rem 0;
        }

        .summary-header p {
            color: #7f8c8d;
            margin: 0;
        }

        .customer-card {
            background: #f8f9fa;
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 2rem;
            position: relative;
        }

        .customer-header-info {
            display: flex;
            align-items: center;
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .customer-avatar-delete {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            font-weight: bold;
            color: white;
            border: 3px solid rgba(231, 76, 60, 0.3);
        }

        .customer-main-info h3 {
            margin: 0 0 0.5rem 0;
            color: #2c3e50;
            font-size: 1.8rem;
        }

        .customer-main-info p {
            margin: 0;
            color: #7f8c8d;
            font-size: 1.1rem;
        }

        .deletion-badge {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: #e74c3c;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 600;
        }

        .customer-details-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
        }

        .detail-box {
            background: white;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 1rem;
        }

        .detail-label {
            font-size: 0.875rem;
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

        .units-highlight {
            background: linear-gradient(135deg, #fff3cd 0%, #ffeaa7 100%);
            border: 2px solid #ffc107;
            text-align: center;
            padding: 1.5rem;
        }

        .units-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: #f39c12;
            margin: 0;
        }

        .units-label {
            color: #856404;
            font-weight: 600;
            margin: 0;
        }

        .impact-analysis {
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            border-radius: 8px;
            padding: 1.5rem;
            margin: 2rem 0;
        }

        .impact-analysis h4 {
            color: #856404;
            margin: 0 0 1rem 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .impact-list {
            margin: 0;
            color: #856404;
        }

        .impact-list li {
            margin-bottom: 0.5rem;
            line-height: 1.4;
        }

        .confirmation-section {
            background: #f8f9fa;
            padding: 2rem;
            text-align: center;
        }

        .confirmation-checkbox {
            background: white;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            display: inline-block;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .confirmation-checkbox:hover {
            border-color: #e74c3c;
            background: #fff5f5;
        }

        .confirmation-checkbox input[type="checkbox"] {
            margin-right: 0.75rem;
            transform: scale(1.2);
        }

        .confirmation-text {
            color: #2c3e50;
            font-weight: 600;
            user-select: none;
        }

        .delete-actions {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn-delete-confirm {
            background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
            color: white;
            padding: 1rem 2rem;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            min-width: 180px;
            opacity: 0.5;
            cursor: not-allowed;
        }

        .btn-delete-confirm.enabled {
            opacity: 1;
            cursor: pointer;
        }

        .btn-delete-confirm.enabled:hover {
            background: linear-gradient(135deg, #c0392b 0%, #a93226 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(231, 76, 60, 0.3);
        }

        .countdown {
            background: #17a2b8;
            color: white;
            padding: 0.25rem 0.5rem;
            border-radius: 15px;
            font-size: 0.9rem;
            font-weight: bold;
            margin-left: 0.5rem;
        }

        .customer-activity-summary {
            background: #e8f4f8;
            border: 1px solid #bee5eb;
            border-radius: 8px;
            padding: 1.5rem;
            margin: 2rem 0;
        }

        .customer-activity-summary h4 {
            color: #0c5460;
            margin: 0 0 1rem 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .activity-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 1rem;
        }

        .activity-stat {
            text-align: center;
            background: white;
            padding: 1rem;
            border-radius: 5px;
        }

        .activity-stat-number {
            font-size: 1.5rem;
            font-weight: bold;
            color: #17a2b8;
            margin: 0;
        }

        .activity-stat-label {
            font-size: 0.875rem;
            color: #6c757d;
            margin: 0;
        }

        @media (max-width: 768px) {
            .customer-header-info {
                flex-direction: column;
                text-align: center;
            }

            .customer-details-grid {
                grid-template-columns: 1fr;
            }

            .delete-actions {
                flex-direction: column;
                align-items: center;
            }

            .btn-delete-confirm,
            .btn {
                width: 100%;
                max-width: 300px;
            }

            .deletion-badge {
                position: static;
                margin-top: 1rem;
                display: inline-block;
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

    SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy");
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
    <!-- Warning Header -->
    <div class="delete-warning-header">
        <div class="warning-icon">⚠️</div>
        <h1>Delete Customer</h1>
        <p>This action will permanently remove the customer from the system</p>
    </div>

    <!-- Delete Container -->
    <div class="delete-container">
        <!-- Danger Alert -->
        <div class="danger-alert">
            <h3>🚨 Warning - Permanent Action</h3>
            <ul>
                <li><strong>This action cannot be undone</strong> - the customer will be permanently deleted</li>
                <li>All billing history associated with this customer will also be removed</li>
                <li>Any pending bills or transactions will be lost</li>
                <li>Customer data will be immediately removed from all reports</li>
            </ul>
        </div>

        <!-- Customer Summary -->
        <div class="customer-summary">
            <div class="summary-header">
                <h2>Customer to be Deleted</h2>
                <p>Review the customer information below before confirming deletion</p>
            </div>

            <div class="customer-card">
                <div class="deletion-badge">⚠️ TO BE DELETED</div>

                <div class="customer-header-info">
                    <div class="customer-avatar-delete">
                        <%= customer.getName().substring(0, 1).toUpperCase() %>
                    </div>
                    <div class="customer-main-info">
                        <h3><%= customer.getName() %></h3>
                        <p>Account: <%= customer.getAccountNumber() %></p>
                    </div>
                </div>

                <div class="customer-details-grid">
                    <div class="detail-box">
                        <div class="detail-label">Full Name</div>
                        <div class="detail-value"><%= customer.getName() %></div>
                    </div>

                    <div class="detail-box">
                        <div class="detail-label">Account Number</div>
                        <div class="detail-value"><%= customer.getAccountNumber() %></div>
                    </div>

                    <div class="detail-box">
                        <div class="detail-label">Address</div>
                        <div class="detail-value"><%= customer.getAddress() %></div>
                    </div>

                    <div class="detail-box">
                        <div class="detail-label">Telephone</div>
                        <div class="detail-value"><%= customer.getTelephone() %></div>
                    </div>

                    <div class="detail-box units-highlight">
                        <div class="detail-label">Units Consumed</div>
                        <h3 class="units-number"><%= customer.getUnitsConsumed() %></h3>
                        <p class="units-label">units</p>
                    </div>

                    <div class="detail-box">
                        <div class="detail-label">Account Created</div>
                        <div class="detail-value">
                            <% if (customer.getCreatedAt() != null) { %>
                            <%= dateFormat.format(customer.getCreatedAt()) %>
                            <% } else { %>
                            Unknown
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Impact Analysis -->
            <div class="impact-analysis">
                <h4>📊 Deletion Impact Analysis</h4>
                <ul class="impact-list">
                    <li><strong>Customer Record:</strong> Complete customer profile will be removed</li>
                    <li><strong>Billing History:</strong> All past bills and transactions will be deleted</li>
                    <li><strong>Financial Impact:</strong>
                        <% if (customer.getUnitsConsumed() > 0) { %>
                        Outstanding consumption of <%= customer.getUnitsConsumed() %> units will be lost
                        <% } else { %>
                        No outstanding consumption to be lost
                        <% } %>
                    </li>
                    <li><strong>Reports:</strong> Customer will be removed from all future reports and analytics</li>
                </ul>
            </div>

            <!-- Customer Activity Summary -->
            <div class="customer-activity-summary">
                <h4>📈 Customer Activity Summary</h4>
                <div class="activity-stats">
                    <div class="activity-stat">
                        <h3 class="activity-stat-number"><%= customer.getUnitsConsumed() %></h3>
                        <p class="activity-stat-label">Total Units</p>
                    </div>
                    <div class="activity-stat">
                        <h3 class="activity-stat-number">
                            <%= customer.getUnitsConsumed() > 0 ? "Active" : "Inactive" %>
                        </h3>
                        <p class="activity-stat-label">Status</p>
                    </div>
                    <div class="activity-stat">
                        <h3 class="activity-stat-number">
                            LKR <%= String.format("%.2f", customer.getUnitsConsumed() * 50.0 * 1.08) %>
                        </h3>
                        <p class="activity-stat-label">Est. Value</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Confirmation Section -->
        <div class="confirmation-section">
            <label class="confirmation-checkbox" for="confirmDelete">
                <input type="checkbox" id="confirmDelete">
                <span class="confirmation-text">
                        I understand that this action will permanently delete the customer and cannot be undone
                    </span>
            </label>

            <div class="delete-actions">
                <form action="${pageContext.request.contextPath}/customer" method="post" style="display: inline;">
                    <input type="hidden" name="action" value="confirmDelete">
                    <input type="hidden" name="accountNumber" value="<%= customer.getAccountNumber() %>">
                    <button type="submit" id="deleteBtn" class="btn-delete-confirm">
                        🗑️ Delete Customer Permanently
                        <span id="countdown" class="countdown" style="display: none;"></span>
                    </button>
                </form>

                <a href="${pageContext.request.contextPath}/customer?action=view&accountNumber=<%= customer.getAccountNumber() %>"
                   class="btn btn-success btn-lg">
                    ✅ Keep Customer
                </a>

                <a href="${pageContext.request.contextPath}/customer"
                   class="btn btn-secondary btn-lg">
                    ← Back to List
                </a>
            </div>
        </div>
    </div>
</div>

<script>
    const confirmCheckbox = document.getElementById('confirmDelete');
    const deleteBtn = document.getElementById('deleteBtn');
    const countdownElement = document.getElementById('countdown');
    let countdownTimer;
    let countdownSeconds = 5;

    // Handle checkbox change
    confirmCheckbox.addEventListener('change', function() {
        if (this.checked) {
            deleteBtn.classList.add('enabled');
            startCountdown();
        } else {
            deleteBtn.classList.remove('enabled');
            stopCountdown();
        }
    });

    // Countdown functionality
    function startCountdown() {
        countdownSeconds = 5;
        countdownElement.style.display = 'inline';
        updateCountdown();

        countdownTimer = setInterval(function() {
            countdownSeconds--;
            updateCountdown();

            if (countdownSeconds <= 0) {
                stopCountdown();
                enableDeleteButton();
            }
        }, 1000);
    }

    function stopCountdown() {
        if (countdownTimer) {
            clearInterval(countdownTimer);
        }
        countdownElement.style.display = 'none';
        deleteBtn.disabled = true;
    }

    function updateCountdown() {
        countdownElement.textContent = countdownSeconds;
        deleteBtn.disabled = true;
    }

    function enableDeleteButton() {
        deleteBtn.disabled = false;
        deleteBtn.innerHTML = '🗑️ Delete Customer Permanently';
    }

    // Form submission confirmation
    deleteBtn.closest('form').addEventListener('submit', function(e) {
        if (!confirmCheckbox.checked) {
            e.preventDefault();
            alert('Please confirm that you understand this action cannot be undone.');
            return false;
        }

        if (deleteBtn.disabled) {
            e.preventDefault();
            return false;
        }

        // Final confirmation
        const customerName = '<%= customer.getName() %>';
        const accountNumber = '<%= customer.getAccountNumber() %>';

        const finalConfirmation = confirm(
            `FINAL CONFIRMATION\n\n` +
            `You are about to permanently delete:\n` +
            `Customer: ${customerName}\n` +
            `Account: ${accountNumber}\n\n` +
            `This action CANNOT be undone!\n\n` +
            `Type the customer name to confirm: "${customerName}"`
        );

        if (finalConfirmation) {
            const typedName = prompt(`Please type the customer name "${customerName}" to confirm deletion:`);

            if (typedName !== customerName) {
                e.preventDefault();
                alert('Customer name does not match. Deletion cancelled.');
                return false;
            }

            // Show loading state
            deleteBtn.innerHTML = '<span class="spinner"></span> Deleting...';
            deleteBtn.disabled = true;
            return true;
        } else {
            e.preventDefault();
            return false;
        }
    });

    // Keyboard shortcuts
    document.addEventListener('keydown', function(e) {
        // ESC to cancel
        if (e.key === 'Escape') {
            window.location.href = '${pageContext.request.contextPath}/customer?action=view&accountNumber=<%= customer.getAccountNumber() %>';
        }

        // Space to toggle checkbox
        if (e.key === ' ' && e.target !== confirmCheckbox) {
            e.preventDefault();
            confirmCheckbox.checked = !confirmCheckbox.checked;
            confirmCheckbox.dispatchEvent(new Event('change'));
        }
    });

    // Prevent accidental navigation
    window.addEventListener('beforeunload', function(e) {
        if (confirmCheckbox.checked) {
            e.preventDefault();
            e.returnValue = 'You have started the deletion process. Are you sure you want to leave?';
            return e.returnValue;
        }
    });

    // Auto-focus checkbox label for accessibility
    document.addEventListener('DOMContentLoaded', function() {
        confirmCheckbox.focus();
    });

    console.log('✅ Customer deletion page initialized');
</script>
</body>
</html>