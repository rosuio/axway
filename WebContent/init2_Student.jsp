<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tabela Student</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
<h1 align="center"> Tabela Studenti:</h1>
<br/>
<p align="center"><a href="nou_Student.jsp"><b>Adauga un nou student.</b></a> <a href="index.jsp"><b>Home</b></a></p>
<%
jb.connect();
long aux = java.lang.Long.parseLong(request.getParameter("ID_Student"));
String ID_Student = request.getParameter("ID_Student");
String Nume = request.getParameter("Nume");
String Prenume = request.getParameter("Prenume");
String Adresa = request.getParameter("Adresa");
String Telefon = request.getParameter("Telefon");
String Email = request.getParameter("Email");
String[] valori = {ID_Student, Nume, Prenume, Adresa, Telefon, Email};
String[] campuri = {"ID_Student", "Nume", "PRENUME", "Adresa", "Telefon", "EMAIL"};
jb.modificaTabela("Studenti", "ID_Student", aux, campuri, valori);
jb.disconnect();
%>
<h1 align="center">Modificarile au fost efectuate !</h1>
<p align="center">
<a href="index.jsp"><b>Home</b></a>
<br/>
</body>
</html>