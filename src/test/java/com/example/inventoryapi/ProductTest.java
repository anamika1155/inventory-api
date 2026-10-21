package com.example.inventoryapi;

import org.junit.jupiter.api.Test;

import java.math.BigDecimal;

import static org.junit.jupiter.api.Assertions.assertEquals;

class ProductTest {
    @Test
    void productStoresItsFields() {
        Product product = new Product(
                "Keyboard", "Mechanical keyboard", new BigDecimal("79.99"));

        assertEquals("Keyboard", product.getName());
        assertEquals("Mechanical keyboard", product.getDescription());
        assertEquals(new BigDecimal("79.99"), product.getPrice());
    }
}
