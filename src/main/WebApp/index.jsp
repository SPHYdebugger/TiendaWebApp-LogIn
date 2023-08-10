<%@include file="includes/header.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

    <main role="main" >

      <div id="myCarousel" class="carousel slide" data-ride="carousel" >
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" style="padding-top: 80px;" >
          <div class="carousel-item active">
            <img class="first-slide" src="resources/ritual-spa-masaje-relajante-estetica-rosi.jpg" alt="First slide" style="width: 100%; max-height: 500px;">
            <div class="container">
              <div class="carousel-caption text-right" >
                <h1 style="color: black;">Masajes relajantes</h1>
                <b style="color: black;">Este mes en nuestro centro tenemos descuento en masajes. VEN, NO TE LOS PUEDES PERDER</b>
                <p><a class="btn btn-lg btn-primary" href="#" role="button">+ INFO</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="second-slide" src="resources/INR-Tractaments-Inj-54-1024x682.jpg" alt="Second slide" style="width: 100%; max-height: 500px;">
            <div class="container">
              <div class="carousel-caption text-right">
                <h1 style="color: black;">Somos un centro de estética también para hombres</h1>
                <b style="color: black;">Tenemos muchos tratamientos adapatados también para vosotros. NO LO DUDES Y CUÍDATE</b>
                <p><a class="btn btn-lg btn-primary" href="#" role="button">+ INFO</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="third-slide" src="resources/presume-de-figura-con-nuestros-tratamientos-de-estetica-corporal_mini.jpg" alt="Third slide" style="width: 100%; max-height: 500px;">
            <div class="container">
              <div class="carousel-caption text-left">
                <h1 style="color: black;">Tenemos nutricionistas propios</h1>
                <b style="color: black;">Si lo que quieres es perder esos kilos que te sobran, ven a nuestro centro. THE SUMMER IS COMMING</b>
                <p><a class="btn btn-lg btn-primary" href="#" role="button">+ INFO</a></p>
              </div>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev" >
          <span class="carousel-control-prev-icon" aria-hidden="true" ></span>
          <span class="sr-only" >Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>



      <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row" style="text-align: center; margin-top: 30px; margin-bottom: 30px;">
          <div class="col-lg-4">
            <img class="rounded-circle" src="resources/cliente.png" alt="Generic placeholder image" width="140" height="140">
            <h2>CLIENTES</h2>
            <p>Entra para registrar un cliente nuevo, editar o borrar uno existente, listarlos a todos o buscar uno</p>
            <p><a class="btn btn-secondary" href="clients.jsp?ident=<%= request.getParameter("ident")%>&user_name=<%= request.getParameter("user_name")%>" role="button">ENTRAR &raquo;</a></p>

          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="resources/productos.png" alt="Generic placeholder image" width="140" height="140">
            <h2>PRODUCTOS</h2>
            <p>Entra para registrar un producto nuevo, editar o borrar uno existente, listarlos a todos o buscar uno</p>
            <p><a class="btn btn-secondary" href="products.jsp?ident=<%= request.getParameter("ident")%>&user_name=<%= request.getParameter("user_name")%>" role="button">ENTRAR &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="resources/compras.png" alt="Generic placeholder image" width="140" height="140">
            <h2>COMPRAS</h2>
            <p>Entra para registrar una compra nueva, editar o borrar una existente, listarlas a todas o buscar una</p>
            <%
                  if (autorizado) {
              %>
            <p><a class="btn btn-secondary" href="buysUser.jsp?ident=<%= request.getParameter("ident")%>&user_name=<%= request.getParameter("user_name")%>" role="button">ENTRAR &raquo;</a></p>
            <%
                } else {
            %>
            <p><a class="btn btn-secondary" href="buys.jsp?ident=<%= request.getParameter("ident")%>&user_name=<%= request.getParameter("user_name")%>" role="button">ENTRAR &raquo;</a></p>
            <%
                }
            %>
          </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->


        <div class="row featurette" style="margin-top: 30px; margin-bottom: 30px;">
          <hr class="featurette-divider">
          <hr class="featurette-divider">
          <h2 style="text-align: center;">PRÓXIMOS EVENTOS</h2>
          <hr class="featurette-divider">
          <div class="col-md-7">
            <h2 class="featurette-heading">EVENTO MAQUILLAJE FIESTA <span class="text-muted"></span></h2>
            <p class="lead">Evento para aprender a sacarte el mejor partido. Te enseñaremos los mejores trucos de maquillaje y los mejores productos para cada tipo de cara y piel</p>
            <p class="lead">DÍA: 15/04/2023</p>
            <p class="lead">HORA: 12:00</p>
            <p class="lead">LUGAR: Nuestro centro de Madrid</p>
          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" src="resources/evento maquillaje.jpg" alt="Generic placeholder image">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7 order-md-2">
            <h2 class="featurette-heading">EVENTO CUIDADO DE CARA PARA HOMRES<span class="text-muted">.</span></h2>
            <p class="lead">Aprende a cuidar la piel de la cara como se merece. Para disimular los rasgos de la edad y sacarte unos añitos de encima</p>
            <p class="lead">DÍA: 24/04/2023</p>
            <p class="lead">HORA: 12:00</p>
            <p class="lead">LUGAR: Nuestro centro de Zaragoza</p>
          </div>
          <div class="col-md-5 order-md-1">
            <img class="featurette-image img-fluid mx-auto" src="resources/evento hombres.jpg" alt="Generic placeholder image">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">EVENTO AMWC JAPAN<span class="text-muted"></span></h2>
            <p class="lead">Nuestros amigos de AMWC nos traerán los mejores productos ANTI-AGE, para reparar las marcas de la edad y volver a lucir una piel joven</p>
            <p class="lead">DÍA: 02/05/2023</p>
            <p class="lead">HORA: 12:00</p>
            <p class="lead">LUGAR: Nuestro centro de Vigo</p>
          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" src="resources/evento antiedad.jpg" alt="Generic placeholder image">
          </div>
        </div>

        <hr class="featurette-divider">

      </div><!-- /.container -->



    </main>

<%@include file= "includes/footer.jsp" %>
