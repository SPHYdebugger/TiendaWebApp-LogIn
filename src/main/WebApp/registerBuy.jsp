

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="com.svalero.DAO.Database" %>
<%@ page import="com.svalero.DAO.Buy_DAO" %>
<%@ page import="com.svalero.DAO.ClientDAO2" %>
<%@ page import="com.svalero.DAO.ProductDAO" %>
<%@ page import="com.svalero.Domain.Buy" %>
<%@ page import="com.svalero.Domain.Client" %>
<%@ page import="com.svalero.Domain.Product" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!doctype html>
<html lang="es">

<%@include file="includes/header.jsp"%>

<main>


     <%

         Class.forName("com.mysql.cj.jdbc.Driver");
         Database.connect();
         List<Client> clientList = Database.jdbi.withExtension(ClientDAO2.class, ClientDAO2::getClients);
         List<Product> productList = Database.jdbi.withExtension(ProductDAO.class, ProductDAO::getProducts);

     %>

    <div class="container col-6" style="margin-top: 100px;">
    <h2 style="text-align: center;">REGISTRAR UNA COMPRA</h2>
    <form action="addBuy" method="post" enctype= "multipart/form-data">
      <div class="mb-3">
        <label for="id_client" class="form-label">ID CLIENTE</label>

        <select class="form-select" id="id_client" name="id_client"  required>

           <% for (Client client : clientList)  { %>
           <option value="<%= client.getId_client() %>"><%= client.getDni() %></option>
           <% } %>

        </select>
        </div>



      <div class="mb-3">
         <label for="id_product" class="form-label">NOMBRE PRODUCTO</label>
         <select class="form-select" id="id_product" name="id_product"  required>

            <% for (Product product : productList)  { %>
            <option value="<%= product.getId_product() %>"><%= product.getName_p() %></option>
            <% } %>

         </select>
      </div>
      <div class="mb-3">
         <label for="date" class="form-label">FECHA DE COMPRA</label>
         <input type="date" class="form-control" id="date" name="date">
      </div>
      <input type="hidden" name="user_name" value="<%= request.getParameter("user_name") %>">
        <input type="hidden" name="ident" value="<%= request.getParameter("ident") %>">

        <div class="container  d-flex justify-content-center">
            <button type="submit" class="btn btn-primary">Confirmar el registro</button>
        </div>
    </form>

        <div class="container  d-flex justify-content-center">
        <a href="buysUser.jsp?ident=<%= request.getParameter("ident") %>user_name=<%= request.getParameter("user_name") %>" type="button" class="btn btn-primary col-4" style="margin-top: 20px;">Volver a la lista de compras</a>
        </div>
    </div>
</main>

<%@include file= "includes/footer.jsp" %>
