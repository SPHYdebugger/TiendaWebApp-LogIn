

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="com.svalero.DAO.Database" %>
<%@ page import="com.svalero.Domain.Product" %>
<%@ page import="com.svalero.DAO.ProductDAO" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<%@include file= "includes/header.jsp" %>

<main>

  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">BIENVENIDO A LA ZONA DE PRODUCTOS</h1>
        <p class="lead text-body-secondary">Por favor elige una de las siguientes opciones</p>
        <p>
        <%
              if (autorizado) {
          %>
          <a href="registerProduct.jsp?user_name=<%= request.getParameter("user_name") %>" class="btn btn-primary my-2">Registrar un producto</a>
        <%
              }
          %>
        </p>
        <form action="searchProducts" method="post" class="form-inline mx-auto" style="justify-content: center;">
          <input class="form-control mr-sm-2" name="search" method="post" type="text" id="search" placeholder="Buscar un producto" aria-label="Search">
          <input type="hidden" name="user_name" value="<%= request.getParameter("user_name") %>">
          <input type="hidden" name="ident" value="<%= request.getParameter("ident") %>">
          <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">BUSCAR</button>
        </form>
      </div>
    </div>
  </section>

   <hr class="featurette-divider">
      <h2 style="text-align: center;">LISTA DE PRODUCTOS</h2>

    <div class="album py-5 bg-body-tertiary">
      <div class="container">

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="justify-content: center;">

                  <%
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Database.connect();
                    List<Product> productList = Database.jdbi.withExtension(ProductDAO.class, ProductDAO::getProducts);
                        for (Product product:
                             productList) {
                        int idc = product.getId_product();
                  %>

          <div class="col">
            <div class="card shadow-sm h-500">
              <img src="../Tienda_data/<%= product.getImage() %>" alt="" style="">
              <div class="card-body">
              <p class="card-text">ID PRODUCTO  <%= product.getId_product() %></p>

                <b class="card-text"><%= product.getName_p() %></b>
                <p class="card-text"><%= product.getFormat_p() %> ml.</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">


                  <%
                      if (autorizado) {
                  %>
                      <a href="editProduct.jsp?id=<%= product.getId_product()%>&name_p=<%= product.getName_p()%>&description=<%= product.getDescription_p()%>&format=<%= product.getFormat_p()%>&price=<%= product.getPrice()%>&image=<%= product.getImage()%>&ident=<%= request.getParameter("ident") %>&user_name=<%= request.getParameter("user_name") %>" class="btn btn-sm btn-outline-secondary">EDITAR</a>
                      <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal<%= idc%>">BORRAR</button>
                  <%
                      }
                  %>

                    <a href="detailsProductUser.jsp?id=<%= product.getId_product()%>&ident=<%= request.getParameter("ident") %>&user_name=<%= request.getParameter("user_name") %>" class="btn btn-sm btn-outline-secondary">VER DETALLES</a>
                  </div>
                  <small class="text-body-secondary"><%= product.getPrice() %> Euros </small>
                </div>
              </div>

            </div>
          </div>
          <div class="modal fade" id="exampleModal<%= idc %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">CONFIRMACION DE BORRADO</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  ¿Seguro que desea borrar el producto?
                  Se borrarán las compras asociadas también
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                  <a href="deleteProduct?id=<%= product.getId_product()%>&user_name=<%= request.getParameter("user_name") %>" type="button" class="btn btn-primary" >Aceptar</a>
                </div>
              </div>
            </div>
          </div>

          <%
              }
           %>
        </div>
      </div>
    </div>
</main>

<%@include file= "includes/footer.jsp" %>