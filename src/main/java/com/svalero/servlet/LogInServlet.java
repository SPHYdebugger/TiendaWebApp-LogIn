package com.svalero.servlet;

import com.svalero.DAO.*;
import com.svalero.Domain.Client;
import com.svalero.Domain.Product;
import com.svalero.Domain.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

@WebServlet("/logIn")
@MultipartConfig
public class LogInServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


        String user_name = request.getParameter("user");
        String user_password = request.getParameter("password");



        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            User user = Database.jdbi.withExtension(UserDAO.class,
                    dao -> dao.getUsers(user_name, user_password));



            if (user == null) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('EL USUARIO NO EXISTE');");
                out.println("location='index.jsp';");
                out.println("</script>");


            } else {
                String ident = user.getIdent();

                String url = "index.jsp?ident=" + ident + "&user_name=" + user_name;
                response.sendRedirect(url);
            }
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
