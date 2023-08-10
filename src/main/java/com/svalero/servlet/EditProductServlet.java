package com.svalero.servlet;

import com.svalero.DAO.ClientDAO2;
import com.svalero.DAO.Database;
import com.svalero.DAO.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/editProduct")
@MultipartConfig
public class EditProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String imagePath = "/Users/sanph/OneDrive/Escritorio/PROGRAMACION/apache-tomcat-10.1.7/webapps/Tienda_data";

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name_p");
        String description = request.getParameter("description");
        int format = Integer.parseInt(request.getParameter("format"));
        float price = Float.parseFloat(request.getParameter("price"));

        String userName = request.getParameter("user_name");
        String ident = request.getParameter("ident");


        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();
            Database.jdbi.withExtension(ProductDAO.class, dao -> {
                dao.modifyProduct(name, description, format, price, id);
                return null;
            });
            response.sendRedirect("products.jsp?ident=" + ident + "&user_name=" + userName);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
