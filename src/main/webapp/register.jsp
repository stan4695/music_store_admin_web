<%@ page import="java.sql.*" %>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    jb.connect();
	jb.register(username, password, email);
	response.sendRedirect("index.html");
    jb.disconnect();
%>
