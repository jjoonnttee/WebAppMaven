package Servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by jonas on 2016-12-13.
 */
@WebServlet(name = "SearchServlet", urlPatterns = "/Search")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Getting form data
        String search = request.getParameter("search");

        // Creating session variable
        request.getSession().setAttribute("search", search);

        // Redirect
        response.sendRedirect("/Profile");
    }


}
