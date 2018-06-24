<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tabela Curs</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
<h1 align="center"> Tabela Curs:</h1>
<br/>
<p align="center"><a href="nou_Curs.jsp"><b>Adauga un nou curs.</b></a> <a href="index.jsp"><b>Home</b></a></p>
<%
jb.connect();
long aux = java.lang.Long.parseLong(request.getParameter("ID_Curs"));
String ID_Curs = request.getParameter("ID_Curs");
String Denumire = request.getParameter("Denumire");
String Profesor = request.getParameter("Profesor");
String Locatie = request.getParameter("Locatie");
String Data_Inceput = request.getParameter("Data_Inceput");
String Interval_Orar = request.getParameter("Interval_Orar");
String Data_Sfarsit = request.getParameter("Data_Sfarsit");
String[] valori = {ID_Curs, Denumire, Profesor, Locatie, Data_Inceput, Interval_Orar, Data_Sfarsit};
String[] campuri = {"ID_Curs", "Denumire", "Profesor", "Locatie", "Data_Inceput", "Interval_Orar", "Data_Sfarsit"};
jb.modificaTabela("Curs", "ID_Curs", aux, campuri, valori);
jb.disconnect();
%>
<h1 align="center">Modificarile au fost efectuate !</h1>
<p align="center">
<a href="index.jsp"><b>Home</b></a>
<br/>
</body>
</html>