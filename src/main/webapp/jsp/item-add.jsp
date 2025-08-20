<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Item - Pahana Edu</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .add-item-header {
            background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            text-align: center;
        }

        .add-item-header h1 {
            margin: 0 0 0.5rem 0;
            font-size: 2.5rem;
        }

        .add-item-header p {
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

        .currency-input {
            position: relative;
        }

        .currency-symbol {
            position: absolute;
            left: 0.875rem;
            top: 50%;
            transform: translateY(-50%);
            color: #27ae60;
            font-weight: bold;
            pointer-events: none;
        }

        .currency-input .form-control {
            padding-left: 3rem;
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

        .price-calculator {
            background: #f8f9fa;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 1rem;
            margin-top: 1rem;
        }

        .price-calculator h5 {
            margin: 0 0 0.5rem 0;
            color: #2c3e50;
        }

        .price-row {
            display: flex;
            justify-content: space-between;
            margin: 0.25rem 0;
            font-size: 0.9rem;
        }

        .price-row.total {
            border-top: 1px solid #dee2e6;
            padding-top: 0.5rem;
            margin-top: 0.5rem;
            font-weight: bold;
            color: #27ae60;
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

            .add-item-header {
                margin: 1rem;
                padding: 1.5rem;
            }

            .add-item-header h1 {
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
    <div class="add-item-header">
        <h1>📚 Add New Item</h1>
        <p>Add a new book or educational material to your inventory</p>
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

    <!-- Add Item Form -->
    <div class="form-container">
        <form id="addItemForm" action="${pageContext.request.contextPath}/item" method="post" novalidate>
            <input type="hidden" name="action" value="add">

            <!-- Basic Information Section -->
            <div class="form-section">
                <h3 class="section-title">
                    🏷️ Basic Information
                </h3>

                <div class="form-row">
                    <div class="form-group">
                        <label for="itemId" class="required">Item ID</label>
                        <div class="input-group">
                            <span class="input-icon">🏷️</span>
                            <input type="text"
                                   id="itemId"
                                   name="itemId"
                                   class="form-control"
                                   value="<%= request.getAttribute("itemId") != null ? request.getAttribute("itemId") : "" %>"
                                   placeholder="Enter unique item ID"
                                   required
                                   maxlength="20"
                                   pattern="[A-Za-z0-9_-]+">
                        </div>
                        <div class="help-text">
                            💡 Use only letters, numbers, hyphens, and underscores (3-20 characters)
                        </div>
                        <div id="itemIdError" class="error-message">
                            ❌ <span></span>
                        </div>
                        <div class="example-box">
                            <h5>Examples:</h5>
                            <p>BOOK001, MATH_G10, SCIENCE-11</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="itemName" class="required">Item Name</label>
                        <div class="input-group">
                            <span class="input-icon">📖</span>
                            <input type="text"
                                   id="itemName"
                                   name="itemName"
                                   class="form-control"
                                   value="<%= request.getAttribute("itemName") != null ? request.getAttribute("itemName") : "" %>"
                                   placeholder="Enter item name"
                                   required
                                   maxlength="100">
                        </div>
                        <div class="help-text">
                            💡 Enter the complete name or title of the book/material
                        </div>
                        <div id="itemNameError" class="error-message">
                            ❌ <span></span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Pricing & Stock Section -->
            <div class="form-section">
                <h3 class="section-title">
                    💰 Pricing & Stock Information
                </h3>

                <div class="form-row">
                    <div class="form-group">
                        <label for="price" class="required">Price (LKR)</label>
                        <div class="currency-input">
                            <span class="currency-symbol">LKR</span>
                            <input type="number"
                                   id="price"
                                   name="price"
                                   class="form-control"
                                   value="<%= request.getAttribute("price") != null ? request.getAttribute("price") : "" %>"
                                   placeholder="0.00"
                                   required
                                   min="0.01"
                                   max="999999.99"
                                   step="0.01">
                        </div>
                        <div class="help-text">
                            💡 Enter the selling price in Sri Lankan Rupees
                        </div>
                        <div id="priceError" class="error-message">
                            ❌ <span></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="stock" class="required">Initial Stock Quantity</label>
                        <div class="input-group">
                            <span class="input-icon">📦</span>
                            <input type="number"
                                   id="stock"
                                   name="stock"
                                   class="form-control"
                                   value="<%= request.getAttribute("stock") != null ? request.getAttribute("stock") : "0" %>"
                                   placeholder="Enter stock quantity"
                                   required
                                   min="0"
                                   max="9999">
                        </div>
                        <div class="help-text">
                            💡 Number of units available for sale
                        </div>
                        <div id="stockError" class="error-message">
                            ❌ <span></span>
                        </div>
                    </div>
                </div>

                <!-- Price Calculator -->
                <div class="price-calculator" id="priceCalculator" style="display: none;">
                    <h5>💰 Inventory Value Calculator</h5>
                    <div class="price-row">
                        <span>Unit Price:</span>
                        <span id="calcUnitPrice">LKR 0.00</span>
                    </div>
                    <div class="price-row">
                        <span>Stock Quantity:</span>
                        <span id="calcQuantity">0 units</span>
                    </div>
                    <div class="price-row total">
                        <span>Total Inventory Value:</span>
                        <span id="calcTotalValue">LKR 0.00</span>
                    </div>
                </div>
            </div>

            <!-- Additional Information Section -->
            <div class="form-section">
                <h3 class="section-title">
                    📝 Additional Information
                </h3>

                <div class="form-group">
                    <label for="category">Category</label>
                    <div class="input-group">
                        <span class="input-icon">📚</span>
                        <input type="text"
                               id="category"
                               name="category"
                               class="form-control"
                               value="<%= request.getAttribute("category") != null ? request.getAttribute("category") : "" %>"
                               placeholder="Enter item category"
                               list="categoryList"
                               maxlength="50">
                        <datalist id="categoryList">
                            <option value="Textbooks">
                            <option value="Reference Books">
                            <option value="Fiction">
                            <option value="Non-Fiction">
                            <option value="Children's Books">
                            <option value="Academic">
                            <option value="Educational Materials">
                            <option value="Workbooks">
                            <option value="Study Guides">
                        </datalist>
                    </div>
                    <div class="help-text">
                        💡 Categorize the item for better organization (optional)
                    </div>
                    <div id="categoryError" class="error-message">
                        ❌ <span></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="description">Description</label>
                    <div class="input-group">
                        <span class="input-icon">📄</span>
                        <textarea id="description"
                                  name="description"
                                  class="form-control"
                                  placeholder="Enter item description (optional)"
                                  rows="4"
                                  maxlength="500"><%= request.getAttribute("description") != null ? request.getAttribute("description") : "" %></textarea>
                    </div>
                    <div class="help-text">
                        💡 Add a detailed description, author, publisher, or other relevant information
                    </div>
                    <div id="descriptionError" class="error-message">
                        ❌ <span></span>
                    </div>
                </div>
            </div>

            <!-- Form Actions -->
            <div class="form-actions">
                <button type="submit" id="submitBtn" class="btn-submit">
                    <span class="btn-text">✅ Add Item</span>
                    <span class="btn-loading">
                            <span class="spinner"></span>
                            Adding Item...
                        </span>
                </button>
                <a href="${pageContext.request.contextPath}/item" class="btn btn-secondary btn-lg">
                    ❌ Cancel
                </a>
            </div>
        </form>
    </div>
</div>

<script>
    // Form validation
    const form = document.getElementById('addItemForm');
    const submitBtn = document.getElementById('submitBtn');
    const validationSummary = document.getElementById('validationSummary');
    const validationList = document.getElementById('validationList');
    const priceCalculator = document.getElementById('priceCalculator');

    // Field references
    const fields = {
        itemId: document.getElementById('itemId'),
        itemName: document.getElementById('itemName'),
        price: document.getElementById('price'),
        stock: document.getElementById('stock'),
        category: document.getElementById('category'),
        description: document.getElementById('description')
    };

    // Validation rules
    const validationRules = {
        itemId: {
            required: true,
            minLength: 3,
            maxLength: 20,
            pattern: /^[A-Za-z0-9_-]+$/,
            message: 'Item ID must be 3-20 characters long and contain only letters, numbers, hyphens, and underscores'
        },
        itemName: {
            required: true,
            minLength: 2,
            maxLength: 100,
            message: 'Item name must be 2-100 characters long'
        },
        price: {
            required: true,
            min: 0.01,
            max: 999999.99,
            message: 'Price must be between LKR 0.01 and LKR 999,999.99'
        },
        stock: {
            required: true,
            min: 0,
            max: 9999,
            message: 'Stock must be between 0 and 9999 units'
        },
        category: {
            required: false,
            maxLength: 50,
            message: 'Category must not exceed 50 characters'
        },
        description: {
            required: false,
            maxLength: 500,
            message: 'Description must not exceed 500 characters'
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
        else if (rule.min !== undefined && parseFloat(value) < rule.min) {
            isValid = false;
            errorMessage = `${fieldName} must be at least ${rule.min}`;
        }
        else if (rule.max !== undefined && parseFloat(value) > rule.max) {
            isValid = false;
            errorMessage = `${fieldName} must not exceed ${rule.max}`;
        }
        // Pattern check
        else if (rule.pattern && value && !rule.pattern.test(value)) {
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

    // Update price calculator
    function updatePriceCalculator() {
        const price = parseFloat(fields.price.value) || 0;
        const stock = parseInt(fields.stock.value) || 0;
        const totalValue = price * stock;

        document.getElementById('calcUnitPrice').textContent = `LKR ${price.toFixed(2)}`;
        document.getElementById('calcQuantity').textContent = `${stock} units`;
        document.getElementById('calcTotalValue').textContent = `LKR ${totalValue.toFixed(2)}`;

        if (price > 0 || stock > 0) {
            priceCalculator.style.display = 'block';
        } else {
            priceCalculator.style.display = 'none';
        }
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

            // Update calculator for price and stock fields
            if (fieldName === 'price' || fieldName === 'stock') {
                updatePriceCalculator();
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

    // Auto-generate item ID suggestion
    fields.itemName.addEventListener('input', function() {
        const name = this.value.trim();
        if (name && !fields.itemId.value) {
            const suggestion = name.substring(0, 4).toUpperCase().replace(/[^A-Z0-9]/g, '') +
                Math.floor(Math.random() * 100).toString().padStart(2, '0');
            fields.itemId.placeholder = `Suggestion: ${suggestion}`;
        }
    });

    // Auto-focus first field
    document.addEventListener('DOMContentLoaded', function() {
        fields.itemId.focus();
        updatePriceCalculator();
    });

    // Save draft functionality
    function saveDraft() {
        const draft = {};
        for (const fieldName in fields) {
            draft[fieldName] = fields[fieldName].value;
        }
        localStorage.setItem('itemDraft', JSON.stringify(draft));
    }

    function loadDraft() {
        const draft = localStorage.getItem('itemDraft');
        if (draft) {
            const data = JSON.parse(draft);
            for (const fieldName in data) {
                if (fields[fieldName] && !fields[fieldName].value) {
                    fields[fieldName].value = data[fieldName];
                }
            }
            updatePriceCalculator();
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
            localStorage.removeItem('itemDraft');
        }
    });

    console.log('✅ Add item form initialized');
</script>
</body>
</html>