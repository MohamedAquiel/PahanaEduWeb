<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.pahanaedu.model.Customer" %>
<%@ page import="java.math.BigDecimal" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Bill - Pahana Edu</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .bill-header {
            background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            text-align: center;
        }

        .bill-header h1 {
            margin: 0 0 0.5rem 0;
            font-size: 2.5rem;
        }

        .bill-header p {
            margin: 0;
            font-size: 1.2rem;
            opacity: 0.9;
        }

        .billing-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .customer-selection {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .section-header {
            background: #f8f9fa;
            padding: 1.5rem;
            border-bottom: 1px solid #e9ecef;
        }

        .section-header h3 {
            margin: 0;
            color: #2c3e50;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .section-content {
            padding: 1.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: #2c3e50;
        }

        .required::after {
            content: ' *';
            color: #e74c3c;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 0.875rem;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background-color: #f8f9fa;
        }

        .form-control:focus {
            outline: none;
            border-color: #27ae60;
            background-color: white;
            box-shadow: 0 0 0 0.2rem rgba(39, 174, 96, 0.25);
        }

        .customer-display {
            background: #e8f5e8;
            border: 2px solid #27ae60;
            border-radius: 10px;
            padding: 1rem;
            margin: 1rem 0;
            display: none;
        }

        .customer-display.show {
            display: block;
        }

        .customer-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .customer-avatar {
            width: 50px;
            height: 50px;
            background: #27ae60;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 1.2rem;
        }

        .customer-details h4 {
            margin: 0 0 0.25rem 0;
            color: #2c3e50;
        }

        .customer-details p {
            margin: 0;
            color: #6c757d;
            font-size: 0.9rem;
        }

        .billing-calculation {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .calculation-content {
            padding: 1.5rem;
        }

        .input-group {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .input-icon {
            position: absolute;
            left: 0.875rem;
            top: 50%;
            transform: translateY(-50%);
            color: #7f8c8d;
            font-size: 1.1rem;
            pointer-events: none;
        }

        .input-group .form-control {
            padding-left: 2.5rem;
        }

        .units-input {
            font-size: 1.2rem;
            font-weight: bold;
            text-align: center;
        }

        .calculation-breakdown {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 1.5rem;
            margin-top: 1rem;
        }

        .calculation-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.75rem;
            padding: 0.5rem 0;
        }

        .calculation-row:last-child {
            margin-bottom: 0;
        }

        .calculation-row.total {
            border-top: 2px solid #27ae60;
            padding-top: 1rem;
            margin-top: 1rem;
            font-weight: bold;
            font-size: 1.2rem;
            color: #27ae60;
        }

        .calculation-row.subtotal {
            border-top: 1px solid #dee2e6;
            padding-top: 0.75rem;
            margin-top: 0.75rem;
        }

        .calculation-label {
            color: #6c757d;
        }

        .calculation-value {
            font-weight: 600;
            color: #2c3e50;
        }

        .discount-info {
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            border-radius: 8px;
            padding: 1rem;
            margin: 1rem 0;
            font-size: 0.9rem;
        }

        .discount-info h5 {
            margin: 0 0 0.5rem 0;
            color: #856404;
        }

        .discount-info ul {
            margin: 0;
            padding-left: 1.2rem;
            color: #856404;
        }

        .rate-info {
            background: #e8f4f8;
            border: 1px solid #bee5eb;
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 1rem;
            text-align: center;
        }

        .rate-info h4 {
            margin: 0 0 0.5rem 0;
            color: #0c5460;
        }

        .rate-display {
            font-size: 1.5rem;
            font-weight: bold;
            color: #17a2b8;
        }

        .generate-actions {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 2px solid #e9ecef;
        }

        .btn-generate {
            background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%);
            color: white;
            padding: 1rem 2rem;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            min-width: 180px;
            opacity: 0.5;
            cursor: not-allowed;
        }

        .btn-generate.enabled {
            opacity: 1;
            cursor: pointer;
        }

        .btn-generate.enabled:hover {
            background: linear-gradient(135deg, #229954 0%, #27ae60 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(39, 174, 96, 0.3);
        }

        .bill-preview {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 2rem;
            margin-top: 2rem;
            display: none;
        }

        .bill-preview.show {
            display: block;
        }

        .bill-preview-header {
            text-align: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #27ae60;
        }

        .bill-preview-header h3 {
            margin: 0;
            color: #27ae60;
        }

        .preview-row {
            display: flex;
            justify-content: space-between;
            padding: 0.5rem 0;
            border-bottom: 1px solid #f8f9fa;
        }

        .preview-row:last-child {
            border-bottom: none;
        }

        .preview-row.highlight {
            background: #f0fff4;
            padding: 1rem;
            border-radius: 5px;
            font-weight: bold;
            color: #27ae60;
        }

        @media (max-width: 768px) {
            .billing-container {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .generate-actions {
                flex-direction: column;
                align-items: center;
            }

            .btn-generate {
                width: 100%;
                max-width: 300px;
            }

            .calculation-row {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.25rem;
            }

            .bill-header {
                padding: 1.5rem;
            }

            .bill-header h1 {
                font-size: 2rem;
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

    BigDecimal ratePerUnit = (BigDecimal) request.getAttribute("ratePerUnit");
    if (ratePerUnit == null) {
        ratePerUnit = new BigDecimal("50.00");
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
            <li><a href="${pageContext.request.contextPath}/customer" class="nav-link">Customers</a></li>
            <li><a href="${pageContext.request.contextPath}/item" class="nav-link">Items</a></li>
            <li><a href="${pageContext.request.contextPath}/bill" class="nav-link active">Billing</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/help.jsp" class="nav-link">Help</a></li>
            <li><a href="${pageContext.request.contextPath}/logout" class="nav-link logout">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <!-- Page Header -->
    <div class="bill-header">
        <h1>🧾 Generate Bill</h1>
        <p>Create a new bill for customer charges</p>
    </div>

    <!-- Display Messages -->
    <% if (request.getAttribute("errorMessage") != null) { %>
    <div class="alert alert-error">
        <i class="icon-error">✗</i>
        <%= request.getAttribute("errorMessage") %>
    </div>
    <% } %>

    <!-- Billing Form -->
    <form id="billForm" action="${pageContext.request.contextPath}/bill" method="post">
        <input type="hidden" name="action" value="generate">

        <div class="billing-container">
            <!-- Customer Selection -->
            <div class="customer-selection">
                <div class="section-header">
                    <h3>👤 Select Customer</h3>
                </div>
                <div class="section-content">
                    <div class="form-group">
                        <label for="customerSelect" class="required">Customer</label>
                        <select id="customerSelect" name="accountNumber" class="form-control" required onchange="selectCustomer()">
                            <option value="">-- Select a customer --</option>
                            <% for (Customer customer : customers) { %>
                            <option value="<%= customer.getAccountNumber() %>"
                                    data-name="<%= customer.getName() %>"
                                    data-address="<%= customer.getAddress() %>"
                                    data-telephone="<%= customer.getTelephone() %>"
                                    data-units="<%= customer.getUnitsConsumed() %>">
                                <%= customer.getName() %> (<%= customer.getAccountNumber() %>)
                            </option>
                            <% } %>
                        </select>
                    </div>

                    <% if (customers.isEmpty()) { %>
                    <div class="alert alert-warning">
                        <i class="icon-warning">⚠️</i>
                        No customers found. <a href="${pageContext.request.contextPath}/customer?action=add">Add a customer</a> first.
                    </div>
                    <% } %>

                    <!-- Selected Customer Display -->
                    <div id="customerDisplay" class="customer-display">
                        <div class="customer-info">
                            <div class="customer-avatar" id="customerAvatar">?</div>
                            <div class="customer-details">
                                <h4 id="customerName">Customer Name</h4>
                                <p id="customerAccount">Account: </p>
                                <p id="customerAddress">Address: </p>
                                <p id="customerPhone">Phone: </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Billing Calculation -->
            <div class="billing-calculation">
                <div class="section-header">
                    <h3>💰 Billing Calculation</h3>
                </div>
                <div class="calculation-content">
                    <!-- Rate Information -->
                    <div class="rate-info">
                        <h4>Current Rate</h4>
                        <div class="rate-display">LKR <%= String.format("%.2f", ratePerUnit) %> per unit</div>
                    </div>

                    <!-- Units Input -->
                    <div class="form-group">
                        <label for="unitsConsumed" class="required">Units Consumed</label>
                        <div class="input-group">
                            <span class="input-icon">📊</span>
                            <input type="number"
                                   id="unitsConsumed"
                                   name="unitsConsumed"
                                   class="form-control units-input"
                                   placeholder="Enter units consumed"
                                   required
                                   min="0"
                                   max="9999"
                                   onchange="calculateBill()"
                                   oninput="calculateBill()">
                        </div>
                    </div>

                    <!-- Discount Information -->
                    <div class="discount-info">
                        <h5>💡 Discount Structure</h5>
                        <ul>
                            <li>5% discount for 20-49 units</li>
                            <li>10% discount for 50-99 units</li>
                            <li>15% discount for 100+ units</li>
                        </ul>
                    </div>

                    <!-- Calculation Breakdown -->
                    <div id="calculationBreakdown" class="calculation-breakdown" style="display: none;">
                        <div class="calculation-row">
                            <span class="calculation-label">Units Consumed:</span>
                            <span class="calculation-value" id="displayUnits">0</span>
                        </div>
                        <div class="calculation-row">
                            <span class="calculation-label">Rate per Unit:</span>
                            <span class="calculation-value">LKR <%= String.format("%.2f", ratePerUnit) %></span>
                        </div>
                        <div class="calculation-row">
                            <span class="calculation-label">Base Amount:</span>
                            <span class="calculation-value" id="baseAmount">LKR 0.00</span>
                        </div>
                        <div class="calculation-row" id="discountRow" style="display: none;">
                            <span class="calculation-label">Discount (<span id="discountPercent">0</span>%):</span>
                            <span class="calculation-value" id="discountAmount">- LKR 0.00</span>
                        </div>
                        <div class="calculation-row subtotal">
                            <span class="calculation-label">Subtotal:</span>
                            <span class="calculation-value" id="subtotalAmount">LKR 0.00</span>
                        </div>
                        <div class="calculation-row">
                            <span class="calculation-label">Tax (8%):</span>
                            <span class="calculation-value" id="taxAmount">LKR 0.00</span>
                        </div>
                        <div class="calculation-row total">
                            <span class="calculation-label">Total Amount:</span>
                            <span class="calculation-value" id="totalAmount">LKR 0.00</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Generate Actions -->
        <div class="generate-actions">
            <button type="submit" id="generateBtn" class="btn-generate">
                🧾 Generate Bill
            </button>
            <a href="${pageContext.request.contextPath}/bill?action=list" class="btn btn-secondary btn-lg">
                📋 View All Bills
            </a>
            <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-info btn-lg">
                ← Back to Dashboard
            </a>
        </div>
    </form>

    <!-- Bill Preview -->
    <div id="billPreview" class="bill-preview">
        <div class="bill-preview-header">
            <h3>📋 Bill Preview</h3>
        </div>
        <div class="preview-row">
            <span>Customer:</span>
            <span id="previewCustomer">-</span>
        </div>
        <div class="preview-row">
            <span>Account Number:</span>
            <span id="previewAccount">-</span>
        </div>
        <div class="preview-row">
            <span>Units Consumed:</span>
            <span id="previewUnits">-</span>
        </div>
        <div class="preview-row">
            <span>Rate per Unit:</span>
            <span>LKR <%= String.format("%.2f", ratePerUnit) %></span>
        </div>
        <div class="preview-row highlight">
            <span>Total Amount:</span>
            <span id="previewTotal">LKR 0.00</span>
        </div>
    </div>
</div>

<script>
    const ratePerUnit = <%= ratePerUnit %>;
    let selectedCustomer = null;

    function selectCustomer() {
        const select = document.getElementById('customerSelect');
        const option = select.options[select.selectedIndex];
        const display = document.getElementById('customerDisplay');
        const unitsInput = document.getElementById('unitsConsumed');

        if (option.value) {
            selectedCustomer = {
                accountNumber: option.value,
                name: option.getAttribute('data-name'),
                address: option.getAttribute('data-address'),
                telephone: option.getAttribute('data-telephone'),
                units: parseInt(option.getAttribute('data-units'))
            };

            // Update display
            document.getElementById('customerAvatar').textContent = selectedCustomer.name.charAt(0);
            document.getElementById('customerName').textContent = selectedCustomer.name;
            document.getElementById('customerAccount').textContent = 'Account: ' + selectedCustomer.accountNumber;
            document.getElementById('customerAddress').textContent = 'Address: ' + selectedCustomer.address;
            document.getElementById('customerPhone').textContent = 'Phone: ' + selectedCustomer.telephone;

            display.classList.add('show');

            // Pre-fill units consumed
            unitsInput.value = selectedCustomer.units;
            calculateBill();
        } else {
            selectedCustomer = null;
            display.classList.remove('show');
            unitsInput.value = '';
            hideCalculation();
        }

        updateGenerateButton();
    }

    function calculateBill() {
        const unitsInput = document.getElementById('unitsConsumed');
        const units = parseInt(unitsInput.value) || 0;

        if (units <= 0) {
            hideCalculation();
            return;
        }

        // Base calculation
        const baseAmount = units * ratePerUnit;

        // Discount calculation
        let discountPercent = 0;
        if (units >= 100) {
            discountPercent = 15;
        } else if (units >= 50) {
            discountPercent = 10;
        } else if (units >= 20) {
            discountPercent = 5;
        }

        const discountAmount = baseAmount * (discountPercent / 100);
        const subtotal = baseAmount - discountAmount;
        const taxAmount = subtotal * 0.08; // 8% tax
        const totalAmount = subtotal + taxAmount;

        // Update display
        document.getElementById('displayUnits').textContent = units + ' units';
        document.getElementById('baseAmount').textContent = 'LKR ' + baseAmount.toFixed(2);

        const discountRow = document.getElementById('discountRow');
        if (discountPercent > 0) {
            document.getElementById('discountPercent').textContent = discountPercent;
            document.getElementById('discountAmount').textContent = '- LKR ' + discountAmount.toFixed(2);
            discountRow.style.display = 'flex';
        } else {
            discountRow.style.display = 'none';
        }

        document.getElementById('subtotalAmount').textContent = 'LKR ' + subtotal.toFixed(2);
        document.getElementById('taxAmount').textContent = 'LKR ' + taxAmount.toFixed(2);
        document.getElementById('totalAmount').textContent = 'LKR ' + totalAmount.toFixed(2);

        // Show calculation
        document.getElementById('calculationBreakdown').style.display = 'block';

        // Update preview
        updatePreview(units, totalAmount);
        updateGenerateButton();
    }

    function hideCalculation() {
        document.getElementById('calculationBreakdown').style.display = 'none';
        document.getElementById('billPreview').classList.remove('show');
        updateGenerateButton();
    }

    function updatePreview(units, totalAmount) {
        if (selectedCustomer && units > 0) {
            document.getElementById('previewCustomer').textContent = selectedCustomer.name;
            document.getElementById('previewAccount').textContent = selectedCustomer.accountNumber;
            document.getElementById('previewUnits').textContent = units + ' units';
            document.getElementById('previewTotal').textContent = 'LKR ' + totalAmount.toFixed(2);
            document.getElementById('billPreview').classList.add('show');
        } else {
            document.getElementById('billPreview').classList.remove('show');
        }
    }

    function updateGenerateButton() {
        const generateBtn = document.getElementById('generateBtn');
        const unitsInput = document.getElementById('unitsConsumed');
        const units = parseInt(unitsInput.value) || 0;

        if (selectedCustomer && units > 0) {
            generateBtn.classList.add('enabled');
            generateBtn.disabled = false;
        } else {
            generateBtn.classList.remove('enabled');
            generateBtn.disabled = true;
        }
    }

    // Form submission
    document.getElementById('billForm').addEventListener('submit', function(e) {
        if (!selectedCustomer) {
            e.preventDefault();
            alert('Please select a customer');
            return false;
        }

        const units = parseInt(document.getElementById('unitsConsumed').value) || 0;
        if (units <= 0) {
            e.preventDefault();
            alert('Please enter a valid number of units consumed');
            return false;
        }

        // Show loading state
        const generateBtn = document.getElementById('generateBtn');
        generateBtn.innerHTML = '<span class="spinner"></span> Generating Bill...';
        generateBtn.disabled = true;
    });

    // Auto-calculate on page load if customer is pre-selected
    document.addEventListener('DOMContentLoaded', function() {
        const customerSelect = document.getElementById('customerSelect');
        if (customerSelect.value) {
            selectCustomer();
        }
    });

    // Keyboard shortcuts
    document.addEventListener('keydown', function(e) {
        if (e.ctrlKey) {
            switch(e.key) {
                case 'g':
                    e.preventDefault();
                    if (!document.getElementById('generateBtn').disabled) {
                        document.getElementById('billForm').submit();
                    }
                    break;
                case 'c':
                    e.preventDefault();
                    document.getElementById('customerSelect').focus();
                    break;
                case 'u':
                    e.preventDefault();
                    document.getElementById('unitsConsumed').focus();
                    break;
            }
        }
    });

    console.log('✅ Bill creation page initialized');
</script>
</body>
</html>