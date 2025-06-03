<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ro">
    <head>
        <meta charset="UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=groups" />
        <link href="styles/home.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Music Store • Homepage</title>
    </head>
    
    <body>
    	<%
    	String username = (String) session.getAttribute("username");
    	if (username != null) { 
    	%> 
    		
	        <nav class="navbar navbar-expand-md navbar-light" id="navmenu">
	            <div class="container-fluid">
	                <a class="navbar-brand logo" href="home.jsp"><img src="images/logo.png" alt="brand-logo" width="100"></a>
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
						<ul class="navbar-nav ms-auto">
							<li class="nav-item dropdown">
								<a class="log-out-menu nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Welcome, <%= username %><i class="fa-solid fa-circle-chevron-down"></i> </a> 
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown"> 
									<li>
										<a class="dropdown-item" href="logout.jsp"><i class="fa-solid fa-sign-out-alt"></i> Deconectare</a>
									</li> 
								</ul>
							</li>
						</ul>
	                </div>
	            </div>
	        </nav>
	        <main>
	            <div class="intro container-fluid d-flex flex-column justify-content-center align-items-center">
	                <div class="container-fluid d-flex flex-column flex-md-row justify-content-center align-items-center">
	                   	<img src="images/admin.png" class="profile-image">
	                    <div class="intro-text d-flex flex-column justify-content-center align-items-start">
	                        <h1 class="roboto-bold">&#128449; Administrează-ți afacerea fără bătăi de cap!</h1>
	                       	<p class="roboto-light">Un instrument puternic, dar ușor de folosit, pentru administrarea afacerii tale. <br> Gestionează produsele, stocurile și comenzile tale cu un singur click.</p>
	                    </div>
	                </div>
	                <a href="#cards-section" class = "scroll-down-link"><i class="fa-solid fa-arrow-down-long"></i></a>
	            </div>
	            <div id="cards-section" class="cards-section container-fluid d-flex flex-row flex-wrap justify-content-center align-items-center">
	                <div class="card clients-card">
	                    <h3 class="clients-card-header d-flex flex-column align-items-center roboto-bold"><img src="images/team.png" alt="client-image" width="85"></i>Clienți</h3>
	                    <p class="cards-description-clients roboto-light">Administrează informațiile clienților magazinului tău de muzică: vizualizează, adaugă, editează sau șterge datele acestora pentru o gestionare eficientă și organizată.</p>
	                    <a href="showClienti.jsp" class="btn btn-primary clients-btn">Gestionare Clienți</a>
	                </div>
	                <div class="orders-card card">
	                    <h3 class="orders-card-header d-flex flex-column align-items-center roboto-bold"><img src="images/order.png" alt="order-image" width="85">Comenzi</h3>
	                    <p class="cards-description-orders roboto-light">Administrează comenzile magazinului tău de muzică: vizualizează, actualizează sau șterge comenzi, verifică detalii despre produse și statusul comenzilor pentru o gestionare eficientă a vânzărilor.</p>
	                    <a href="showComenzi.jsp" class="btn btn-outline-primary orders-btn">Istoric Comenzi</a>
	                </div>
	                <div class="card albums-card">
	                    <h3 class="albums-card-header d-flex flex-column align-items-center roboto-bold"><img src="images/album.png" alt="album-image" width="85">Albume</h3>
	                    <p class="cards-description-albums roboto-light">Gestionează colecția de albume: adaugă, editează sau șterge informații despre albume, inclusiv detalii precum artiști, genuri și prețuri, pentru o organizare optimă a catalogului muzical.</p>
	                    <a href="showAlbume.jsp" class="btn btn-primary albums-btn">Catalog Albume</a>
	                </div>
	            </div>
	        </main>
    	<% 	} else {
    	%>
    		<main>
       			<div class="error-message container-fluid d-flex flex-column justify-content-center align-items-center">
       				<img src="images/login_failed.png" alt="error-image" width="300">
       				<h1>Whoops! A apărut o eroare</h1>
       				<h5>Ne pare rău, dar nu am reușit să te conectăm. Te rugăm să verifici datele introduse.</h5>
       				<form action="index.html" method="get">
       					<button type="submit" class="btn btn-primary"><i class="fa-solid fa-backward-step"></i>ÎNAPOI</button>
       				</form>
       			</div>
       		</main>
    	<%
    		}
    	%>
    </body>
</html>