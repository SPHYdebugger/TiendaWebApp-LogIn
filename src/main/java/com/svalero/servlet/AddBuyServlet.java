package com.svalero.servlet;

import com.svalero.DAO.Buy_DAO;
import com.svalero.DAO.ClientDAO2;
import com.svalero.DAO.Database;
import com.svalero.DAO.ProductDAO;
import com.svalero.Domain.Client;
import com.svalero.Domain.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

@WebServlet("/addBuy")
@MultipartConfig
public class AddBuyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


        int id_client = Integer.parseInt(request.getParameter("id_client"));
        int id_product = Integer.parseInt(request.getParameter("id_product"));
        String date = request.getParameter("date");
        LocalDate localDate = LocalDate.parse(date);
        String userName = request.getParameter("user_name");
        String ident = request.getParameter("ident");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            Client client = Database.jdbi.withExtension(ClientDAO2.class,
                    dao -> dao.searchClient(id_client));


            Product product = Database.jdbi.withExtension(ProductDAO.class,
                    dao -> dao.searchProduct(id_product));




            if (client == null) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('EL CLIENTE NO EXISTE');");
                out.println("location='registerBuy.jsp';");
                out.println("</script>");

            } else if (product == null) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('EL PRODUCTO NO EXISTE');");
                out.println("location='registerBuy.jsp';");
                out.println("</script>");

            } else {
                Database.jdbi.withExtension(Buy_DAO.class, dao -> {
                    dao.addBuy(id_client, id_product, localDate);
                    return null;
                });
                response.sendRedirect("buyOk.jsp?ident=" + ident + "&user_name=" + userName);

            }
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
