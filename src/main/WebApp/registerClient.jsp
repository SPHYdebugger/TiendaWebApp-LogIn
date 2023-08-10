

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="com.svalero.DAO.Database" %>
<%@ page import="com.svalero.DAO.ClientDAO2" %>
<%@ page import="com.svalero.Domain.Client" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>

<%@include file="includes/header.jsp"%>

<main>

  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">BIENVENIDO A LA ZONA DE CLIENTES</h1>

      </div>
    </div>
  </section>

  <hr class="featurette-divider">
    <h2 style="text-align: center;">REGISTRO DE CLIENTE</h2>


    <div class="container col-6">
    <form action="addClient" method="post" enctype= "multipart/form-data">
      <div class="mb-3">
        <label for="firstName" class="form-label">NOMBRE</label>
        <input type="text" class="form-control" id="firstName" name="firstName">
      </div>
      <div class="mb-3">
        <label for="lastName" class="form-label">APELLIDOS</label>
        <input type="text" class="form-control" id="lastName" name="lastName">
      </div>
      <div class="mb-3">
         <label for="dni" class="form-label">DNI</label>
         <input type="text" class="form-control" id="dni" name="dni">
      </div>
      <div class="mb-3">
          <label for="address" class="form-label">DIRECCIÓN</label>
          <input type="text" class="form-control" id="address" name="address">
      </div>
      <div class="mb-3">
           <label for="city" class="form-label">CIUDAD</label>
           <input type="text" class="form-control" id="city" name="city">
      </div>
      <div class="mb-3">
           <label for="email" class="form-label">EMAIL</label>
           <input type="email" class="form-control" id="email" name="email">
      </div>
      <div class="mb-3">
            <label for="password" class="form-label">CONTRASEÑA</label>
            <input type="password" class="form-control" id="password" name="password">
      </div>
      <div class="mb-3">
            <label for="telephone" class="form-label">TELEFONO</label>
            <input type="text" class="form-control" id="telephone" name="telephone">
      </div>
      <div style="margin-bottom: 20px;">
            <label for="image" class="form-label">Imagen</label>
            <input type="file" class="form-control" id="image" name="image">
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