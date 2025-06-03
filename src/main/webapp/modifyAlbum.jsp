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
        <link href="styles/modifyClient.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Albume</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
	<body>
		<%
            String s = request.getParameter("primarykey");
        	if (s != null) {
	        	jb.connect();
	            int aux = java.lang.Integer.parseInt(s);
	            ResultSet rs = jb.intoarceLinieDupaId("tblAlbume", "id", aux);
	            rs.first();
	            String nume_album = rs.getString("nume_album");
	            String artist = rs.getString("artist");
	            String gen_muzical = rs.getString("gen_muzical");
	            String data_lansare = rs.getString("data_lansare");
	            String pret = rs.getString("pret");
	            String casa_discuri = rs.getString("casa_discuri");
	            String tip_produs = rs.getString("tip_produs");
	            String stoc = rs.getString("stoc");
	            rs.close();
	            jb.disconnect();
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
					                        Modifică rapid <br> Păstrează totul în ton cu realitatea!
					                    </h1>
					               	</div>
				                    <a href="#form-section" class = "scroll-down-link"><i class="fa-solid fa-arrow-down-long"></i></a>
			              		</div>
			              	</div>
		                </div>
		                <div id="form-section" class="form">
		                    <form action="updateAlbum.jsp" method="post" class="needs-validation" novalidate>
		                        <h5 class="form-incentive">Introdu datele în câmpurile de mai jos.</h5>
		                        <div class="mb-3">
		                            <label for="idInput" class="form-label"><i class="fa-solid fa-signature"></i>ID:</label>
		                            <input type="text" class="form-control" name="id" id="idInput" aria-describedby="idHelp" placeholder="ID Code" value="<%= aux%>" readonly>
		                        	 <div id="idHelp" class="form-text">Acest câmp este blocat!</div>
		                        </div>
		                        <div class="mb-3">
		                            <label for="nameInput" class="form-label"><span class="material-icons icon-20px">album</span>Numele albumului:</label>
		                            <input type="text" class="form-control" name="nume_album" id="nameInput" placeholder="Nume Album" value="<%= nume_album%>" required>
		                            <div class="invalid-feedback">
		                                Introdu numele albumului!
		                            </div>
		                        </div>
		                        <div class="mb-3">
		                            <label for="artistInput" class="form-label"><span class="material-symbols-outlined icon-20px">artist</span>Numele artistului:</label>
		                            <input type="text" class="form-control" name="artist" id="artistInput" placeholder="Nume Artist" value="<%= artist%>" required>
		                        </div>
		                        <div class="mb-3">
		                            <label for="genreInput" class="form-label"><span class="material-symbols-outlined icon-20px">genres</span>Genul muzical:</label>
		                            <select id="genreInput" name="gen_muzical" class="form-select">
								        <option value="<%= gen_muzical %>" selected><%= gen_muzical %></option>
								        <% 
								            // Lista valorilor ENUM din baza de date
								            String[] genuri = {"Pop", "Rock", "Clasic", "Reggae", "Blues", "Jazz", "Hip-Hop", "Trap", "Rap", "Folk", "Electronic"};
								            for (String genMuzical : genuri) {
								                if (!genMuzical.equals(gen_muzical)) {
								        %>
								        			<option value="<%= genMuzical %>"><%= genMuzical %></option>
								        <% 
								                }
								            }
								        %>
								    </select>
		                            <%--<input type="text" class="form-control" name="gen_muzical" id="subjectInput" placeholder="Introdu genul muzical" value="<%= gen_muzical%>"> --%>
		                        </div>
		                        <div class="mb-3">
		                            <label for="dateInput" class="form-label"><i class="fa-solid fa-calendar"></i>Data lansării:</label>
		                            <input type="date" class="form-control" name="data_lansare" id="dateInput" placeholder="Introdu data lansării" value="<%= data_lansare%>">
		                        </div>
		                        <div class="mb-3">
		                            <label for="priceInput" class="form-label"><i class="fa-solid fa-dollar-sign"></i>Prețul albumului:</label>
		                            <input type="text" class="form-control" name="pret" id="priceInput" placeholder="Introdu prețul albumului" value="<%= pret%>" required>
		                        </div>
		                        <div class="mb-3">
		                            <label for="recordInput" class="form-label"><i class="fa-solid fa-microphone-lines"></i>Casa de discuri:</label>
		                            <input type="text" class="form-control" name="casa_discuri" id="recordInput" placeholder="Introdu casa de discuri" value="<%= casa_discuri%>">
		                        </div>
		                        <div class="mb-3">
		                            <label for="typeInput" class="form-label"><i class="fa-solid fa-hard-drive"></i>Tipul produsului:</label>
		                          	<select id="typeInput" name="tip_produs" class="form-select">
								        <option value="<%= tip_produs %>" selected><%= tip_produs.substring(0, 1).toUpperCase() + tip_produs.substring(1) %></option>
								        <% if (!"caseta".equals(tip_produs)) { %>
								            <option value="caseta">Caseta</option>
								        <% } %>
								        <% if (!"vinil".equals(tip_produs)) { %>
								            <option value="vinil">Vinil</option>
								        <% } %>
								        <% if (!"CD".equals(tip_produs)) { %>
								            <option value="CD">CD</option>
								        <% } %>
								    </select>
		                            <%--<input type="text" class="form-control" name="tip_produs" id="typeInput" placeholder="Introdu tipul produsului" value="<%= tip_produs%>"> --%>
		                        </div>
		                        <div class="mb-3">
		                            <label for="cantityInput" class="form-label"><i class="fa-solid fa-boxes-stacked"></i>Stocul produsului:</label>
		                            <input type="number" class="form-control" name="stoc" id="cantityInput" placeholder="Introdu stocul produsului" value="<%= stoc%>">
		                        </div>
		                        <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i>Modifică</button>
		                    </form>
		                </div>
		            </div>
		        </main>
		    <%     
	        } else {
        	%>
        		<main>
        			<div class="error-message container-fluid d-flex flex-column justify-content-center align-items-center">
        				<img src="images/error.png" alt="error-image" width="500">
        				<h1>Whoops! A apărut o eroare</h1>
        				<h5>Trebuie să selectezi o înregistrare!</h5>
        				<form action="showAlbume.jsp" method="get">
        					<button type="submit" class="btn btn-primary"><i class="fa-solid fa-backward-step"></i>ÎNAPOI</button>
        				</form>
        			</div>
        		</main>
	        <%
        	}
	        %>
	</body>
</html>