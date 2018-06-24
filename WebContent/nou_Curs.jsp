<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adauga curs</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
<%
String ID_Curs = request.getParameter("ID_Curs");
String Denumire = request.getParameter("Denumire");
String Profesor = request.getParameter("Profesor");
String Locatie = request.getParameter("Locatie");
String Data_Inceput = request.getParameter("Data_Inceput");
String Interval_Orar = request.getParameter("Interval_Orar");
String Data_Sfarsit = request.getParameter("Data_Sfarsit");

if(ID_Curs!=null){
jb.connect();
jb.adaugareCurs(Integer.parseInt(ID_Curs), Denumire, Profesor, Locatie, Data_Inceput, Interval_Orar, Data_Sfarsit);
jb.disconnect();
%>
<p>Datele au fost adaugate.</p>
<%
}
else{
%>
<h1> Suntem in tabela Curs.</h1>
<form action="nou_Curs.jsp" method="post">
<table>
<tr>
<td align="right">ID_Curs:</td>
<td> <input type="text" name="ID_Curs" size="40" /></td>
</tr>
<tr>
<td align="right">Denumire:</td>
<td> <input type="text" name="Denumire" size="40" /></td>
</tr>
<tr>
<td align="right">Profesor:</td>
<td> <input type="text" name="Profesor" size="30" /></td>
</tr>
<tr>
<td align="right">Locatie:</td>
<td> <input type="text" name="Locatie" size="30" /></td>
</tr>
<tr>
<td align="right">Data_Inceput:</td>
<td> <input type="text" name="Data_Inceput" size="30" /></td>
</tr>
<tr>
<td align="right">Interval_Orar:</td>
<td> <input type="text" name="Interval_Orar" size="30" /></td>
</tr>
<tr>
<td align="right">Data_Sfarsit:</td>
<td> <input type="text" name="Data_Sfarsit" size="30" /></td>
</tr>
</table>
<input type="submit" value="Adauga cursul" />
</form>
<%
}
%>
<br/>
<a href="index.jsp"><b>Home</b></a>
<br/>
</body>
</html>