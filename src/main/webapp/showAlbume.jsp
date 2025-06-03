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
        <link href="styles/showAlbume.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Albume</title>
	</head>
	<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
	<body>
		<%
    	String username = (String) session.getAttribute("username");
		jb.connect();
        ResultSet rset = jb.checkRole(username);
        String role = null;
        if (rset.next()) { // Verifică dacă există un rezultat
            role = rset.getString("role");
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
		        	<%if ("admin".equals(role)) {%>
			        	<form class="add-client d-flex justify-content-end" action="newAlbum.jsp" method="post">
			        		<button type="submit" class="btn btn-success"><i class="fa-solid fa-plus"></i>Adaugă înregistrare</button>
				       	</form>
			       	<%} %>
			       	<div class="table-container d-flex justify-content-center">
				       	<form class="table-form" method="post">
				    		<table class="table table-light table-striped">
						    	<tr>
						            <th class="checkbox"><b>Mark</b></th>
						            <th class="id">
						                <a href="showAlbume.jsp?sort=id&order=<%= "id".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("id".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>ID</b>
						                </a>
						            </th>
						            <th>
						                <a href="showAlbume.jsp?sort=nume_album&order=<%= "nume_album".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("nume_album".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Nume Album</b>
						                </a>
						            </th>
						            <th>
						                <a href="showAlbume.jsp?sort=artist&order=<%= "artist".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("artist".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Artist</b>
						                </a>
						            </th>
						            <th>
						                <a href="showAlbume.jsp?sort=gen_muzical&order=<%= "gen_muzical".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("gen_muzical".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Gen muzical</b>
						                </a>
						            </th>
						            <th>
						                <a href="showAlbume.jsp?sort=data_lansare&order=<%= "data_lansare".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("data_lansare".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Data lansare</b>
						                </a>
						            </th>
						            <th>
						                <a href="showAlbume.jsp?sort=pret&order=<%= "pret".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("pret".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Pret</b>
						                </a>
						            </th>
						            <th>
						                <a href="showAlbume.jsp?sort=casa_discuri&order=<%= "casa_discuri".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("casa_discuri".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Casa discuri</b>
						                </a>
						            </th>
						            <th>
						                <a href="showAlbume.jsp?sort=tip_produs&order=<%= "tip_produs".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("tip_produs".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Tip produs</b>
						                </a>
						            </th>
						            <th>
						                <a href="showAlbume.jsp?sort=stoc&order=<%= "stoc".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("stoc".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Stoc</b>
						                </a>
						            </th>
						        </tr>   
						        <%
						            jb.connect();
							        String sortColumn = request.getParameter("sort") != null ? request.getParameter("sort") : "id";
							        String sortOrder = request.getParameter("order") != null ? request.getParameter("order") : "asc";
		
							        // Protejează-te împotriva SQL Injection folosind o listă de coloane permise
							        List<String> validColumns = Arrays.asList("id", "nume_album", "artist", "gen_muzical", "data_lansare", "pret", "casa_discuri", "tip_produs", "stoc");
							        if (!validColumns.contains(sortColumn)) {
							            sortColumn = "id";
							        }
							        
						            ResultSet rs = jb.vedeTabela("tblAlbume", sortColumn, sortOrder);
						            int x;
						            while (rs.next()) {
						                x = rs.getInt("id");
						        %>
								        <tr>
								            <td class="checkbox"><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
								            <td class="id"><%= x%></td>
								            <td><%= rs.getString("nume_album") %></td>
								            <td><%= rs.getString("artist") %></td>
								            <td><%= rs.getString("gen_muzical") %></td>
								            <td><%= rs.getString("data_lansare") %></td>
								            <td><%= rs.getString("pret") %></td>
								            <td><%= rs.getString("casa_discuri") %></td>
								            <td><%= rs.getString("tip_produs") %></td>
								            <td><%= rs.getString("stoc") %></td>
								        </tr>
						        <%
						        	}
						            rs.close();
						            jb.disconnect();
						        %>
				    		</table>
				    		<br />
				    		<%if ("admin".equals(role)) {%>
							    <p align="center">
							        <button type="submit" formaction="removeAlbum.jsp" class="button btn btn-danger"><i class="fa-solid fa-trash"></i>Șterge înregistrările</button>
							        <button type="submit" formaction="modifyAlbum.jsp" class="button btn btn-primary"><i class="fa-solid fa-pen-to-square"></i>Modifică înregistrările</button>
							    </p>
						    <%} %>
						</form>
					</div>
				</div>
			</main>
		<% 	} else {
    	%>
   			<div class="error-message container-fluid d-flex flex-column justify-content-center align-items-center">
   				<img src="images/login_failed.png" alt="error-image" width="300">
   				<h1>Whoops! A apărut o eroare</h1>
   				<h5>Ne pare rău, dar nu am reușit să te conectăm. Te rugăm să verifici datele introduse.</h5>
   				<form action="index.html" method="get">
   					<button type="submit" class="btn btn-primary"><i class="fa-solid fa-backward-step"></i>ÎNAPOI</button>
   				</form>
   			</div>
    	<%
    		}
    	%>
	</body>
</html>