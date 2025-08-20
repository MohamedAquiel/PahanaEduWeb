<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help - Pahana Edu Management System</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .help-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .help-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
            text-align: center;
        }

        .help-header h1 {
            margin: 0 0 0.5rem 0;
            font-size: 2.5rem;
        }

        .help-header p {
            margin: 0;
            font-size: 1.2rem;
            opacity: 0.9;
        }

        .help-content {
            padding: 2rem;
        }

        .help-nav {
            background: #f8f9fa;
            padding: 1.5rem;
            border-radius: 10px;
            margin-bottom: 2rem;
        }

        .help-nav h3 {
            margin: 0 0 1rem 0;
            color: #2c3e50;
        }

        .help-nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 0.5rem;
        }

        .help-nav a {
            color: #3498db;
            text-decoration: none;
            padding: 0.5rem;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            display: block;
        }

        .help-nav a:hover {
            background-color: #e3f2fd;
            color: #2980b9;
        }

        .help-section {
            margin-bottom: 3rem;
            padding-bottom: 2rem;
            border-bottom: 1px solid #e9ecef;
        }

        .help-section:last-child {
            border-bottom: none;
        }

        .help-section h2 {
            color: #2c3e50;
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid #3498db;
            display: inline-block;
        }

        .help-section h3 {
            color: #34495e;
            margin: 1.5rem 0 1rem 0;
        }

        .help-section p {
            line-height: 1.6;
            margin-bottom: 1rem;
            color: #555;
        }

        .help-section ul, .help-section ol {
            margin-bottom: 1rem;
            padding-left: 2rem;
        }

        .help-section li {
            margin-bottom: 0.5rem;
            line-height: 1.6;
        }

        .feature-box {
            background: #f8f9fa;
            border-left: 4px solid #3498db;
            padding: 1rem;
            margin: 1rem 0;
            border-radius: 0 5px 5px 0;
        }

        .feature-box h4 {
            margin: 0 0 0.5rem 0;
            color: #2c3e50;
        }

        .warning-box {
            background: #fff3cd;
            border-left: 4px solid #ffc107;
            padding: 1rem;
            margin: 1rem 0;
            border-radius: 0 5px 5px 0;
        }

        .warning-box h4 {
            margin: 0 0 0.5rem 0;
            color: #856404;
        }

        .step-by-step {
            background: #e8f5e8;
            border-left: 4px solid #27ae60;
            padding: 1rem;
            margin: 1rem 0;
            border-radius: 0 5px 5px 0;
        }

        .step-by-step h4 {
            margin: 0 0 0.5rem 0;
            color: #155724;
        }

        .contact-info {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            padding: 2rem;
            border-radius: 10px;
            margin-top: 2rem;
            text-align: center;
        }

        .contact-info h3 {
            color: #2c3e50;
            margin-bottom: 1rem;
        }

        .shortcut-key {
            background: #e9ecef;
            padding: 0.2rem 0.5rem;
            border-radius: 3px;
            font-family: monospace;
            font-weight: bold;
        }

        .back-to-top {
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            font-size: 1.2rem;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            transition: all 0.3s ease;
            display: none;
        }

        .back-to-top:hover {
            background: #2980b9;
            transform: translateY(-2px);
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
            <li><a href="${pageContext.request.contextPath}/item" class="nav-link">Items</a></li>
            <li><a href="${pageContext.request.contextPath}/bill" class="nav-link">Billing</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/help.jsp" class="nav-link active">Help</a></li>
            <li><a href="${pageContext.request.contextPath}/logout" class="nav-link logout">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="help-container">
        <div class="help-header">
            <h1>📚 Help & User Guide</h1>
            <p>Complete guide to using the Pahana Edu Management System</p>
        </div>

        <div class="help-content">
            <!-- Quick Navigation -->
            <div class="help-nav">
                <h3>📋 Quick Navigation</h3>
                <ul>
                    <li><a href="#getting-started">🚀 Getting Started</a></li>
                    <li><a href="#customer-management">👥 Customer Management</a></li>
                    <li><a href="#item-management">📚 Item Management</a></li>
                    <li><a href="#billing-system">🧾 Billing System</a></li>
                    <li><a href="#tips-tricks">💡 Tips & Tricks</a></li>
                    <li><a href="#troubleshooting">🔧 Troubleshooting</a></li>
                </ul>
            </div>

            <!-- Getting Started Section -->
            <section id="getting-started" class="help-section">
                <h2>🚀 Getting Started</h2>

                <h3>System Overview</h3>
                <p>The Pahana Edu Management System is designed to help manage bookshop operations including customer accounts, inventory, and billing. The system consists of four main modules:</p>

                <div class="feature-box">
                    <h4>Main Features</h4>
                    <ul>
                        <li><strong>Dashboard:</strong> Overview of business metrics and quick access to all features</li>
                        <li><strong>Customer Management:</strong> Add, edit, view, and manage customer accounts</li>
                        <li><strong>Item Management:</strong> Manage book inventory, prices, and stock levels</li>
                        <li><strong>Billing System:</strong> Generate bills, calculate charges, and print invoices</li>
                    </ul>
                </div>

                <h3>First Time Setup</h3>
                <div class="step-by-step">
                    <h4>Step-by-Step Setup</h4>
                    <ol>
                        <li>Log in using your admin credentials (username: admin, password: admin123)</li>
                        <li>Add customer information in the Customer Management section</li>
                        <li>Add book items and set inventory in the Item Management section</li>
                        <li>Start generating bills for customers using the Billing System</li>
                        <li>Monitor your business through the Dashboard</li>
                    </ol>
                </div>
            </section>

            <!-- Customer Management Section -->
            <section id="customer-management" class="help-section">
                <h2>👥 Customer Management</h2>

                <h3>Adding New Customers</h3>
                <p>To add a new customer to the system:</p>
                <ol>
                    <li>Navigate to <strong>Customers</strong> from the main menu</li>
                    <li>Click <strong>"Add New Customer"</strong></li>
                    <li>Fill in the required information:
                        <ul>
                            <li><strong>Account Number:</strong> Unique identifier (e.g., CUST001)</li>
                            <li><strong>Name:</strong> Customer's full name</li>
                            <li><strong>Address:</strong> Complete address</li>
                            <li><strong>Telephone:</strong> Contact number</li>
                            <li><strong>Units Consumed:</strong> Initial reading (usually 0)</li>
                        </ul>
                    </li>
                    <li>Click <strong>"Save Customer"</strong></li>
                </ol>

                <h3>Managing Existing Customers</h3>
                <div class="feature-box">
                    <h4>Available Actions</h4>
                    <ul>
                        <li><strong>View:</strong> See complete customer details and history</li>
                        <li><strong>Edit:</strong> Update customer information</li>
                        <li><strong>Delete:</strong> Remove customer from system (use carefully)</li>
                    </ul>
                </div>

                <div class="warning-box">
                    <h4>⚠️ Important Notes</h4>
                    <ul>
                        <li>Account numbers must be unique and cannot be changed after creation</li>
                        <li>Deleting a customer will also delete their billing history</li>
                        <li>Units consumed affects billing calculations</li>
                    </ul>
                </div>
            </section>

            <!-- Item Management Section -->
            <section id="item-management" class="help-section">
                <h2>📚 Item Management</h2>

                <h3>Adding New Items</h3>
                <p>To add books and other items to your inventory:</p>
                <ol>
                    <li>Go to <strong>Items</strong> from the main menu</li>
                    <li>Click <strong>"Add New Item"</strong></li>
                    <li>Enter item details:
                        <ul>
                            <li><strong>Item ID:</strong> Unique code (e.g., BOOK001)</li>
                            <li><strong>Item Name:</strong> Book title or product name</li>
                            <li><strong>Price:</strong> Selling price in LKR</li>
                            <li><strong>Stock:</strong> Available quantity</li>
                        </ul>
                    </li>
                    <li>Save the item</li>
                </ol>

                <h3>Stock Management</h3>
                <div class="feature-box">
                    <h4>Stock Features</h4>
                    <ul>
                        <li><strong>Low Stock Alerts:</strong> System warns when stock is below 10 units</li>
                        <li><strong>Stock Updates:</strong> Edit items to update quantities</li>
                        <li><strong>Inventory Value:</strong> Dashboard shows total inventory worth</li>
                    </ul>
                </div>

                <h3>Pricing Guidelines</h3>
                <div class="step-by-step">
                    <h4>Best Practices</h4>
                    <ul>
                        <li>Set competitive prices based on market research</li>
                        <li>Consider bulk discounts for large orders</li>
                        <li>Update prices regularly to maintain profitability</li>
                        <li>Use clear, descriptive names for easy identification</li>
                    </ul>
                </div>
            </section>

            <!-- Billing System Section -->
            <section id="billing-system" class="help-section">
                <h2>🧾 Billing System</h2>

                <h3>Generating Bills</h3>
                <p>The billing system calculates charges based on units consumed:</p>
                <ol>
                    <li>Go to <strong>Billing</strong> from the main menu</li>
                    <li>Select a customer from the dropdown</li>
                    <li>Enter or verify units consumed</li>
                    <li>Review the calculated amount</li>
                    <li>Generate and print the bill</li>
                </ol>

                <h3>Billing Calculation</h3>
                <div class="feature-box">
                    <h4>How Bills Are Calculated</h4>
                    <ul>
                        <li><strong>Base Rate:</strong> LKR 50.00 per unit</li>
                        <li><strong>Discounts:</strong>
                            <ul>
                                <li>5% discount for 20-49 units</li>
                                <li>10% discount for 50-99 units</li>
                                <li>15% discount for 100+ units</li>
                            </ul>
                        </li>
                        <li><strong>Tax:</strong> 8% tax applied to final amount</li>
                    </ul>
                </div>

                <h3>Bill Management</h3>
                <p>After generating bills, you can:</p>
                <ul>
                    <li><strong>View Bills:</strong> See all generated bills with details</li>
                    <li><strong>Print Bills:</strong> Generate printer-friendly versions</li>
                    <li><strong>Customer History:</strong> View all bills for a specific customer</li>
                    <li><strong>Revenue Reports:</strong> Track daily and monthly earnings</li>
                </ul>
            </section>

            <!-- Tips & Tricks Section -->
            <section id="tips-tricks" class="help-section">
                <h2>💡 Tips & Tricks</h2>

                <h3>Keyboard Shortcuts</h3>
                <ul>
                    <li><span class="shortcut-key">Ctrl + D</span> - Go to Dashboard</li>
                    <li><span class="shortcut-key">Ctrl + C</span> - Customer Management</li>
                    <li><span class="shortcut-key">Ctrl + I</span> - Item Management</li>
                    <li><span class="shortcut-key">Ctrl + B</span> - Billing System</li>
                    <li><span class="shortcut-key">Ctrl + H</span> - Help Page</li>
                    <li><span class="shortcut-key">Ctrl + L</span> - Logout</li>
                </ul>

                <h3>Efficiency Tips</h3>
                <div class="feature-box">
                    <h4>Work Smarter</h4>
                    <ul>
                        <li>Use consistent naming conventions for account numbers and item IDs</li>
                        <li>Regularly update stock levels to avoid overselling</li>
                        <li>Check the dashboard daily for business insights</li>
                        <li>Print bills immediately after generation for record keeping</li>
                        <li>Monitor low stock alerts to maintain inventory</li>
                    </ul>
                </div>

                <h3>Data Management</h3>
                <div class="step-by-step">
                    <h4>Best Practices</h4>
                    <ul>
                        <li>Backup your data regularly</li>
                        <li>Keep physical copies of important bills</li>
                        <li>Review customer information periodically</li>
                        <li>Update item prices based on supplier changes</li>
                        <li>Track inventory turnover rates</li>
                    </ul>
                </div>
            </section>

            <!-- Troubleshooting Section -->
            <section id="troubleshooting" class="help-section">
                <h2>🔧 Troubleshooting</h2>

                <h3>Common Issues</h3>

                <div class="warning-box">
                    <h4>Login Problems</h4>
                    <ul>
                        <li><strong>Invalid credentials:</strong> Ensure username is "admin" and password is "admin123"</li>
                        <li><strong>Session expired:</strong> Login again if you've been inactive</li>
                        <li><strong>Browser issues:</strong> Clear cache and cookies, try a different browser</li>
                    </ul>
                </div>

                <div class="warning-box">
                    <h4>Data Entry Issues</h4>
                    <ul>
                        <li><strong>Duplicate account numbers:</strong> Each customer must have a unique account number</li>
                        <li><strong>Invalid formats:</strong> Use only letters, numbers, and allowed symbols</li>
                        <li><strong>Required fields:</strong> All marked fields must be completed</li>
                    </ul>
                </div>

                <div class="warning-box">
                    <h4>Billing Problems</h4>
                    <ul>
                        <li><strong>Calculation errors:</strong> Verify units consumed and check for system updates</li>
                        <li><strong>Printing issues:</strong> Check printer connection and paper supply</li>
                        <li><strong>Missing customers:</strong> Ensure customer is added before generating bills</li>
                    </ul>
                </div>

                <h3>Getting Help</h3>
                <p>If you encounter issues not covered in this guide:</p>
                <ol>
                    <li>Check the error message for specific details</li>
                    <li>Try refreshing the page</li>
                    <li>Logout and login again</li>
                    <li>Contact system administrator if problems persist</li>
                </ol>
            </section>

            <!-- Contact Information -->
            <div class="contact-info">
                <h3>📞 Need More Help?</h3>
                <p><strong>Pahana Edu Bookshop Management System</strong></p>
                <p>System Version: 1.0.0</p>
                <p>For technical support, contact your system administrator</p>
                <p><em>This system is designed to streamline your bookshop operations efficiently and effectively.</em></p>
            </div>
        </div>
    </div>

    <!-- Back to Top Button -->
    <button class="back-to-top" onclick="scrollToTop()">↑</button>
</div>

<script>
    // Back to top functionality
    function scrollToTop() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    // Show/hide back to top button
    window.addEventListener('scroll', function() {
        const backToTop = document.querySelector('.back-to-top');
        if (window.pageYOffset > 300) {
            backToTop.style.display = 'block';
        } else {
            backToTop.style.display = 'none';
        }
    });

    // Smooth scrolling for navigation links
    document.querySelectorAll('.help-nav a').forEach(function(link) {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href').substring(1);
            const targetElement = document.getElementById(targetId);
            if (targetElement) {
                targetElement.scrollIntoView({ behavior: 'smooth' });
            }
        });
    });

    // Keyboard shortcuts
    document.addEventListener('keydown', function(e) {
        if (e.ctrlKey) {
            switch(e.key) {
                case 'd':
                    e.preventDefault();
                    window.location.href = '${pageContext.request.contextPath}/dashboard';
                    break;
                case 'c':
                    e.preventDefault();
                    window.location.href = '${pageContext.request.contextPath}/customer';
                    break;
                case 'i':
                    e.preventDefault();
                    window.location.href = '${pageContext.request.contextPath}/item';
                    break;
                case 'b':
                    e.preventDefault();
                    window.location.href = '${pageContext.request.contextPath}/bill';
                    break;
                case 'l':
                    e.preventDefault();
                    window.location.href = '${pageContext.request.contextPath}/logout';
                    break;
            }
        }
    });

    // Print functionality
    function printHelp() {
        window.print();
    }
</script>
</body>
</html>