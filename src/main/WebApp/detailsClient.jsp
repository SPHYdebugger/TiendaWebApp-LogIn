

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="com.svalero.DAO.Database" %>
<%@ page import="com.svalero.DAO.ClientDAO2" %>
<%@ page import="com.svalero.Domain.Client" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>



<%@include file= "includes/header.jsp" %>

<main>




    <%

        int clientId = Integer.parseInt(request.getParameter("id"));
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();
            Client client = Database.jdbi.withExtension(ClientDAO2.class, dao -> dao.searchClient(clientId));
    %>

        <div class="container text-center" style="margin-top: 100px;">
        <h2 style="text-align: center;">DETALLE DEL CLIENTE</h2>
            <img src="../Tienda_data/<%= client.getImage() %>" alt="" style="width: 400px; margin-bottom: 20px; border-radius: 10%;">
        </div>

    <div class="container">
        <div class="row  d-flex justify-content-center">

        <ul class="list-group col-2">
            <li class="list-group-item font-weight-bold">ID</li>
            <li class="list-group-item font-weight-bold">NOMBRE</li>
            <li class="list-group-item font-weight-bold">APELLIDOS</li>
            <li class="list-group-item font-weight-bold">DNI</li>
            <li class="list-group-item font-weight-bold">DIRECCIÓN</li>
            <li class="list-group-item font-weight-bold">CIUDAD</li>
            <li class="list-group-item font-weight-bold">MAIL</li>
            <li class="list-group-item font-weight-bold">CONTRASEÑA</li>
            <li class="list-group-item font-weight-bold">TELÉFONO</li>

        </ul>
        <ul class="list-group col-4">
              <li class="list-group-item"><%= client.getId_client() %></li>
              <li class="list-group-item"><%= client.getFirstName() %></li>
              <li class="list-group-item"><%= client.getLastName() %></li>
              <li class="list-group-item"><%= client.getDni() %></li>
              <li class="list-group-item"><%= client.getAddress() %></li>
              <li class="list-group-item"><%= client.getCity() %></li>
              <li class="list-group-item"><%= client.getEmail() %></li>
              <li class="list-group-item"><%= client.getPassword() %></li>
              <li class="list-group-item"><%= client.getTelephone() %></li>

        </ul>


        </div>
        <%
              if (autorizado) {
          %>
        <div class="container  d-flex justify-content-center" style="margin-top: 20px;">
         <a href="editClient.jsp?id=<%= client.getId_client()%>&firstName=<%= client.getFirstName()%>&lastName=<%= client.getLastName()%>&dni=<%= client.getDni()%>&address=<%= client.getAddress()%>&city=<%= client.getCity()%>&email=<%= client.getEmail()%>&password=<%= client.getPassword()%>&telephone=<%= client.getTelephone()%>&image=<%= client.getImage()%>&ident=<%= request.getParameter("ident") %>&user_name=<%= request.getParameter("user_name") %>" class="btn btn-primary col-4">EDITAR CLIENTE</a>
         </div>
         <%
             }
           %>
        <div class="container  d-flex justify-content-center">
        <a href="clients.jsp?ident=<%= request.getParameter("ident")%>&user_name=<%= request.getParameter("user_name")%>" type="button" class="btn btn-primary col-4" style="margin-top: 20px;">Volver a la lista de clientes</a>
        </div>
    </div>
</main>

<%@include file= "includes/footer.jsp" %>