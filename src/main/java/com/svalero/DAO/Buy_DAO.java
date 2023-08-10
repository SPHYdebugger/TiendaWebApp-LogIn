package com.svalero.DAO;

import com.svalero.Domain.Buy;

import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.time.LocalDate;
import java.util.List;

public interface Buy_DAO {

    @SqlQuery("SELECT * FROM buys")
    @UseRowMapper(BuyMapper.class)
    List<Buy> getBuys();

    @SqlUpdate("INSERT INTO buys (id_client, id_product, buy_date) VALUES (?, ?, ?)")
    void addBuy(int id_client, int id_product, LocalDate date);

    @SqlUpdate("DELETE FROM buys WHERE id_buy = ?")
    void deleteBuy(int id_buy);


    @SqlQuery("SELECT * FROM buys WHERE id_client = ?")
    @UseRowMapper(BuyMapper.class)
    List<Buy> searchClientBuy(int id_client);

    @SqlUpdate("DELETE FROM buys WHERE id_client = ?")
    void deleteBuyByClient(int id_client);

    @SqlQuery("SELECT * FROM buys WHERE id_buy = ?")
    @UseRowMapper(BuyMapper.class)
    Buy searchBuy(int id_buy);

    @SqlUpdate("DELETE FROM buys WHERE id_product = ?")
    void deleteBuyByProduct(int id_product);

}