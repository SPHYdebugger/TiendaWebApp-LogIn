package com.svalero.DAO;

import com.svalero.Domain.*;

import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.svalero.DAO.Database.db;
import static com.svalero.DAO.Database.db;

public class ProductMapper implements RowMapper<Product> {

    @Override
    public Product map(ResultSet rs, StatementContext ctx) throws SQLException {


        return new Product(rs.getInt("id_product"),
                rs.getString("name_p"),
                rs.getString("description_p"),
                rs.getInt("format_p"),
                rs.getFloat("price"),
                rs.getString("image")

        );
    }
}