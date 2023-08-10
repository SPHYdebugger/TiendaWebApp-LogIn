

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="com.svalero.DAO.Database" %>
<%@ page import="com.svalero.DAO.Buy_DAO" %>
<%@ page import="com.svalero.Domain.Buy" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>


<%@include file="includes/header.jsp"%>
<main>

  <div class="album py-5 bg-body-tertiary">
    <div class="container" style="margin-top: 50px">
        <h2 style="text-align: center;">LISTA DE COMPRAS</h2>
        <table class="table container" style="margin-top: 50px">
        <div class="container d-flex justify-content-center">
          <tr>
            <th>ID COMPRA</th>
            <th>CLIENTE</th>
            <th>PRODUCTO</th>
            <th>FECHA DE COMPRA</th>
            <th>OPCIONES</th>
          </tr>
          <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();
            List<Buy> buyList = Database.jdbi.withExtension(Buy_DAO.class, Buy_DAO::getBuys);
            for (Buy buy : buyList) {
              int idc = buy.getId_buy();
          %>
          <tr>
            <td><%= buy.getId_buy() %></td>
            <td><%= buy.getClient().getFirstName() + " " +  buy.getClient().getLastName() %></td>
            <td><%= buy.getProduct().getName_p() %></td>
            <td><%= buy.getBuyDate() %></td>
            <td>
          <a href="detailsBuy.jsp?id=<%= buy.getId_buy()%>" class="btn btn-sm btn-outline-secondary">DETALLES</a>


            </td>
          </tr>
          <% } %>
    </table>

    </div>
  </div>

</main>


<%@include file= "includes/footer.jsp" %>