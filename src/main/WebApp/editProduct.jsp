

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="com.svalero.DAO.Database" %>

<%@ page import="com.svalero.Domain.Product" %>
<%@ page import="com.svalero.DAO.ProductDAO" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!doctype html>
<html lang="es">

<%@include file= "includes/header.jsp" %>

<main>


  <hr class="featurette-divider">
    <h2 style="text-align: center;">MODIFICAR EL PRODUCTO</h2>
        <div class="container text-center">
            <img src="../Tienda_data/<%= request.getParameter("image")%>" alt="" style="width: 400px; margin-bottom: 20px; border-radius: 10%;">

        </div>

        <div class="container text-center">
            <button type="button" class="btn btn-sm btn-outline-secondary " data-bs-toggle="modal" data-bs-target="#changeImage">Click aquí para modificar la foto</button>
        </div>


     <div class="modal fade" id="changeImage" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">CAMBIAR IMAGEN DE CLIENTE</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    Elija la nueva imagen
                     <form action="editImageProduct" method="post" enctype= "multipart/form-data">
                     <div style="margin-bottom: 20px;">
                                <input type="hidden" name="user_name" value="<%= request.getParameter("user_name") %>">
                                 <input type="text" class="form-control" id="id" name="id" value='<%= request.getParameter("id") %>' hidden>
                                 <input type="file" class="form-control" id="image" name="image">
                     </div>
                     <div class="container  d-flex justify-content-center">
                                 <button type="submit" class="btn btn-primary">Confirmar el cambio</button>
                             </div>
                     </form>

                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>

                  </div>
                </div>
              </div>
            </div>


    <div class="container col-6">


    <form action="editProduct" method="post" enctype= "multipart/form-data">
      <div class="mb-3">
              <label for="id" class="form-label">ID</label>
              <input type="text" class="form-control" id="id" name="id" value='<%= request.getParameter("id") %>'>
            </div>
      <div class="mb-3">
        <label for="name_p" class="form-label">NOMBRE</label>
        <input type="text" class="form-control" id="name_p" name="name_p" value='<%= request.getParameter("name_p") %>'>
      </div>
      <div class="mb-3">
        <label for="description" class="form-label">DESCRIPCIÓN</label>
        <input type="text" class="form-control" id="description" name="description" value='<%= request.getParameter("description") %>'>
      </div>
      <div class="mb-3">
         <label for="format" class="form-label">FORMATO ml.</label>
         <input type="text" class="form-control" id="format" name="format" value='<%= request.getParameter("format") %>'>
      </div>
      <div class="mb-3">
          <label for="price" class="form-label">PRECIO euros</label>
          <input type="text" class="form-control" id="price" name="price" value='<%= request.getParameter("price") %>'>
      </div>
      <input type="hidden" name="user_name" value="<%= request.getParameter("user_name") %>">
      <input type="hidden" name="ident" value="<%= request.getParameter("ident") %>">





        <div class="container  d-flex justify-content-center">
            <button type="submit" class="btn btn-primary">Confirmar el registro</button>
        </div>
    </form>

        <div class="container  d-flex justify-content-center">
        <a href="productsUser.jsp?user_name=<%= request.getParameter("user_name") %>" type="button" class="btn btn-primary col-4" style="margin-top: 20px;">Volver a la lista de productos</a>
        </div>
    </div>
</main>

<%@include file= "includes/footer.jsp" %>