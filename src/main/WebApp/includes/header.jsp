

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="com.svalero.DAO.Database" %>
<%@ page import="com.svalero.DAO.UserDAO" %>
<%@ page import="com.svalero.Domain.User" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<!doctype html>
<html lang="es">

  <head>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="Tienda WEB APP" content="">
    <meta name="Santiago Perez" content="">
    <link rel="icon" href="../resources/flor.png">

    <title>STETIC100 Tienda WEB </title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/carousel/">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">

    <style>
    .card img{
      height: 250px;
    }
    </style>


  </head>
 <body>

    <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top" style="padding: 5px; background-color: #EAD0D1; height: 80px; ">
        <a class="navbar-brand" href="">
          <img src="resources/logo.png" alt="" style="width: 120px; height: 80px; margin: -8%;">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto" >
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp?ident=<%= request.getParameter("ident")%>&user_name=<%= request.getParameter("user_name")%>" style="color: black;">INICIO <span class="sr-only"></span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: black;">EVENTOS</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: black;">CONTACTO</a>
            </li>
          </ul>
          <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Database.connect();



                String ident_user = request.getParameter("ident");
                User usuario = Database.jdbi.withExtension(UserDAO.class, dao -> dao.getUserByIdent(ident_user));
                boolean autorizado = false;

                if (usuario != null) {
                String ident_ok = usuario.getIdent();
                if (ident_user.equals(ident_ok)) {
                autorizado = true;

          %>
              <h2><%= request.getParameter("user_name") %></h2>
              <a href="index.jsp" type="button" class="btn btn-sm btn-outline-primary" style="margin-left: 10;" >CERRAR SESIÓN</a>
          <%
            }
              } else {
          %>
              <form action="logIn" method="post" class="form-inline mt-2 mt-md-0">
                  <input class="form-control mr-sm-2" name="user" method="post" type="text" id="user" placeholder="Usuario" aria-label="Search">
                  <input class="form-control mr-sm-2" name="password" method="post" type="password" id="password" placeholder="Contraseña" aria-label="Search">
                  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">ENTRAR</button>
                </form>
          <%
              }

          %>


        </div>
      </nav>
    </header>