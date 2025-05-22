package com.FurnitureEcommerce.service;

import java.util.List;

import com.FurnitureEcommerce.model.Productmodel;
//import com.vintique.dao.ProductDAO;
//import com.FurnitureEcommmerce.model.Productmodel;

/**
 * Service class for handling product-related business logic
 */
public class ProductService {
    private Productmodel productDAO;
    
    public ProductService() {
        this.productDAO = new Productmodel();
    }
    
    /**
     * Get all products
     * @return List of all products
     */
    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }
    
    /**
     * Get products by category
     * @param categoryId The category ID
     * @return List of products in the specified category
     */
    public List<Productmodel> getProductsByCategory(int categoryId) {
        return Productmodel.getProductsByCategory(categoryId);
    }
    
    /**
     * Get a product by its ID
     * @param productId The product ID
     * @return The product if found, null otherwise
     */
    public Productmodel getProductById(int productId) {
        return Productmodel.getProductById(productId);
    }
    
    /**
     * Search products by name
     * @param keyword The search keyword
     * @return List of products matching the keyword
     */
    public List<Productmodel> searchProducts(String keyword) {
        return Productmodel.searchProducts(keyword);
    }
    
    /**
     * Add a new product
     * @param product The product to add
     * @return true if successful, false otherwise
     */
    public boolean addProduct(Productmodel product) {
        return Productmodel.addProduct(product);
    }
    
    /**
     * Update an existing product
     * @param product The product with updated information
     * @return true if successful, false otherwise
     */
    public boolean updateProduct(Product product) {
        return productDAO.updateProduct(product);
    }
    
    /**
     * Delete a product by its ID
     * @param productId The ID of the product to delete
     * @return true if successful, false otherwise
     */
    public boolean deleteProduct(int productId) {
        return productDAO.deleteProduct(productId);
    }
    
    /**
     * Get featured products for homepage display
     * @param limit The maximum number of products to retrieve
     * @return List of featured products
     */
    public List<Product> getFeaturedProducts(int limit) {
        return productDAO.getFeaturedProducts(limit);
    }
    
    /**
     * Get products sorted by price (low to high)
     * @return List of products sorted by price
     */
    public List<Product> getProductsSortedByPriceLowToHigh() {
        return productDAO.getProductsSortedByPriceLowToHigh();
    }
    
    /**
     * Get products sorted by price (high to low)
     * @return List of products sorted by price
     */
    public List<Productmodel> getProductsSortedByPriceHighToLow() {
        return Productmodel.getProductsSortedByPriceHighToLow();
    }
    
    /**
     * Get products sorted by newest first
     * @return List of products sorted by creation date
     */
    public List<Productmodel> getProductsSortedByNewest() {
        return Productmodel.getProductsSortedByNewest();
    }
    
    /**
     * Check if a product is in stock
     * @param productId The product ID
     * @return true if in stock, false otherwise
     */
    public boolean isProductInStock(int productId) {
        Productmodel product = Productmodel.getProductById(productId);
        return product != null && product.getStockQuantity() > 0;
    }
    
    /**
     * Get product count by category
     * @param categoryId The category ID
     * @return Number of products in the specified category
     */
    public int getProductCountByCategory(int categoryId) {
        return Productmodel.getProductCountByCategory(categoryId);
    }
}