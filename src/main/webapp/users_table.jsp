<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="Database.Users" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="Database.MyFactories" %>
<%@ page import="Database.HqlQueries" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>

    <%
        List<Users> results;
        String search = "";

        // Checking session variable
        if (request.getSession().getAttribute("search") == null) {
            search = "";
        }else {
            search = request.getSession().getAttribute("search").toString();
        }
    %>

<form id="searchBox" action="Search" method="GET">
    <input id="search" type="search" name="search" value="<%=search%>" placeholder="Sök.."/>
    <input id="search_button" type="submit" value="Sök"/>
</form>
    <%


        // Getting instances
        SessionFactory sessionFactory = MyFactories.getInstance().getSessionFactory();
        HqlQueries hql = HqlQueries.getInstance();

        // Open database connection
        Session conn = sessionFactory.openSession();
        conn.beginTransaction();

        // Creating query
        Query query = conn.createQuery(hql.getShowDatabase())
                              .setParameter("search", "%"+search+"%");

        // Query result
        results = query.getResultList();

        // Closing database connection
        conn.close();

        // Printing table header
        out.println("<table id='table1'>");
        out.println("<tr>");
        out.println("<th>Id</th>");
        out.println("<th>Namn</th>");
        out.println("<th>E-post</th>");
        out.println("<th>Behörighet</th>");

        // Printing table content
        for (int i = 0; i<results.size(); i++){
            out.println("<tr>");

            // Col Id
            out.println("<td>");
            out.println(results.get(i).getId());

            // Col Name
            out.println("<td>");
            out.println(results.get(i).getName());

            // Col Email
            out.println("<td>");
            out.println(results.get(i).getEmail());

            // Col Role
            out.println("<td>");
            out.println(results.get(i).getRole());
        }
    %>
</table>
