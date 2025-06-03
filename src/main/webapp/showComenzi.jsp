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
        <link href="styles/showComenzi.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Comenzi</title>
	</head>
	<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
	<body>
		<%
    	String username = (String) session.getAttribute("username");
		jb.connect();
        ResultSet rset = jb.checkRole(username);
        String role = null, emailUser = null;
        if (rset.next()) { // Verifică dacă există un rezultat
            role = rset.getString("role");
        	emailUser = rset.getString("email");
        }
        rset.close();
        jb.disconnect();
    	if (username != null) { 
    	%>
			<nav class="navbar navbar-expand-md navbar-light" id="navmenu">
	            <div class="container-fluid">
	                <a class="navbar-brand logo" href="home.jsp"><img src="images/logo.png" alt="" width="100"></a>
	                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	                    <span class="navbar-toggler-icon"></span>
	                </button>
	                <div class="collapse navbar-collapse" id="navbarNav">
	                    <ul class="navbar-nav">
	                        <li class="nav-item">
	                            <a class="nav-link" href="showClienti.jsp"><i class="fa-solid fa-user-group"></i>Clienți</a>
	                        </li>
	                        <li class="nav-item">
	                            <a class="nav-link" href="showComenzi.jsp"><i class="fa-solid fa-list"></i>Comenzi</a>
	                        </li>
	                        <li class="nav-item">
	                            <a class="nav-link" href="showAlbume.jsp"><i class="fa-solid fa-record-vinyl"></i>Albume</a>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </nav>
	        <main class="d-flex flex-column">
	        	<div class="main-contrast-overlay">
	        		<% if ("admin".equals(role)) {%>
			        	<form class="add-client d-flex justify-content-end" action="newComanda.jsp" method="post">
			        		<button type="submit" class="btn btn-success"><i class="fa-solid fa-plus"></i>Adaugă înregistrare</button>
				       	</form>
				   	<% } %>
			       	<div class="table-container d-flex justify-content-center">
				       	<form class="table-form" method="post">
				    		<table class="table table-light table-striped">
						    	<tr>
						            <th class="checkbox"><b>Mark</b></th>
						            <th class="id">
						                <a href="showComenzi.jsp?sort=id&order=<%= "id".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("id".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>ID</b>
						                </a>
						            </th>
						            <th>
						                <a href="showComenzi.jsp?sort=nume&order=<%= "nume".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("nume".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Numele clientului</b>
						                </a>
						            </th>
						            <th>
						                <a href="showComenzi.jsp?sort=email&order=<%= "email".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("email".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Email client</b>
						                </a>
						            </th>
						            <th>
						                <a href="showComenzi.jsp?sort=data_comanda&order=<%= "data_comanda".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("data_comanda".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Data comenzii</b>
						                </a>
						            </th>
						            <th>
						                <a href="showComenzi.jsp?sort=status&order=<%= "status".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("status".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Status</b>
						                </a>
						            </th>
						            <th>
						                <a href="showComenzi.jsp?sort=total_comanda&order=<%= "total_comanda".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("total_comanda".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Totalul comenzii ($)</b>					   
						                </a>
						            </th>
						            <th><b>Produse</b></th>
						        </tr>   
						        <%
						            jb.connect();
							        String sortColumn = request.getParameter("sort") != null ? request.getParameter("sort") : "id";
							        String sortOrder = request.getParameter("order") != null ? request.getParameter("order") : "asc";
		
							        // Protejează-te împotriva SQL Injection folosind o listă de coloane permise
							        List<String> validColumns = Arrays.asList("id", "id_client", "data_comanda", "status", "total_comanda", "nume", "email");
							        if (!validColumns.contains(sortColumn)) {
							            sortColumn = "id";
							        }
						
						            ResultSet rs = jb.vedeTabelaComenzi(sortColumn, sortOrder);
						            int x;
						            while (rs.next()) {
						                x = rs.getInt("id");
						                String email = rs.getString("email");
						                if (email.equals(emailUser) || "admin".equals(role)) {
						        %>
								        <tr>
								            <td class="checkbox"><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
								            <td class="id"><%= x%></td>
								            <td><%= rs.getString("nume") %></td>
								            <td><%= email %></td>
								            <td><%= rs.getString("data_comanda") %></td>
								            <td><%= rs.getString("status") %></td>
								            <td><%= rs.getString("total_comanda") %></td>
								           
								            <td><button type="submit" formaction="showProduse.jsp" method="post" input type="hidden" name="value" value="<%= x %>" class="button btn btn-info"><i class="fa-solid fa-eye"></i>Vizualizează produsele</button>
								        </tr>
						        <%
						                }
						        	}
						            rs.close();
						            jb.disconnect();
						        %>
				    		</table>
				    		<br />
				    		<% if ("admin".equals(role)) {%>
							    <p align="center">
							        <button type="submit" formaction="removeComanda.jsp" class="button btn btn-danger"><i class="fa-solid fa-trash"></i>Șterge înregistrările</button>
							        <button type="submit" formaction="modifyComanda.jsp" class="button btn btn-primary"><i class="fa-solid fa-pen-to-square"></i>Modifică înregistrările</button>
							    </p>
							<% } %>
						</form>
					</div>
				</div>
			</main>
	<% 	} else {
		%>
			<div class="error-message container-fluid d-flex flex-column justify-content-center align-items-center">
				<img src="images/restrictions.png" alt="error-image" width="300">
				<h1>Whoops! A apărut o eroare</h1>
				<h4>Acces restricționat: Nu deții permisiuni pentru a accesa această pagină.</h4>
				<h5> Te rugăm să contactezi administratorul pentru asistență.</h5>
				<form action="index.html" method="get">
					<button type="submit" class="btn btn-primary"><i class="fa-solid fa-backward-step"></i>ÎNAPOI</button>
				</form>
			</div>
		<%
			}
		%>
	</body>
</html>