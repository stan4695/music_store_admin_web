<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Albume</title>
        <link rel="stylesheet" href="vedeTabela.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("id"));
            String nume_album = request.getParameter("nume_album");
            String artist = request.getParameter("artist");
            String gen_muzical = request.getParameter("gen_muzical");
            String data_lansare = request.getParameter("data_lansare");
            String pret = request.getParameter("pret");
            String casa_discuri = request.getParameter("casa_discuri");
            String tip_produs = request.getParameter("tip_produs");
            String stoc = request.getParameter("stoc");

            String[] valori = {nume_album, artist, gen_muzical, data_lansare, pret, casa_discuri, tip_produs, stoc};
            String[] campuri = {"nume_album", "artist", "gen_muzical", "data_lansare", "pret", "casa_discuri", "tip_produs", "stoc"};
            jb.modificaTabela("tblAlbume", "id", aux, campuri, valori);
            jb.disconnect();
            response.sendRedirect("showAlbume.jsp");
        %>
    </body>
</html>
