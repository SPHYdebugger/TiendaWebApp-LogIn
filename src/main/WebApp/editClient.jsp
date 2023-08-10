

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="com.svalero.DAO.Database" %>
<%@ page import="com.svalero.DAO.ClientDAO2" %>
<%@ page import="com.svalero.Domain.Client" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>



<%@include file= "includes/header.jsp" %>

<main>

  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">BIENVENIDO A LA ZONA DE CLIENTES</h1>
        <p class="lead text-body-secondary">Por favor elige una de las siguientes opciones</p>
        <p>
          <a href="registerClient.jsp?user_name=<%= request.getParameter("user_name") %>" class="btn btn-primary my-2">Registrar un cliente</a>

        </p>
      </div>
    </div>
  </section>

  <hr class="featurette-divider">
    <h2 style="text-align: center;">MODIFICAR EL CLIENTE</h2>
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
                     <form action="editImageClient" method="post" enctype= "multipart/form-data">
                     <div style="margin-bottom: 20px;">

                                 <input type="text" class="form-control" id="id" name="id" value='<%= request.getParameter("id") %>' hidden>
                                 <input type="hidden" name="user_name" value="<%= request.getParameter("user_name") %>">

                                 <input type="file" class="form-control" id="image" name="image">
                     </div>
                     <div class="modal-footer">
                                  <button type="submit" class="btn btn-primary">Confirmar el cambio</button>
                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>

                      </div>
                     </form>

                  </div>

                </div>
              </div>
            </div>


    <div class="container col-6">


    <form action="editClient" method="post" enctype= "multipart/form-data">
      <div class="mb-3">
              <label for="id" class="form-label">ID</label>
              <input type="text" class="form-control" id="id" name="id" value='<%= request.getParameter("id") %>'>
            </div>
      <div class="mb-3">
        <label for="firstName" class="form-label">NOMBRE</label>
        <input type="text" class="form-control" id="firstName" name="firstName" value='<%= request.getParameter("firstName") %>'>
      </div>
      <div class="mb-3">
        <label for="lastName" class="form-label">APELLIDOS</label>
        <input type="text" class="form-control" id="lastName" name="lastName" value='<%= request.getParameter("lastName") %>'>
      </div>
      <div class="mb-3">
         <label for="dni" class="form-label">DNI</label>
         <input type="text" class="form-control" id="dni" name="dni" value='<%= request.getParameter("dni") %>'>
      </div>
      <div class="mb-3">
          <label for="address" class="form-label">DIRECCIÓN</label>
          <input type="text" class="form-control" id="address" name="address" value='<%= request.getParameter("address") %>'>
      </div>
      <div class="mb-3">
           <label for="city" class="form-label">CIUDAD</label>
           <input type="text" class="form-control" id="city" name="city" value='<%= request.getParameter("city") %>'>
      </div>
      <div class="mb-3">
           <label for="email" class="form-label">EMAIL</label>
           <input type="email" class="form-control" id="email" name="email" value='<%= request.getParameter("email") %>'>
      </div>
      <div class="mb-3">
            <label for="password" class="form-label">CONTRASEÑA</label>
            <input type="password" class="form-control" id="password" name="password" value='<%= request.getParameter("password") %>'>
      </div>
      <div class="mb-3">
            <label for="telephone" class="form-label">TELEFONO</label>
            <input type="text" class="form-control" id="telephone" name="telephone" value='<%= request.getParameter("telephone") %>'>
      </div>
        <input type="hidden" name="user_name" value="<%= request.getParameter("user_name") %>">
        <input type="hidden" name="ident" value="<%= request.getParameter("ident") %>">


        <div class="container  d-flex justify-content-center">
            <button type="submit" class="btn btn-primary">Confirmar el registro</button>
        </div>
    </form>

        <div class="container  d-flex justify-content-center">
        <a href="clients.jsp?ident=<%= request.getParameter("ident")%>&user_name=<%= request.getParameter("user_name")%>" type="button" class="btn btn-primary col-4" style="margin-top: 20px;">Volver a la lista de clientes</a>
        </div>
    </div>
</main>

<%@include file= "includes/footer.jsp" %>