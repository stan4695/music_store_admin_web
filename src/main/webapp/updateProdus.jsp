<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Produse</title>
        <link rel="stylesheet" href="vedeTabela.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("id"));
            String id_comanda = request.getParameter("id_comanda");
            String id_produs = request.getParameter("id_produs");
            String cantitate = request.getParameter("cantitate");
			
            String[] valori = {id_comanda, id_produs, cantitate};
            String[] campuri = {"id_comanda", "id_produs","cantitate"};
            jb.modificaTabela("tblProduseComenzi", "id", aux, campuri, valori);
            jb.disconnect();
            response.sendRedirect("showComenzi.jsp");
        %>
    </body>
</html>
