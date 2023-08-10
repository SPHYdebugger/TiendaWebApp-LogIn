<%@ page import="java.util.List" %>
<%@ page import="com.svalero.Domain.Client" %>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file= "includes/header.jsp" %>

<main>
    <div class="container" style="margin-top: 100px;">


          <table class="table">
              <thread>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Dirección</th>
                    <th>Teléfono</th>
                    <th>Detalles</th>
                </tr>
              </thread>

        <% for (Client client : (List<Client>)request.getAttribute("clients")) { %>
            <tr>
                <td><%= client.getId_client() %></td>
                <td><%= client.getFirstName() %> <%= client.getLastName() %></td>
                <td><%= client.getAddress() %></td>
                <td><%= client.getTelephone() %></td>
                <td><a href="detailsClient.jsp?id=<%= client.getId_client()%>&ident=<%= request.getParameter("ident") %>&user_name=<%= request.getParameter("user_name") %>" class="btn btn-sm btn-outline-secondary">VER DETALLES</a></td>
            </tr>
        <% } %>
        <div class="container  d-flex justify-content-center">
                <a href="clients.jsp?ident=<%= request.getParameter("ident") %>&user_name=<%= request.getParameter("user_name") %>" type="button" class="btn btn-primary col-4" style="margin-top: 30px; margin-bottom: 30px;">Volver a la lista de clientes</a>
        </div>


</table>
</div>
</html>

