<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Studenti</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
<h1 align="center">Cauta Student:</h1>
<br/>
<p align="center"><a href="tabela_Studenti.jsp"><b>Vezi studenti</b></a> <a href="index.jsp"><b>Home</b></a></p>
<%
String ID_Student = request.getParameter("ID_Student");
if(ID_Student!=null){
	jb.connect();
	ResultSet rs = jb.gaseste_Curs_Student(Long.parseLong(ID_Student));
	Vector<String> cursuri = new Vector<String>();
	String[] nume = jb.returneaza_nume_Student(Long.parseLong(ID_Student));
%>
<p> Studentul cu ID-ul <%=ID_Student%> si numele <%=nume[0]%> si prenumele <%=nume[1]%> participa la urmatoarele cursuri:
<ul>
<% 
while(rs.next()){
	String denumire = jb.returneaza_nume_Curs(Long.parseLong(rs.getString("ID_Curs")));
%>
<li>
<%=denumire%>
</li>
<% 
}
%>
</ul>
<%
jb.disconnect();
}
else{ 
%>
<form action="cauta_Student.jsp" method="post">
<table>
<tr>
<td align="right">ID_Student:</td>
<td> <input type="text" name="ID_Student" size="40" /></td>
</tr>
</table>
<input type="submit" value="Cauta studentul" />
</form>
<%
}
%>
<br/>
<p align="center">
<a href="index.jsp"><b>Home</b></a>
<br/>
</p>
</body>
</html>