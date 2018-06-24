<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adauga student</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
<%
String ID_Student = request.getParameter("ID_Student");
String Nume = request.getParameter("Nume");
String Prenume = request.getParameter("Prenume");
String Adresa = request.getParameter("Adresa");
String Telefon = request.getParameter("Telefon");
String Email= request.getParameter("Email");
if(ID_Student!=null){
jb.connect();
jb.adaugareStudent(Integer.parseInt(ID_Student), Nume, Prenume, Adresa, Telefon, Email);
jb.disconnect();
%>
<p>Datele au fost adaugate.</p>
<%
}
else{
%>
<h1> Suntem in tabela Student.</h1>
<form action="nou_Student.jsp" method="post">
<table>
<tr>
<td align="right">ID_Student:</td>
<td> <input type="text" name="ID_Student" size="40" /></td>
</tr>
<tr>
<td align="right">Nume Student:</td>
<td> <input type="text" name="Nume" size="40" /></td>
</tr>
<tr>
<td align="right">Prenume Student:</td>
<td> <input type="text" name="Prenume" size="30" /></td>
</tr>
<tr>
<td align="right">Adresa:</td>
<td> <input type="text" name="Adresa" size="30" /></td>
</tr>
<tr>
<td align="right">Telefon:</td>
<td> <input type="text" name="Telefon" size="30" /></td>
</tr>
<tr>
<td align="right">Email:</td>
<td> <input type="text" name="Email" size="30" /></td>
</tr>
</table>
<input type="submit" value="Adauga studentul" />
</form>
<%
}
%>
<br/>
<a href="index.jsp"><b>Home</b></a>
<br/>
</body>
</html>