package com.svalero.DAO;

import com.svalero.Domain.Buy;

import com.svalero.Domain.Client;
import com.svalero.Domain.Product;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.time.LocalDate;
import java.util.List;

public interface ProductDAO {


    @SqlQuery("SELECT * FROM products ORDER BY id_product DESC")
    @UseRowMapper(ProductMapper.class)
    List<Product> getProducts();

    @SqlUpdate("INSERT INTO products (name_p, description_p, format_p, price, image) VALUES (?, ?, ?, ?, ?)")
    void addProduct(String name, String description, int format, float price, String image);

    @SqlUpdate("DELETE FROM products WHERE id_product = ?")
    void deleteProduct(int id_product);


    @SqlQuery("SELECT * FROM products WHERE id_product = ?")
    @UseRowMapper(ProductMapper.class)
    Product searchProduct(int id_product);

    @SqlUpdate("UPDATE products SET name_p = ?, description_p = ?, format_p = ?," +
            "price = ? WHERE ID_PRODUCT= ?")
    void modifyProduct(String name_p, String description_p, int format_p, float price, int id_product);

    @SqlUpdate("UPDATE products SET image= ? WHERE ID_PRODUCT= ?")
    void modifyImageProduct(String image, int id_product);

    @SqlQuery("SELECT * FROM products WHERE NAME_P like ? or DESCRIPTION_P like ?")
    @UseRowMapper(ProductMapper.class)
    List<Product> searchProductByNameOrDescription(@Bind("name_p") String name_p, @Bind("description_p") String description_p);


}