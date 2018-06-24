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
<h1 align="center">Tabela Curs:</h1>
<br/>
<p align="center"><a href="nou_Curs.jsp"><b>Adauga un nou curs.</b></a> <a href="index.jsp"><b>Home</b></a></p>
<%
jb.connect();
long aux = java.lang.Long.parseLong(request.getParameter("primarykey"));
ResultSet rs = jb.intoarceLinieDupaId("Curs", "ID_Curs", aux);
rs.first();
String ID_Curs = rs.getString("ID_Curs");
String Denumire = rs.getString("Denumire");
String Profesor = rs.getString("Profesor");
String Locatie = rs.getString("Locatie");
String Data_Inceput = rs.getString("Data_Inceput");
String Interval_Orar = rs.getString("Interval_Orar");
String Data_Sfarsit = rs.getString("Data_Sfarsit");
rs.close();
jb.disconnect();
%>
<form action="init2_Curs.jsp" method="post">
<table align="center">
<tr>
<td align="right">ID_Curs:</td>
<td> <input type="text" name="ID_Curs" size="30" value="<%= ID_Curs %>"/></td>
</tr>
<tr>
<td align="right">Denumire:</td>
<td> <input type="text" name="Denumire" size="30" value="<%= Denumire %>"/></td>
</tr>
<tr>
<td align="right">Profesor:</td>
<td> <input type="text" name="Profesor" size="30" value="<%= Profesor %>"/></td>
</tr>
<tr>
<td align="right">Locatie:</td>
<td> <input type="text" name="Locatie" size="30" value="<%= Locatie %>"/></td>
</tr>
<tr>
<td align="right">Data_Inceput:</td>
<td> <input type="text" name="Data_Inceput" size="30" value="<%= Data_Inceput %>"/></td>
</tr>
<tr>
<td align="right">Interval_Orar:</td>
<td> <input type="text" name="Interval_Orar" size="30" value="<%= Interval_Orar %>"/></td>
</tr>
<tr>
<td align="right">Data_Sfarsit:</td>
<td> <input type="text" name="Data_Sfarsit" size="30" value="<%= Data_Sfarsit %>"/></td>
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