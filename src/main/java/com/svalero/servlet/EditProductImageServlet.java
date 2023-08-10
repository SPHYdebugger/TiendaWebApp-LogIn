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
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

@WebServlet("/editImageProduct")
@MultipartConfig
public class EditProductImageServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String imagePath = "/Users/sanph/OneDrive/Escritorio/PROGRAMACION/apache-tomcat-10.1.7/webapps/Tienda_data";
        String userName = request.getParameter("user_name");


        try {
            Part imagePart = request.getPart("image");
            String fileName;
            if (imagePart.getSize() == 0) {
                fileName = "fotoproducto.jpg";
            } else {

                fileName = UUID.randomUUID() + ".jpg";
                InputStream fileStream = imagePart.getInputStream();
                Files.copy(fileStream, Path.of(imagePath + File.separator + fileName));
            }


            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();
            Database.jdbi.withExtension(ProductDAO.class, dao -> {
                dao.modifyImageProduct(fileName, Integer.parseInt(request.getParameter("id")));
                return null;
            });

            response.sendRedirect("products.jsp?user_name=" + userName);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();

        }
    }
}
