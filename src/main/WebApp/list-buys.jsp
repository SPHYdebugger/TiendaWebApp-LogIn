
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ page import="com.svalero.DAO.Database" %>
<%@ page import="com.svalero.DAO.Buy_DAO" %>
<%@ page import="com.svalero.Domain.Buy" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>


<%@include file="includes/headerIndex.jsp"%>
<main>


    <table class="table container" style="margin-top: 50px">
        <div class="container d-flex justify-content-center">
      <tr>
        <th>ID</th>
        <th>STUDENT NAME</th>
        <th>SUBJECT NAME</th>
        <th>DATE OF REGISTER</th>
        <th>OPTIONS</th>
      </tr>
      <%
          Class.forName("com.mysql.cj.jdbc.Driver");
          Database.connect();
          List<Buy> buyList = Database.jdbi.withExtension(Buy_DAO.class, Buy_DAO::getBuys);
          for (Buy buy : buyList) {
            int idc = buy.getId_buy();
      %>
      <tr>
        <td><%= register.getId_register() %></td>
        <td><%= register.getStudent().getFirstName() + " " +  register.getStudent().getLastName() %></td>
        <td><%= register.getSubject().getSubjectName() %></td>
        <td><%= register.getRegisterDate() %></td>
        <td>
      <a href="detailsRegister.jsp?id=<%= register.getId_register()%>" class="btn btn-sm btn-outline-secondary">DETAILS</a>
      <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal<%= idc%>">DELETE</button>
        <div class="modal fade" id="exampleModal<%= idc%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">DELETE ALERT</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      Are you sure to delete this register?
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                      <a href="deleteRegister?id=<%= idc %>" type="button" class="btn btn-primary" >Acept</a>
                    </div>
                  </div>
                </div>
            </div>
        </td>
      </tr>
      <% } %>
    </table>
  </div>
</div>


</main>
<%@include file="includes/footer.jsp"%>