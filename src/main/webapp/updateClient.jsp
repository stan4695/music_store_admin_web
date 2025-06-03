<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clienti</title>
        <link rel="stylesheet" href="vedeTabela.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("id"));
            String nume = request.getParameter("nume");
            String email = request.getParameter("email");
            String telefon = request.getParameter("telefon");
            String adresa = request.getParameter("adresa");

            String[] valori = {nume, email, telefon, adresa};
            String[] campuri = {"nume", "email", "telefon", "adresa"};
            jb.modificaTabela("tblClienti", "id", aux, campuri, valori);
            jb.disconnect();
            response.sendRedirect("showClienti.jsp");
        %>
    </body>
</html>
