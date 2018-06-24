<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tabela Studenti</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
<h1 align="center"> Tabela Studenti:</h1>
<br/>
<p align="center"><a href="nou_Student.jsp"><b>Adauga un nou student.</b></a> <a href="index.jsp"><b>Home</b></a></p>
<table border="1" align="center">
<tr>
<td><b>IdStudent:</b></td>
<td><b>Nume Student:</b></td>
<td><b>Prenume Student:</b></td>
<td><b>Adresa:</b></td>
<td><b>Telefon:</b></td>
<td><b>Email:</b></td>
</tr>
<% jb.connect();
ResultSet rs = jb.vedeTabela("Studenti");
long x;
while (rs.next()) {
x=rs.getLong("ID_Student");
%>
<tr>
<td><%= rs.getString("ID_Student") %></td>
<td><%= rs.getString("Nume") %></td>
<td><%= rs.getString("PRENUME") %></td>
<td><%= rs.getString("Adresa") %></td>
<td><%= rs.getString("Telefon") %></td>
<td><%= rs.getString("EMAIL") %></td>
<% }
%>
</tr>
</table><br/>
<%
rs.close();
jb.disconnect();
%>
<br/>
<p align="center">
<a href="index.jsp"><b>Home</b></a>
<br/>
</p>
</body>
</html>