

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="com.svalero.DAO.Database" %>
<%@ page import="com.svalero.DAO.Buy_DAO" %>
<%@ page import="com.svalero.Domain.Buy" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>


<!doctype html>
<html lang="es">

<%@include file="includes/header.jsp"%>

<main>

    <section class="py-5 text-center container">
        <div class="row py-lg-5">
          <div class="col-lg-6 col-md-8 mx-auto">
            <h1 class="fw-light">BIENVENIDO A LA ZONA DE COMPRAS</h1>
            <p class="lead text-body-secondary">Aqui puedes ver todos los datos de las compras existentes o registrar una nueva</p>
            <p>
              <a href="registerBuy.jsp?ident=<%= request.getParameter("ident") %>&user_name=<%= request.getParameter("user_name") %>" class="btn btn-primary my-2">Registrar una compra</a>


            </p>
          </div>
        </div>
      </section>



  <div class="album py-5 bg-body-tertiary">
    <div class="container">
        <h2 style="text-align: center;">LISTA DE COMPRAS</h2>
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="justify-content: center;">

                <%
                  Class.forName("com.mysql.cj.jdbc.Driver");
                  Database.connect();
                  List<Buy> buyList = Database.jdbi.withExtension(Buy_DAO.class, Buy_DAO::getBuys);
                      for (Buy buy:
                           buyList) {
                  int idc = buy.getId_buy();
                %>

        <div class="col">
          <div class="card shadow-sm h-500">
            <div class="card-body">
              <b class="card-text">ID DE COMPRA = <%= buy.getId_buy() %></b>
              <p class="card-text">CLIENTE = <%= buy.getClient().getFirstName() + " " +  buy.getClient().getLastName()%></p>
              <p class="card-text">PRODUCTO = <%= buy.getProduct().getName_p() %></p>

              <p class="card-text">FECHA DE COMPRA = <%= buy.getBuyDate() %></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">

                  <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal<%= idc%>">BORRAR</button>
                  <div class="modal fade" id="exampleModal<%= idc%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel">CONFIRMACION DE BORRADO</h5>
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                  ¿Seguro que desea borrar la compra?
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                  <a href="deleteBuy?id=<%= idc %>&ident=<%= request.getParameter("ident") %>&user_name=<%= request.getParameter("user_name") %>" type="button" class="btn btn-primary" >Aceptar</a>
                                </div>
                              </div>
                            </div>
                  </div>
                  <a href="detailsBuyUser.jsp?id=<%= buy.getId_buy()%>&ident=<%= request.getParameter("ident") %>&user_name=<%= request.getParameter("user_name") %>" class="btn btn-sm btn-outline-secondary">VER DETALLES</a>
                </div>
                <small class="text-body-secondary"> </small>
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