package com.svalero.servlet;

import com.svalero.DAO.Buy_DAO;
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

@WebServlet("/deleteProduct")
@MultipartConfig
public class DeleteProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        int id = Integer.parseInt(request.getParameter("id"));
        String userName = request.getParameter("user_name");



        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            Database.jdbi.withExtension(Buy_DAO.class, dao -> {
                dao.deleteBuyByProduct(id);
                return null;
            });

            Database.jdbi.withExtension(ProductDAO.class, dao -> {
                dao.deleteProduct(id);
                return null;
            });

            response.sendRedirect("products.jsp?user_name=" + userName);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
