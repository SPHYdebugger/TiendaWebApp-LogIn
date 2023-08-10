package com.svalero.DAO;

import com.svalero.Domain.User;
import org.jdbi.v3.sqlobject.config.RegisterRowMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

@RegisterRowMapper(UserMapper.class)
public interface UserDAO {




    @SqlQuery("SELECT * FROM users WHERE user_name = ? AND user_password = ?")
    @UseRowMapper(UserMapper.class)
    User getUsers(String user_name, String password);

    @SqlQuery("SELECT * FROM users WHERE ident = ?")
    @UseRowMapper(UserMapper.class)
    User getUserByIdent(String ident);

    @SqlQuery("SELECT COUNT(*) FROM users WHERE user_name = ?")
    boolean existsUser(@Bind("user_name") String username);


}
