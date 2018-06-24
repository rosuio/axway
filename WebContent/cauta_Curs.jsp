<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cursuri</title>
</head>
<jsp:useBean id="jb" scope="session" class="db.javabean" />
<jsp:setProperty name="jb" property="*" />
<body>
<h1 align="center">Cauta Curs:</h1>
<br/>
<p align="center"><a href="tabela_Cursuri.jsp"><b>Vezi cursuri</b></a> <a href="index.jsp"><b>Home</b></a></p>
<%
String ID_Curs = request.getParameter("ID_Curs");
if(ID_Curs!=null){
	jb.connect();
	ResultSet rs = jb.gaseste_Student_Curs(Long.parseLong(ID_Curs));
	Vector<String> Studenti = new Vector<String>();
	String Denumire = jb.returneaza_nume_Curs(Long.parseLong(ID_Curs));
%>
<p> La cursul cu ID-ul <%=ID_Curs%> si denumirea <%=Denumire%> participa urmatorii studenti:
<ul>
<% 
while(rs.next()){
	String[] nume = jb.returneaza_nume_Student(Long.parseLong(rs.getString("ID_Student")));
	String num = nume[0] + " " + nume[1];
%>
<li>
<%=num%>
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
<form action="cauta_Curs.jsp" method="post">
<table>
<tr>
<td align="right">ID_Curs:</td>
<td> <input type="text" name="ID_Curs" size="40" /></td>
</tr>
</table>
<input type="submit" value="Cauta cursul" />
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