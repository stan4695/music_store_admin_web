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
		<title>Produse</title>
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
	        		<% if ("admin".equals(role)) {%>
			        	<form class="add-client d-flex justify-content-end" action="newProdus.jsp" method="post">
			        		<input type="hidden" name="id_sel" value="<%= request.getParameter("value") %>">
			        		<button type="submit" class="btn btn-success"><i class="fa-solid fa-plus"></i>Adaugă înregistrare</button>
				       	</form>
			       	<% } %>
			       	<div class="table-container d-flex justify-content-center">
				       	<form class="table-form" method="post">
				    		<table class="table table-light table-striped">
						    	<tr>
						            <th class="checkbox"><b>Mark</b></th>
						            
						              <th>
						                <a href="showProduse.jsp?sort=id_comanda&order=<%= "id_comanda".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("id_comanda".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>ID-ul comenzii</b>
						                </a>
						            </th>
						            <th>
						                <a href="showProduse.jsp?sort=id_produs&order=<%= "id_produs".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("id_produs".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>ID-ul albumului</b>
						                </a>
						            </th>
						           <th>
						                <a href="showProduse.jsp?sort=nume_album&order=<%= "nume_album".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("nume_album".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Numele albumului</b>
						                </a>
						            </th>
						            
						            <th>
						                <a href="showProduse.jsp?sort=artist&order=<%= "artist".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("artist".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Artist</b>
						                </a>
						            </th>
						            
						            <th>
						                <a href="showProduse.jsp?sort=gen_muzical&order=<%= "gen_muzical".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("gen_muzical".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Gen muzical</b>
						                </a>
						            </th>
						            
						            <th>
						                <a href="showProduse.jsp?sort=data_lansare&order=<%= "data_lansare".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("data_lansare".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Data lansare</b>
						                </a>
						            </th>
						            
						            <th>
						                <a href="showProduse.jsp?sort=tip_produs&order=<%= "tip_produs".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("tip_produs".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Tip produs</b>
						                </a>
						            </th>
						            
						            <th>
						                <a href="showProduse.jsp?sort=pret&order=<%= "pret".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("pret".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Pret ($)</b>
						                </a>
						            </th>					            
						            
						           <th>
						                <a href="showProduse.jsp?sort=stoc&order=<%= "cantitate".equals(request.getParameter("sort")) && "asc".equals(request.getParameter("order")) ? "desc" : "asc" %>">
						                    <% if ("cantitate".equals(request.getParameter("sort"))) { %>
						                        <i class="fa-solid fa-arrow-<%= "asc".equals(request.getParameter("order")) ? "up" : "down" %>"></i>
						                    <% } %>
						                    <b>Cantitate</b>
						                </a>
						            </th>
						            
						            <th>Pret final ($)</th>
						        </tr>   
						       
						        <%
						            jb.connect();
							        String sortColumn = request.getParameter("sort") != null ? request.getParameter("sort") : "id";
							        String sortOrder = request.getParameter("order") != null ? request.getParameter("order") : "asc";
		
							        // Protejează împotriva SQL Injection folosind o listă de coloane permise
							        List<String> validColumns = Arrays.asList("id","id_comanda", "id_produs", "cantitate", "nume_album", "artist", "gen_muzical", "data_lansare", "tip_produs", "pret", "cantitate");
							        if (!validColumns.contains(sortColumn)) {
							            sortColumn = "id";
							        }
							        
							        String idSel = request.getParameter("value"); 						      
						            ResultSet rs = jb.vedeInterogare(idSel, sortColumn, sortOrder);
						            int x;
						            while (rs.next()) {
						                x = rs.getInt("id");
						                float pretFinalProdus = rs.getFloat("cantitate") * rs.getFloat("pret");
						                int id_comanda = rs.getInt("id_comanda");
						        %>
								        <tr>
								            <td class="checkbox"><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
								            <td><%= rs.getString("id_comanda") %></td>
								            <td><%= rs.getString("id_produs") %></td>
								            <td><%= rs.getString("nume_album") %></td>
								            <td><%= rs.getString("artist") %></td>
								            <td><%= rs.getString("gen_muzical") %></td>
								            <td><%= rs.getString("data_lansare") %></td>
								            <td><%= rs.getString("tip_produs") %></td>							            
								            <td><%= rs.getFloat("pret") %></td>							            							            
								            <td><%= rs.getFloat("cantitate") %></td>
								            <td><%= pretFinalProdus %></td>
								        </tr>
						        <%
							            String[] valori = {String.valueOf(pretFinalProdus)};
							            String[] campuri = {"pretFinal"};
							            jb.modificaTabela("tblProduseComenzi", "id", x, campuri, valori);
							            ResultSet rs2 = jb.showTotalComanda(String.valueOf(id_comanda));
							            String totalComanda = null;
							            while (rs2.next()) {
							            	totalComanda = rs2.getString("totalComanda");
							            }
							            String[] valori1 = {totalComanda};
							            String[] campuri1 = {"total_comanda"};
							            jb.modificaTabela("tblComenzi", "id", id_comanda, campuri1, valori1);
						        	}
						            rs.close();
						            jb.disconnect();
						           
						        %>
				    		</table>
				    		<br />
				    		<% if ("admin".equals(role)) {%>
							    <p align="center">
							        <button type="submit" formaction="removeProdus.jsp" class="button btn btn-danger"><i class="fa-solid fa-trash" ></i>Șterge înregistrările</button>
							        <button type="submit" formaction="modifyProdus.jsp" class="button btn btn-primary"><i class="fa-solid fa-pen-to-square" ></i>Modifică înregistrările</button>
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