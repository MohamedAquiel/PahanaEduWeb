package com.pahanaedu.dao;

import com.pahanaedu.model.Customer;
import org.junit.jupiter.api.*;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class CustomerDAOTest {

    private CustomerDAO customerDAO;

    @BeforeEach
    void setUp() {
        customerDAO = new CustomerDAO();
    }

    @Test
    void testAddCustomer_andGetCustomerByAccountNumber() {
        Customer customer = new Customer();
        customer.setAccountNumber("CUST001");
        customer.setName("John Doe");
        customer.setAddress("123 Main Street");
        customer.setTelephone("1234567890");
        customer.setUnitsConsumed(150);

        boolean added = customerDAO.addCustomer(customer);
        assertTrue(added, "Customer should be added successfully");

        Customer fetched = customerDAO.getCustomerByAccountNumber("CUST001");
        assertNotNull(fetched, "Customer should be found");
        assertEquals("John Doe", fetched.getName());
    }

    @Test
    void testUpdateCustomer() {
        Customer customer = customerDAO.getCustomerByAccountNumber("CUST001");
        assertNotNull(customer, "Customer must exist before update");

        customer.setName("Updated Name");
        boolean updated = customerDAO.updateCustomer(customer);
        assertTrue(updated, "Customer should be updated");

        Customer updatedCustomer = customerDAO.getCustomerByAccountNumber("CUST001");
        assertEquals("Updated Name", updatedCustomer.getName());
    }

    @Test
    void testGetAllCustomers() {
        List<Customer> customers = customerDAO.getAllCustomers();
        assertNotNull(customers, "Customer list should not be null");
        assertTrue(customers.size() > 0, "There should be at least one customer in DB");
    }

    @Test
    void testCustomerExists() {
        boolean exists = customerDAO.customerExists("CUST001");
        assertTrue(exists, "Customer should exist in DB");

        boolean notExists = customerDAO.customerExists("NOPE123");
        assertFalse(notExists, "Customer should not exist in DB");
    }

    @Test
    void testDeleteCustomer() {
        boolean deleted = customerDAO.deleteCustomer("CUST001");
        assertTrue(deleted, "Customer should be deleted");

        Customer deletedCustomer = customerDAO.getCustomerByAccountNumber("CUST001");
        assertNull(deletedCustomer, "Customer should not be found after deletion");
    }
}
