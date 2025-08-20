<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pahanaedu.model.Customer" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Customer - Pahana Edu</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .edit-customer-header {
            background: linear-gradient(135deg, #f39c12 0%, #e67e22 100%);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .header-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .customer-avatar-edit {
            width: 60px;
            height: 60px;
            background: rgba(255,255,255,0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            font-weight: bold;
            border: 2px solid rgba(255,255,255,0.3);
        }

        .header-text h1 {
            margin: 0 0 0.25rem 0;
            font-size: 2rem;
        }

        .header-text p {
            margin: 0;
            opacity: 0.9;
        }

        .account-badge {
            background: rgba(255,255,255,0.2);
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: 600;
            backdrop-filter: blur(10px);
        }

        .form-container {
            background: white;
            padding: 2.5rem;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            max-width: 700px;
            margin: 0 auto;
            position: relative;
        }

        .form-header {
            text-align: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #e9ecef;
        }

        .form-header h2 {
            color: #2c3e50;
            margin: 0 0 0.5rem 0;
        }

        .form-header p {
            color: #7f8c8d;
            margin: 0;
        }

        .form-section {
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid #e9ecef;
        }

        .form-section:last-child {
            border-bottom: none;
            margin-bottom: 0;
        }

        .section-title {
            color: #2c3e50;
            font-size: 1.2rem;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 600;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .form-row.single {
            grid-template-columns: 1fr;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: #2c3e50;
            position: relative;
        }

        .required::after {
            content: ' *';
            color: #e74c3c;
            font-weight: bold;
        }

        .readonly-field {
            background: #f8f9fa !important;
            border: 2px solid #e9ecef !important;
            color: #6c757d !important;
            cursor: not-allowed !important;
        }

        .readonly-field:focus {
            box-shadow: none !important;
            border-color: #e9ecef !important;
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
            border-color: #f39c12;
            background-color: white;
            box-shadow: 0 0 0 0.2rem rgba(243, 156, 18, 0.25);
            transform: translateY(-1px);
        }

        .form-control:valid:not(.readonly-field) {
            border-color: #27ae60;
            background-color: #f0fff4;
        }

        .form-control.error {
            border-color: #e74c3c;
            background-color: #fdf2f2;
            box-shadow: 0 0 0 0.2rem rgba(231, 76, 60, 0.25);
        }

        .input-group {
            position: relative;
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

        .help-text {
            font-size: 0.875rem;
            color: #6c757d;
            margin-top: 0.25rem;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .error-message {
            color: #e74c3c;
            font-size: 0.875rem;
            margin-top: 0.5rem;
            display: none;
            align-items: center;
            gap: 0.25rem;
        }

        .error-message.show {
            display: flex;
        }

        .change-indicator {
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            border-radius: 5px;
            padding: 0.5rem;
            margin-top: 0.5rem;
            font-size: 0.875rem;
            color: #856404;
            display: none;
        }

        .change-indicator.show {
            display: block;
        }

        .form-actions {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 2px solid #e9ecef;
        }

        .btn-update {
            background: linear-gradient(135deg, #f39c12 0%, #e67e22 100%);
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
            min-width: 150px;
        }

        .btn-update:hover:not(:disabled) {
            background: linear-gradient(135deg, #e67e22 0%, #f39c12 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(243, 156, 18, 0.3);
        }

        .btn-update:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        .changes-summary {
            background: #e8f4f8;
            border: 1px solid #bee5eb;
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 2rem;
            display: none;
        }

        .changes-summary.show {
            display: block;
        }

        .changes-summary h4 {
            color: #0c5460;
            margin: 0 0 0.5rem 0;
            font-size: 1rem;
        }

        .changes-list {
            margin: 0;
            padding-left: 1.5rem;
            color: #0c5460;
        }

        .original-values {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 1rem;
            margin-top: 1rem;
        }

        .original-values h5 {
            margin: 0 0 0.5rem 0;
            color: #6c757d;
            font-size: 0.9rem;
        }

        .original-value {
            font-size: 0.875rem;
            color: #6c757d;
            margin-bottom: 0.25rem;
        }

        @media (max-width: 768px) {
            .edit-customer-header {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }

            .form-container {
                padding: 1.5rem;
                margin: 1rem;
            }

            .form-row {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .form-actions {
                flex-direction: column;
            }

            .header-info {
                flex-direction: column;
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
    <div class="edit-customer-header">
        <div class="header-info">
            <div class="customer-avatar-edit">
                <%= customer.getName().substring(0, 1).toUpperCase() %>
            </div>
            <div class="header-text">
                <h1>✏️ Edit Customer</h1>
                <p>Update <%= customer.getName() %>'s information</p>
            </div>
        </div>
        <div class="account-badge">
            <%= customer.getAccountNumber() %>
        </div>
    </div>

    <!-- Display Error Messages -->
    <% if (request.getAttribute("errorMessage") != null) { %>
    <div class="alert alert-error">
        <i class="icon-error">✗</i>
        <%= request.getAttribute("errorMessage") %>
    </div>
    <% } %>

    <!-- Changes Summary -->
    <div id="changesSummary" class="changes-summary">
        <h4>📝 Pending Changes</h4>
        <ul id="changesList" class="changes-list"></ul>
    </div>

    <!-- Edit Customer Form -->
    <div class="form-container">
        <div class="form-header">
            <h2>Customer Information</h2>
            <p>Make changes to the customer details below</p>
        </div>

        <form id="editCustomerForm" action="${pageContext.request.contextPath}/customer" method="post" novalidate>
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="accountNumber" value="<%= customer.getAccountNumber() %>">

            <!-- Account Information Section -->
            <div class="form-section">
                <h3 class="section-title">
                    🏷️ Account Information
                </h3>

                <div class="form-group">
                    <label for="accountNumber">Account Number</label>
                    <div class="input-group">
                        <span class="input-icon">🏷️</span>
                        <input type="text"
                               id="accountNumber"
                               class="form-control readonly-field"
                               value="<%= customer.getAccountNumber() %>"
                               readonly>
                    </div>
                    <div class="help-text">
                        🔒 Account number cannot be changed after creation
                    </div>
                </div>
            </div>

            <!-- Personal Information Section -->
            <div class="form-section">
                <h3 class="section-title">
                    👤 Personal Information
                </h3>

                <div class="form-group">
                    <label for="name" class="required">Full Name</label>
                    <div class="input-group">
                        <span class="input-icon">👤</span>
                        <input type="text"
                               id="name"
                               name="name"
                               class="form-control"
                               value="<%= customer.getName() %>"
                               placeholder="Enter customer's full name"
                               required
                               maxlength="100"
                               pattern="[A-Za-z\s.']+">
                    </div>
                    <div class="help-text">
                        💡 Enter the customer's complete name
                    </div>
                    <div id="nameError" class="error-message">
                        ❌ <span></span>
                    </div>
                    <div id="nameChange" class="change-indicator">
                        Original: <span id="nameOriginal"><%= customer.getName() %></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="address" class="required">Address</label>
                    <div class="input-group">
                        <span class="input-icon">🏠</span>
                        <textarea id="address"
                                  name="address"
                                  class="form-control"
                                  placeholder="Enter complete address"
                                  required
                                  maxlength="500"
                                  rows="3"><%= customer.getAddress() %></textarea>
                    </div>
                    <div class="help-text">
                        💡 Include street address, city, and postal code
                    </div>
                    <div id="addressError" class="error-message">
                        ❌ <span></span>
                    </div>
                    <div id="addressChange" class="change-indicator">
                        Original: <span id="addressOriginal"><%= customer.getAddress() %></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="telephone" class="required">Telephone Number</label>
                    <div class="input-group">
                        <span class="input-icon">📞</span>
                        <input type="tel"
                               id="telephone"
                               name="telephone"
                               class="form-control"
                               value="<%= customer.getTelephone() %>"
                               placeholder="Enter contact number"
                               required
                               maxlength="15"
                               pattern="[0-9\s\-\+\(\)]+">
                    </div>
                    <div class="help-text">
                        💡 Enter a valid contact number
                    </div>
                    <div id="telephoneError" class="error-message">
                        ❌ <span></span>
                    </div>
                    <div id="telephoneChange" class="change-indicator">
                        Original: <span id="telephoneOriginal"><%= customer.getTelephone() %></span>
                    </div>
                </div>
            </div>

            <!-- Usage Information Section -->
            <div class="form-section">
                <h3 class="section-title">
                    📊 Usage Information
                </h3>

                <div class="form-group">
                    <label for="unitsConsumed" class="required">Units Consumed</label>
                    <div class="input-group">
                        <span class="input-icon">📊</span>
                        <input type="number"
                               id="unitsConsumed"
                               name="unitsConsumed"
                               class="form-control"
                               value="<%= customer.getUnitsConsumed() %>"
                               placeholder="Enter current reading"
                               required
                               min="0"
                               max="9999">
                    </div>
                    <div class="help-text">
                        💡 Current meter reading or consumption units
                    </div>
                    <div id="unitsConsumedError" class="error-message">
                        ❌ <span></span>
                    </div>
                    <div id="unitsConsumedChange" class="change-indicator">
                        Original: <span id="unitsConsumedOriginal"><%= customer.getUnitsConsumed() %></span> units
                    </div>
                </div>
            </div>

            <!-- Original Values (Hidden for reference) -->
            <div class="original-values">
                <h5>Original Values (for reference)</h5>
                <div class="original-value"><strong>Name:</strong> <%= customer.getName() %></div>
                <div class="original-value"><strong>Address:</strong> <%= customer.getAddress() %></div>
                <div class="original-value"><strong>Telephone:</strong> <%= customer.getTelephone() %></div>
                <div class="original-value"><strong>Units:</strong> <%= customer.getUnitsConsumed() %></div>
            </div>

            <!-- Form Actions -->
            <div class="form-actions">
                <button type="submit" id="updateBtn" class="btn-update">
                    <span class="btn-text">💾 Update Customer</span>
                    <span class="btn-loading" style="display: none;">
                            <span class="spinner"></span>
                            Updating...
                        </span>
                </button>
                <a href="${pageContext.request.contextPath}/customer?action=view&accountNumber=<%= customer.getAccountNumber() %>"
                   class="btn btn-secondary btn-lg">
                    ❌ Cancel
                </a>
            </div>
        </form>
    </div>
</div>

<script>
    // Store original values
    const originalValues = {
        name: '<%= customer.getName() %>',
        address: '<%= customer.getAddress() %>',
        telephone: '<%= customer.getTelephone() %>',
        unitsConsumed: '<%= customer.getUnitsConsumed() %>'
    };

    // Form elements
    const form = document.getElementById('editCustomerForm');
    const updateBtn = document.getElementById('updateBtn');
    const changesSummary = document.getElementById('changesSummary');
    const changesList = document.getElementById('changesList');

    // Field references
    const fields = {
        name: document.getElementById('name'),
        address: document.getElementById('address'),
        telephone: document.getElementById('telephone'),
        unitsConsumed: document.getElementById('unitsConsumed')
    };

    // Validation rules (same as add form)
    const validationRules = {
        name: {
            required: true,
            minLength: 2,
            maxLength: 100,
            pattern: /^[A-Za-z\s.']+$/,
            message: 'Name must be 2-100 characters long and contain only letters, spaces, dots, and apostrophes'
        },
        address: {
            required: true,
            minLength: 5,
            maxLength: 500,
            message: 'Address must be 5-500 characters long'
        },
        telephone: {
            required: true,
            minLength: 7,
            maxLength: 15,
            pattern: /^[0-9\s\-\+\(\)]+$/,
            message: 'Telephone must be 7-15 characters long and contain only numbers, spaces, hyphens, plus signs, and parentheses'
        },
        unitsConsumed: {
            required: true,
            min: 0,
            max: 9999,
            message: 'Units consumed must be between 0 and 9999'
        }
    };

    // Validate field function (same as add form)
    function validateField(fieldName) {
        const field = fields[fieldName];
        const rule = validationRules[fieldName];
        const value = field.value.trim();
        const errorElement = document.getElementById(fieldName + 'Error');

        let isValid = true;
        let errorMessage = '';

        if (rule.required && !value) {
            isValid = false;
            errorMessage = `${fieldName} is required`;
        } else if (rule.minLength && value.length < rule.minLength) {
            isValid = false;
            errorMessage = `${fieldName} must be at least ${rule.minLength} characters`;
        } else if (rule.maxLength && value.length > rule.maxLength) {
            isValid = false;
            errorMessage = `${fieldName} must not exceed ${rule.maxLength} characters`;
        } else if (rule.min !== undefined && parseInt(value) < rule.min) {
            isValid = false;
            errorMessage = `${fieldName} must be at least ${rule.min}`;
        } else if (rule.max !== undefined && parseInt(value) > rule.max) {
            isValid = false;
            errorMessage = `${fieldName} must not exceed ${rule.max}`;
        } else if (rule.pattern && !rule.pattern.test(value)) {
            isValid = false;
            errorMessage = rule.message;
        }

        // Update UI
        if (isValid) {
            field.classList.remove('error');
            errorElement.classList.remove('show');
        } else {
            field.classList.add('error');
            errorElement.querySelector('span').textContent = errorMessage;
            errorElement.classList.add('show');
        }

        return isValid;
    }

    // Check for changes and update UI
    function checkForChanges() {
        const changes = [];
        let hasChanges = false;

        for (const fieldName in fields) {
            const field = fields[fieldName];
            const currentValue = field.value.trim();
            const originalValue = originalValues[fieldName].toString().trim();
            const changeIndicator = document.getElementById(fieldName + 'Change');

            if (currentValue !== originalValue) {
                hasChanges = true;
                changes.push(`${fieldName}: "${originalValue}" → "${currentValue}"`);
                changeIndicator.classList.add('show');
            } else {
                changeIndicator.classList.remove('show');
            }
        }

        // Update changes summary
        if (hasChanges) {
            changesList.innerHTML = changes.map(change => `<li>${change}</li>`).join('');
            changesSummary.classList.add('show');
            updateBtn.disabled = false;
        } else {
            changesSummary.classList.remove('show');
            updateBtn.disabled = true;
        }
    }

    // Add event listeners
    for (const fieldName in fields) {
        const field = fields[fieldName];

        field.addEventListener('input', () => {
            checkForChanges();
            if (field.classList.contains('error')) {
                validateField(fieldName);
            }
        });

        field.addEventListener('blur', () => validateField(fieldName));
    }

    // Form submission
    form.addEventListener('submit', function(e) {
        e.preventDefault();

        // Validate all fields
        let isValid = true;
        for (const fieldName in fields) {
            if (!validateField(fieldName)) {
                isValid = false;
            }
        }

        if (!isValid) {
            const firstError = form.querySelector('.error');
            if (firstError) {
                firstError.focus();
            }
            return;
        }

        // Check if there are actually changes
        checkForChanges();
        if (updateBtn.disabled) {
            alert('No changes detected. Please make changes before updating.');
            return;
        }

        // Confirm changes
        if (!confirm('Are you sure you want to save these changes?')) {
            return;
        }

        // Show loading state
        const btnText = updateBtn.querySelector('.btn-text');
        const btnLoading = updateBtn.querySelector('.btn-loading');

        btnText.style.display = 'none';
        btnLoading.style.display = 'inline-flex';
        updateBtn.disabled = true;

        // Submit form
        setTimeout(() => {
            form.submit();
        }, 500);
    });

    // Reset form
    function resetForm() {
        for (const fieldName in fields) {
            fields[fieldName].value = originalValues[fieldName];
            fields[fieldName].classList.remove('error');
            document.getElementById(fieldName + 'Error').classList.remove('show');
            document.getElementById(fieldName + 'Change').classList.remove('show');
        }
        changesSummary.classList.remove('show');
        updateBtn.disabled = true;
    }

    // Keyboard shortcuts
    document.addEventListener('keydown', function(e) {
        if (e.ctrlKey) {
            switch(e.key) {
                case 's':
                    e.preventDefault();
                    if (!updateBtn.disabled) {
                        form.dispatchEvent(new Event('submit'));
                    }
                    break;
                case 'r':
                    e.preventDefault();
                    if (confirm('Reset all changes?')) {
                        resetForm();
                    }
                    break;
            }
        }

        if (e.key === 'Escape') {
            if (confirm('Discard changes and go back?')) {
                window.location.href = '${pageContext.request.contextPath}/customer?action=view&accountNumber=<%= customer.getAccountNumber() %>';
            }
        }
    });

    // Initialize
    document.addEventListener('DOMContentLoaded', function() {
        checkForChanges();
        fields.name.focus();
    });

    // Warn before leaving with unsaved changes
    window.addEventListener('beforeunload', function(e) {
        if (!updateBtn.disabled) {
            e.preventDefault();
            e.returnValue = 'You have unsaved changes. Are you sure you want to leave?';
            return e.returnValue;
        }
    });

    console.log('✅ Customer edit form initialized');
</script>
</body>
</html>