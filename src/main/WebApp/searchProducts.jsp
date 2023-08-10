<%@ page import="java.util.List" %>
<%@ page import="com.svalero.Domain.Product" %>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!doctype html>
<html lang="es">

<%@ include file= "includes/header.jsp" %>

<main>



<div class="container" style="margin-top: 100px;">


          <table class="table">
              <thread>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Tamaño</th>
                    <th>Precio</th>
                    <th>DETALLES</th>
                </tr>
              </thread>

        <% for (Product product : (List<Product>)request.getAttribute("products")) { %>
            <tr>
                <td><%= product.getId_product() %></td>
                <td><%= product.getName_p() %></td>
                <td><%= product.getFormat_p() %></td>
                <td><%= product.getPrice() %></td>
                <td><a href="detailsProduct.jsp?id=<%= product.getId_product()%>&ident=<%= request.getParameter("ident") %>&user_name=<%= request.getParameter("user_name") %>" class="btn btn-sm btn-outline-secondary">VER DETALLES</a></td>
            </tr>
        <% } %>


    </table>
    <div class="container  d-flex justify-content-center">
                <a href="products.jsp?ident=<%= request.getParameter("ident") %>&user_name=<%= request.getParameter("user_name") %>" type="button" class="btn btn-primary col-4" style="margin-top: 30px; margin-bottom: 30px;">Volver a la lista de productos</a>
        </div>
 </div>
</main>

</html>

