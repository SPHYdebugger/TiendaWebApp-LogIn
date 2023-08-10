package com.svalero.DAO;

import com.svalero.Domain.Buy;
import com.svalero.Domain.Client;
import com.svalero.Domain.Product;
import com.svalero.Domain.Client;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;



public class BuyMapper implements RowMapper<Buy> {

    @Override
    public Buy map(ResultSet rs, StatementContext ctx) throws SQLException {


        Database.connect();
        Client client = Database.jdbi.withExtension(ClientDAO2.class,
                dao -> dao.searchClient(rs.getInt("id_client")));

        Product product = Database.jdbi.withExtension(ProductDAO.class,
                dao -> dao.searchProduct(rs.getInt("id_product")));

        return new Buy(rs.getInt("id_buy"),
                client,
                product,
                rs.getDate("buy_date").toLocalDate()
                );
    }
}
