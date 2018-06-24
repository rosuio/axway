<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tabela Curs</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
<h1 align="center"> Tabela Curs:</h1>
<br/>
<p align="center"><a href="nou_Curs.jsp"><b>Adauga un nou curs.</b></a> <a href="index.jsp"><b>Home</b></a></p>
<table border="1" align="center">
<tr>
<td><b>IdCurs:</b></td>
<td><b>Denumire:</b></td>
<td><b>Profesor:</b></td>
<td><b>Locatie:</b></td>
<td><b>Data_Inceput:</b></td>
<td><b>Interval_Orar:</b></td>
<td><b>Data_Sfarsit:</b></td>
</tr>
<% jb.connect();
ResultSet rs = jb.vedeTabela("Curs");
long x;
while (rs.next()) {
x=rs.getLong("ID_Curs");
%>
<tr>
<td><%= rs.getString("ID_Curs") %></td>
<td><%= rs.getString("Denumire") %></td>
<td><%= rs.getString("Profesor") %></td>
<td><%= rs.getString("Locatie") %></td>
<td><%= rs.getString("Data_Inceput") %></td>
<td><%= rs.getString("Interval_Orar") %></td>
<td><%= rs.getString("Data_Sfarsit") %></td>
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