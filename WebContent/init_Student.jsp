<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tabela Studenti</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
<h1 align="center">Tabela Studenti:</h1>
<br/>
<p align="center"><a href="nou_Student.jsp"><b>Adauga un nou student.</b></a> <a href="index.jsp"><b>Home</b></a></p>
<%
jb.connect();
long aux = java.lang.Long.parseLong(request.getParameter("primarykey"));
ResultSet rs = jb.intoarceLinieDupaId("Studenti", "ID_Student", aux);
rs.first();
String ID_Student = rs.getString("ID_Student");
String Nume = rs.getString("Nume");
String Prenume = rs.getString("Prenume");
String Adresa = rs.getString("Adresa");
String Email = rs.getString("Email");
String Telefon = rs.getString("Telefon");
rs.close();
jb.disconnect();
%>
<form action="init2_Student.jsp" method="post">
<table align="center">
<tr>
<td align="right">ID_Student:</td>
<td> <input type="text" name="ID_Student" size="30" value="<%= ID_Student %>"/></td>
</tr>
<tr>
<td align="right">Nume:</td>
<td> <input type="text" name="Nume" size="30" value="<%= Nume %>"/></td>
</tr>
<tr>
<td align="right">Prenume:</td>
<td> <input type="text" name="Prenume" size="30" value="<%= Prenume %>"/></td>
</tr>
<tr>
<td align="right">Adresa:</td>
<td> <input type="text" name="Adresa" size="30" value="<%= Adresa %>"/></td>
</tr>
<tr>
<td align="right">Telefon:</td>
<td> <input type="text" name="Telefon" size="30" value="<%= Telefon %>"/></td>
</tr>
<tr>
<td align="right">Email:</td>
<td> <input type="text" name="Email" size="30" value="<%= Email %>"/></td>
</tr>
</table>
<p align="center">
<input type="submit" value="Modifica linia">
</p>
</form>
<p align="center">
<a href="index.jsp"><b>Home</b></a>
<br/>
</body>
</html>