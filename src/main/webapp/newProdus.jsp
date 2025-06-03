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
		<title>Produse</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
           	String pretProdus;
        	String id_comanda = request.getParameter("id_comanda");
        	String id_produs = request.getParameter("id_produs");
            String cantitate = request.getParameter("cantitate");
            if (id_produs != null) {
                jb.connect();
                jb.addProdus(id_comanda,id_produs, cantitate);
                jb.disconnect();
        %>
        	<%
        	response.sendRedirect("showComenzi.jsp");
        	} else {
      
        		jb.connect();
        		ResultSet rs = jb.vedeTabela("tblAlbume");
        		
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
		                            <a class="nav-link" href="showComenzi.html"><i class="fa-solid fa-list"></i>Comenzi</a>
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
		                    <form action="newProdus.jsp" method="post" class="needs-validation" novalidate>
		                        <h5 class="form-incentive">Introdu datele în câmpurile de mai jos.</h5>		                 
		                        <div class="mb-3">
		                            <label for="idInput" class="form-label"><i class="fa-solid fa-signature"></i>ID-ul comenzii:</label>
		                            <input type="text" class="form-control" name="id_comanda" id="idInput" aria-describedby="idHelp" placeholder="ID Code" value="<%= request.getParameter("id_sel")%>" readonly>
		                        	 <div id="idHelp" class="form-text">Acest câmp este blocat!</div>
		                        </div>
		                        <div class="mb-3">
		                            <label for="subjectInput" class="form-label d-flex align-items-center"><span class="material-symbols-outlined icon-20px"></span>ID-ul produsului:</label>
		                            <select id="id_produs" name="id_produs" class="form-select" required>
								       <%
                                    while(rs.next()){
                                        String idProdus = rs.getString("id");
                                        String numeAlbum = rs.getString("nume_album");
                                        String artist = rs.getString("artist");
                                        String genMuzical = rs.getString("gen_muzical");
                                        String casaDiscuri = rs.getString("casa_discuri");
                                     	String tipProdus = rs.getString("tip_produs");
                                %>
                                    	<OPTION VALUE="<%= idProdus%>"><%= idProdus%>, <%= numeAlbum%>, <%= artist%>, <%= genMuzical %>, <%= casaDiscuri %>, <%= tipProdus %></OPTION>
                                <%
                                    }
                                %>
								    </select>
		                        </div>		                     
		                        <div class="mb-3">
		                            <label for="cantityInput" class="form-label"><i class="fa-solid fa-boxes-stacked"></i>Cantitatea:</label>
		                            <input type="number" class="form-control" name="cantitate" id="cantityInput" placeholder="Introdu cantitatea produsului" required>
		                        </div>
		                        <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i>Adaugă</button>
		                    </form>
		                </div>
		            </div>
		        </main>
        <%
            }
        %>
    </body>
</html>
