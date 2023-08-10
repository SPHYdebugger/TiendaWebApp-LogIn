<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">




<!doctype html>
<html lang="es">

<%@include file="includes/header.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<main>
    <meta charset="utf-8">
  <section class="py-5 text-center container">

  <div>
  <img src="resources/depositphotos_3955476-stock-photo-green-check-mark.jpg" alt="" style="width: 200px; margin-top: 100px;">

    <h2 style="text-align: center; color: green;">COMPRA REGISTRADA CORRECTAMENTE</h2>
    <div class="container  d-flex justify-content-center">
             <a href="buysUser.jsp?ident=<%= request.getParameter("ident") %>&user_name=<%= request.getParameter("user_name") %>" type="button" class="btn btn-primary col-4" style="margin-top: 20px;">Volver a la lista de compras</a>
             </div>
  </section>



</main>

<%@include file= "includes/footer.jsp" %>