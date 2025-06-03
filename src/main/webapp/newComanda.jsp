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
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
       	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=artist,genres" />
       	
        <link href="styles/newClient.css" rel="stylesheet">
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
        String role = null;
        if (rset.next()) { // Verifică dacă există un rezultat
            role = rset.getString("role");
        }
        rset.close();
        jb.disconnect();
    	if (username != null && "admin".equals(role)) { 
           	int idclient;
        	String id_client = request.getParameter("id_client");
            String data_comanda = request.getParameter("data_comanda");
            String status = request.getParameter("status");
            String total_comanda = request.getParameter("total_comanda");
            if (id_client != null) {
                jb.connect();
                jb.addComanda(id_client, data_comanda, status, total_comanda);
                jb.disconnect();
        %>
        	<%
        	response.sendRedirect("showComenzi.jsp");
        	} else {
      
        		jb.connect();
        		ResultSet rs = jb.vedeTabela("tblClienti");
        		
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
        		<main>
		            <div class="form-section container-fluid d-flex flex-column flex-wrap align-items-center justify-content-center">
		                <div class="form-header container-fluid d-flex flex-column align-self-start">
			            	<div class="form-header-contrast-overlay container-fluid d-flex align-items-center">
			            		<div class="container-fluid d-flex flex-column align-items-center">
			            			<div class="container-fluid d-flex flex-row justify-content-center">
					                    <img src="images/team.png" alt="client-image" width="250">
					                    <h1 class="add-client-header align-self-center">
					                        Un click, o comandă nouă! <br> Păstrează ritmul organizării perfecte!
					                    </h1>
					               	</div>
				                    <a href="#form-section" class = "scroll-down-link"><i class="fa-solid fa-arrow-down-long"></i></a>
			              		</div>
			              	</div>
		                </div>
		                <div id="form-section" class="form">
		                    <form action="newComanda.jsp" method="post" class="needs-validation" novalidate>
		                        <h5 class="form-incentive">Introdu datele în câmpurile de mai jos.</h5>		                 
		                        <div class="mb-3">
		                            <label for="subjectInput" class="form-label d-flex align-items-center"><span class="material-symbols-outlined icon-20px"></span>ID-ul clientului:</label>
		                            <select id="id_client" name="id_client" class="form-select" required>
								       <%
                                    while(rs.next()){
                                        idclient = rs.getInt("id");
                                        String numeClient = rs.getString("nume");
                                        String emailClient = rs.getString("email");
                                     
                                %>
                                    <OPTION VALUE="<%= idclient%>"><%= idclient%>, <%= numeClient %>, <%= emailClient %></OPTION>
                                <%
                                    }
                                %>
								    </select>
		                        </div>
		                        <div class="mb-3">
		                            <label for="dateInput" class="form-label"><i class="fa-solid fa-calendar"></i>Data comenzii:</label>
		                            <input type="datetime-local" class="form-control" name="data_comanda" id="dateInput" placeholder="Introdu data comenzii">
		                        </div>
		                        <div class="mb-3">
		                            <label for="typeInput" class="form-label"><i class="fa-solid fa-hard-drive"></i>Status comanda:</label>
								    <select id="typeInput" name="status" class="form-select">
								        <option value="" selected>Introdu status-ul comenzii</option>
								        <option value="Procesata">Procesată</option>
								        <option value="Anulata">Anulată</option>
								        <option value="Livrata">Livrată</option>
									</select>		                        
		                        </div>
		                        <div class="mb-3">
		                           <label for="priceInput" class="form-label"><i class="fa-solid fa-dollar-sign"></i>Totalul comenzii:</label>
		                            <input type="text" class="form-control" name="total_comanda" id="priceInput" placeholder="Introdu totalul comenzii" required>
		                        </div>
		                        <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i>Adaugă</button>
		                    </form>
		                </div>
		            </div>
		        </main>
        <%
            }
        %>
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
