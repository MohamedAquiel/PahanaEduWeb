<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer - Pahana Edu</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .add-customer-header {
            background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            text-align: center;
        }

        .add-customer-header h1 {
            margin: 0 0 0.5rem 0;
            font-size: 2.5rem;
        }

        .add-customer-header p {
            margin: 0;
            font-size: 1.2rem;
            opacity: 0.9;
        }

        .form-container {
            background: white;
            padding: 2.5rem;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            max-width: 700px;
            margin: 0 auto;
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
            font-size: 1.3rem;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
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
            transform: translateY(-1px);
        }

        .form-control:valid {
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

        .form-actions {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 2px solid #e9ecef;
        }

        .btn-submit {
            background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%);
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

        .btn-submit:hover:not(:disabled) {
            background: linear-gradient(135deg, #229954 0%, #27ae60 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(39, 174, 96, 0.3);
        }

        .btn-submit:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        .btn-loading {
            display: none;
            align-items: center;
            gap: 0.5rem;
        }

        .spinner {
            width: 16px;
            height: 16px;
            border: 2px solid rgba(255,255,255,0.3);
            border-radius: 50%;
            border-top-color: white;
            animation: spin 1s ease-in-out infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        .validation-summary {
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 2rem;
            display: none;
        }

        .validation-summary.show {
            display: block;
        }

        .validation-summary h4 {
            color: #856404;
            margin: 0 0 0.5rem 0;
            font-size: 1rem;
        }

        .validation-summary ul {
            margin: 0;
            padding-left: 1.5rem;
            color: #856404;
        }

        .example-box {
            background: linear-gradient(135deg, #e8f4f8 0%, #f0f8ff 100%);
            border-left: 4px solid #17a2b8;
            padding: 1rem;
            margin-top: 0.5rem;
            border-radius: 0 8px 8px 0;
        }

        .example-box h5 {
            margin: 0 0 0.5rem 0;
            color: #0c5460;
            font-size: 0.9rem;
        }

        .example-box p {
            margin: 0;
            font-size: 0.875rem;
            color: #0c5460;
            font-family: monospace;
        }

        @media (max-width: 768px) {
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

            .add-customer-header {
                margin: 1rem;
                padding: 1.5rem;
            }

            .add-customer-header h1 {
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
    <div class="add-customer-header">
        <h1>➕ Add New Customer</h1>
        <p>Register a new customer account in the system</p>
    </div>

    <!-- Display Error Messages -->
    <% if (request.getAttribute("errorMessage") != null) { %>
    <div class="alert alert-error">
        <i class="icon-error">✗</i>
        <%= request.getAttribute("errorMessage") %>
    </div>
    <% } %>

    <!-- Validation Summary -->
    <div id="validationSummary" class="validation-summary">
        <h4>⚠️ Please fix the following errors:</h4>
        <ul id="validationList"></ul>
    </div>

    <!-- Add Customer Form -->
    <div class="form-container">
        <form id="addCustomerForm" action="${pageContext.request.contextPath}/customer" method="post" novalidate>
            <input type="hidden" name="action" value="add">

            <!-- Account Information Section -->
            <div class="form-section">
                <h3 class="section-title">
                    🏷️ Account Information
                </h3>

                <div class="form-group">
                    <label for="accountNumber" class="required">Account Number</label>
                    <div class="input-group">
                        <span class="input-icon">🏷️</span>
                        <input type="text"
                               id="accountNumber"
                               name="accountNumber"
                               class="form-control"
                               value="<%= request.getAttribute("accountNumber") != null ? request.getAttribute("accountNumber") : "" %>"
                               placeholder="Enter unique account number"
                               required
                               maxlength="20"
                               pattern="[A-Za-z0-9_-]+">
                    </div>
                    <div class="help-text">
                        💡 Use only letters, numbers, hyphens, and underscores (4-20 characters)
                    </div>
                    <div id="accountNumberError" class="error-message">
                        ❌ <span></span>
                    </div>
                    <div class="example-box">
                        <h5>Examples:</h5>
                        <p>CUST001, CUSTOMER_123, ACC-2024-001</p>
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
                               value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>"
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
                                  rows="3"><%= request.getAttribute("address") != null ? request.getAttribute("address") : "" %></textarea>
                    </div>
                    <div class="help-text">
                        💡 Include street address, city, and postal code
                    </div>
                    <div id="addressError" class="error-message">
                        ❌ <span></span>
                    </div>
                    <div class="example-box">
                        <h5>Example:</h5>
                        <p>123 Galle Road, Colombo 03, Sri Lanka</p>
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
                               value="<%= request.getAttribute("telephone") != null ? request.getAttribute("telephone") : "" %>"
                               placeholder="Enter contact number"
                               required
                               maxlength="15"
                               pattern="[0-9\s\-\+\(\)]+">
                    </div>
                    <div class="help-text">
                        💡 Enter a valid contact number with country code if international
                    </div>
                    <div id="telephoneError" class="error-message">
                        ❌ <span></span>
                    </div>
                    <div class="example-box">
                        <h5>Examples:</h5>
                        <p>0112345678, +94112345678, (011) 234-5678</p>
                    </div>
                </div>
            </div>

            <!-- Usage Information Section -->
            <div class="form-section">
                <h3 class="section-title">
                    📊 Usage Information
                </h3>

                <div class="form-group">
                    <label for="unitsConsumed" class="required">Initial Units Consumed</label>
                    <div class="input-group">
                        <span class="input-icon">📊</span>
                        <input type="number"
                               id="unitsConsumed"
                               name="unitsConsumed"
                               class="form-control"
                               value="<%= request.getAttribute("unitsConsumed") != null ? request.getAttribute("unitsConsumed") : "0" %>"
                               placeholder="Enter initial reading"
                               required
                               min="0"
                               max="9999">
                    </div>
                    <div class="help-text">
                        💡 Usually 0 for new customers, or current reading for existing customers
                    </div>
                    <div id="unitsConsumedError" class="error-message">
                        ❌ <span></span>
                    </div>
                </div>
            </div>

            <!-- Form Actions -->
            <div class="form-actions">
                <button type="submit" id="submitBtn" class="btn-submit">
                    <span class="btn-text">✅ Add Customer</span>
                    <span class="btn-loading">
                            <span class="spinner"></span>
                            Adding Customer...
                        </span>
                </button>
                <a href="${pageContext.request.contextPath}/customer" class="btn btn-secondary btn-lg">
                    ❌ Cancel
                </a>
            </div>
        </form>
    </div>
</div>

<script>
    // Form validation
    const form = document.getElementById('addCustomerForm');
    const submitBtn = document.getElementById('submitBtn');
    const validationSummary = document.getElementById('validationSummary');
    const validationList = document.getElementById('validationList');

    // Field references
    const fields = {
        accountNumber: document.getElementById('accountNumber'),
        name: document.getElementById('name'),
        address: document.getElementById('address'),
        telephone: document.getElementById('telephone'),
        unitsConsumed: document.getElementById('unitsConsumed')
    };

    // Validation rules
    const validationRules = {
        accountNumber: {
            required: true,
            minLength: 4,
            maxLength: 20,
            pattern: /^[A-Za-z0-9_-]+$/,
            message: 'Account number must be 4-20 characters long and contain only letters, numbers, hyphens, and underscores'
        },
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

    // Validate individual field
    function validateField(fieldName) {
        const field = fields[fieldName];
        const rule = validationRules[fieldName];
        const value = field.value.trim();
        const errorElement = document.getElementById(fieldName + 'Error');

        let isValid = true;
        let errorMessage = '';

        // Required check
        if (rule.required && !value) {
            isValid = false;
            errorMessage = `${fieldName} is required`;
        }
        // Length checks
        else if (rule.minLength && value.length < rule.minLength) {
            isValid = false;
            errorMessage = `${fieldName} must be at least ${rule.minLength} characters`;
        }
        else if (rule.maxLength && value.length > rule.maxLength) {
            isValid = false;
            errorMessage = `${fieldName} must not exceed ${rule.maxLength} characters`;
        }
        // Number checks
        else if (rule.min !== undefined && parseInt(value) < rule.min) {
            isValid = false;
            errorMessage = `${fieldName} must be at least ${rule.min}`;
        }
        else if (rule.max !== undefined && parseInt(value) > rule.max) {
            isValid = false;
            errorMessage = `${fieldName} must not exceed ${rule.max}`;
        }
        // Pattern check
        else if (rule.pattern && !rule.pattern.test(value)) {
            isValid = false;
            errorMessage = rule.message;
        }

        // Update UI
        if (isValid) {
            field.classList.remove('error');
            field.classList.add('valid');
            errorElement.classList.remove('show');
        } else {
            field.classList.add('error');
            field.classList.remove('valid');
            errorElement.querySelector('span').textContent = errorMessage;
            errorElement.classList.add('show');
        }

        return isValid;
    }

    // Validate entire form
    function validateForm() {
        let isValid = true;
        const errors = [];

        for (const fieldName in fields) {
            if (!validateField(fieldName)) {
                isValid = false;
                const rule = validationRules[fieldName];
                errors.push(rule.message || `Invalid ${fieldName}`);
            }
        }

        // Update validation summary
        if (errors.length > 0) {
            validationList.innerHTML = errors.map(error => `<li>${error}</li>`).join('');
            validationSummary.classList.add('show');
            validationSummary.scrollIntoView({ behavior: 'smooth', block: 'center' });
        } else {
            validationSummary.classList.remove('show');
        }

        return isValid;
    }

    // Add event listeners
    for (const fieldName in fields) {
        const field = fields[fieldName];

        field.addEventListener('blur', () => validateField(fieldName));
        field.addEventListener('input', () => {
            // Clear error on input
            if (field.classList.contains('error')) {
                validateField(fieldName);
            }
        });
    }

    // Form submission
    form.addEventListener('submit', function(e) {
        e.preventDefault();

        if (validateForm()) {
            // Show loading state
            const btnText = submitBtn.querySelector('.btn-text');
            const btnLoading = submitBtn.querySelector('.btn-loading');

            btnText.style.display = 'none';
            btnLoading.style.display = 'inline-flex';
            submitBtn.disabled = true;

            // Submit form
            setTimeout(() => {
                form.submit();
            }, 500);
        }
    });

    // Auto-generate account number suggestion
    fields.name.addEventListener('input', function() {
        const name = this.value.trim();
        if (name && !fields.accountNumber.value) {
            const suggestion = 'CUST' + Math.floor(Math.random() * 1000).toString().padStart(3, '0');
            fields.accountNumber.placeholder = `Suggestion: ${suggestion}`;
        }
    });

    // Format telephone number
    fields.telephone.addEventListener('input', function() {
        let value = this.value.replace(/[^\d\s\-\+\(\)]/g, '');
        this.value = value;
    });

    // Auto-focus first field
    document.addEventListener('DOMContentLoaded', function() {
        fields.accountNumber.focus();
    });

    // Save draft functionality
    function saveDraft() {
        const draft = {};
        for (const fieldName in fields) {
            draft[fieldName] = fields[fieldName].value;
        }
        localStorage.setItem('customerDraft', JSON.stringify(draft));
    }

    function loadDraft() {
        const draft = localStorage.getItem('customerDraft');
        if (draft) {
            const data = JSON.parse(draft);
            for (const fieldName in data) {
                if (fields[fieldName] && !fields[fieldName].value) {
                    fields[fieldName].value = data[fieldName];
                }
            }
        }
    }

    // Load draft on page load
    loadDraft();

    // Save draft on input
    for (const fieldName in fields) {
        fields[fieldName].addEventListener('input', saveDraft);
    }

    // Clear draft on successful submission
    form.addEventListener('submit', function() {
        if (validateForm()) {
            localStorage.removeItem('customerDraft');
        }
    });
</script>
</body>
</html>