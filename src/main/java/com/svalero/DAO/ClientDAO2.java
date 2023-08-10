package com.svalero.DAO;

import com.svalero.Domain.Client;
import com.svalero.Domain.Client;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;


public interface ClientDAO2 {




    @SqlQuery("SELECT * FROM clients ORDER BY id_client DESC")
    @UseRowMapper(ClientMapper.class)
    List<Client> getClients();

    @SqlUpdate("INSERT INTO clients (firstname, lastname, DNI, address, city, email, password, telephone, image)" +
            " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)")
    void addClient(String firstName, String lastName, String DNI, String address, String city,
                   String email, String password, String
                           telephone, String image);

    @SqlUpdate("DELETE FROM clients WHERE DNI = ?")
    void deleteClient(String dni);

    @SqlUpdate("UPDATE clients SET firstname = ?, lastname = ?, DNI = ?," +
            "address = ?, city = ?, email = ?, password = ?, telephone = ? " +
            " WHERE ID_CLIENT= ?")
    void modifyClient(String firstName, String lastName, String DNI, String address, String city,
                   String email, String password, String telephone, int id_client);

    @SqlUpdate("UPDATE clients SET image= ? WHERE ID_CLIENT= ?")
    void modifyImageClient(String image, int id_client);

    @SqlQuery("SELECT * FROM clients WHERE DNI=?")
    @UseRowMapper(ClientMapper.class)
    Client searchClientByDNI(String dni);

    @SqlQuery("SELECT * FROM clients WHERE id_client=?")
    @UseRowMapper(ClientMapper.class)
    Client searchClient(int id_client);


    @SqlUpdate("DELETE FROM clients WHERE id_client=?")
    void deleteClient(int id);

    @SqlQuery("SELECT * FROM clients WHERE FIRSTNAME like ? or LASTNAME like ? or DNI like ?")
    @UseRowMapper(ClientMapper.class)
    List<Client> searchClientByFirstnameOrLastnameOrDni(@Bind("firstname") String firstname, @Bind("lastname") String lastname, @Bind("dni") String dni);


}
