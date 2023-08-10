

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@include file="includes/headerIndex.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<main>
    <meta charset="utf-8">
  <section class="py-5 text-center container">

  <div>
  <img src="resources/error_15261.png" alt="" style="width: 200px; margin-top: 100px;">

    <h2 style="text-align: center; color: green;">HA HABIDO ALGÚN ERROR EN LOS DATOS</h2>
    <h2 style="text-align: center; color: green;">POR FAVOR REVÍSALOS </h2>
    <div class="container  d-flex justify-content-center">
             <a href="goBack()" type="button" class="btn btn-primary col-4" style="margin-top: 20px;">Volver a la lista de clientes</a>
             </div>
  </section>



<script>
function goBack() {
  window.history.back();
}
</script>


</main>

<%@include file= "includes/footer.jsp" %>