<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=groups" />
        <link href="styles/modifyClient.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Comenzi</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String[] s = request.getParameterValues("primarykey");
            if (s != null) {
                jb.connect();
                jb.stergeDateTabela(s, "tblComenzi", "id");
                jb.disconnect();
                
                // Redirect to the clienti table page
                response.sendRedirect("showComenzi.jsp");
            } else {
        %>
       		<main>
       			<div class="error-message container-fluid d-flex flex-column justify-content-center align-items-center">
       				<img src="images/error.png" alt="error-image" width="500">
       				<h1>Whoops! A apărut o eroare</h1>
       				<h5>Trebuie să selectezi o înregistrare!</h5>
       				<form action="showComenzi.jsp" method="get">
       					<button type="submit" class="btn btn-primary"><i class="fa-solid fa-backward-step"></i>ÎNAPOI</button>
       				</form>
       			</div>
       		</main>
        <% 
        	} 
        %>
    </body>
</html>
