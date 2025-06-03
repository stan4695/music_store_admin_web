<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    // Invalidate the session if it exists
    if (session != null) {
        session.invalidate();
    }
    // Redirect to the login page after logging out
    response.sendRedirect("index.html");
%>