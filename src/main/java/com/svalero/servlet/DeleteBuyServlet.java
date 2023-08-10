package com.svalero.servlet;

import com.svalero.DAO.Buy_DAO;
import com.svalero.DAO.ClientDAO2;
import com.svalero.DAO.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteBuy")
@MultipartConfig
public class DeleteBuyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        int id = Integer.parseInt(request.getParameter("id"));
        String userName = request.getParameter("user_name");
        String ident = request.getParameter("ident");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            Database.jdbi.withExtension(Buy_DAO.class, dao -> {
                dao.deleteBuy(id);
                return null;
            });

            response.sendRedirect("buysUser.jsp?ident=" + ident + "&user_name=" + userName);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
