package com.svalero.DAO;

import com.svalero.Domain.Client;
import com.svalero.Domain.Client;
import com.svalero.Domain.User;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements RowMapper<User> {


    @Override
    public User map(ResultSet rs, StatementContext ctx) throws SQLException {

        return new User(rs.getInt("id"),
                rs.getString("user_name"),
                rs.getString("user_password"),
                rs.getString("ident")


        );
    }
}
