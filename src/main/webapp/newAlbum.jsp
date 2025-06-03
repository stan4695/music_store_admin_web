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
    	if (username != null && "admin".equals(role)) { 
            String nume_album = request.getParameter("nume_album");
            String artist = request.getParameter("artist");
            String gen_muzical = request.getParameter("gen_muzical");
            String data_lansare = request.getParameter("data_lansare");
            String pret = request.getParameter("pret");
            String casa_discuri = request.getParameter("casa_discuri");
            String tip_produs = request.getParameter("tip_produs");
            String stoc = request.getParameter("stoc");
            if (nume_album != null) {
                jb.connect();
                jb.addAlbum(nume_album, artist, gen_muzical, data_lansare, pret, casa_discuri, tip_produs, stoc);
                jb.disconnect();
        %>
        	<%
        	response.sendRedirect("showAlbume.jsp");
        	} else {
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
					                        Un click, un album nou! <br> Păstrează ritmul organizării perfecte!
					                    </h1>
					               	</div>
				                    <a href="#form-section" class = "scroll-down-link"><i class="fa-solid fa-arrow-down-long"></i></a>
			              		</div>
			              	</div>
		                </div>
		                <div id="form-section" class="form">
		                    <form action="newAlbum.jsp" method="post" class="needs-validation" novalidate>
		                        <h5 class="form-incentive">Introdu datele în câmpurile de mai jos.</h5>
		                        <div class="mb-3">
		                            <label for="nameInput" class="form-label d-flex align-items-center"><span class="material-icons icon-20px">album</span>Numele albumului:</label>
		                            <input type="text" class="form-control" name="nume_album" id="nameInput" placeholder="Nume Album" required>
		                            <div class="invalid-feedback">
		                                Introdu numele albumului!
		                            </div>
		                        </div>
		                        <div class="mb-3">
		                            <label for="artistInput" class="form-label d-flex align-items-center"><span class="material-symbols-outlined icon-20px">artist</span>Numele artistului:</label>
		                            <input type="text" class="form-control" name="artist" id="artistInput" placeholder="Nume Artist" required>
		                        </div>
		                        <div class="mb-3">
		                            <label for="subjectInput" class="form-label d-flex align-items-center"><span class="material-symbols-outlined icon-20px">genres</span>Genul muzical:</label>
		                            <select id="gen_muzical" name="gen_muzical" class="form-select" required>
								        <option value="" selected>Alege un gen muzical</option>
								        <% 
								            // Lista valorilor ENUM din baza de date
								            String[] genuri = {"Pop", "Rock", "Clasic", "Reggae", "Blues", "Jazz", "Hip-Hop", "Trap", "Rap", "Folk", "Electronic"};
								            for (String genMuzical : genuri) {
								        %>
								        		<option value="<%= genMuzical %>"><%= genMuzical %></option>
								        <% 
								            }
								        %>
								    </select>
		                        </div>
		                        <div class="mb-3">
		                            <label for="dateInput" class="form-label"><i class="fa-solid fa-calendar"></i>Data lansării:</label>
		                            <input type="date" class="form-control" name="data_lansare" id="dateInput" placeholder="Introdu data lansării">
		                        </div>
		                        <div class="mb-3">
		                            <label for="priceInput" class="form-label"><i class="fa-solid fa-dollar-sign"></i>Prețul albumului:</label>
		                            <input type="text" class="form-control" name="pret" id="priceInput" placeholder="Introdu prețul albumului" required>
		                        </div>
		                        <div class="mb-3">
		                            <label for="recordInput" class="form-label"><i class="fa-solid fa-microphone-lines"></i>Casa de discuri:</label>
		                            <input type="text" class="form-control" name="casa_discuri" id="recordInput" placeholder="Introdu casa de discuri">
		                        </div>
		                        <div class="mb-3">
		                            <label for="typeInput" class="form-label"><i class="fa-solid fa-hard-drive"></i>Tipul produsului:</label>
								    <select id="typeInput" name="tip_produs" class="form-select">
								        <option value="" selected>Alege un gen muzical</option>
								        <option value="caseta">Caseta</option>
								        <option value="vinil">Vinil</option>
								        <option value="CD">CD</option>
								    </select>
		                            <%--input type="text" class="form-control" name="tip_produs" id="typeInput" placeholder="Introdu tipul produsului">--%>
		                        </div>
		                        <div class="mb-3">
		                            <label for="cantityInput" class="form-label"><i class="fa-solid fa-boxes-stacked"></i>Stocul produsului:</label>
		                            <input type="number" class="form-control" name="stoc" id="cantityInput" placeholder="Introdu stocul produsului">
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
