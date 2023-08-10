package com.svalero.DAO;

import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapperBoolean implements RowMapper<Boolean> {
    @Override
    public Boolean map(ResultSet rs, StatementContext ctx) throws SQLException {
        return rs.getInt(1) > 0;
    }
}

