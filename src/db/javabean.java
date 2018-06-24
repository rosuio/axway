package db;
import java.sql.*;
import java.util.Vector;


public class javabean {
	String error;
	Connection con;
	
	public javabean(){}
	
	public void connect() throws ClassNotFoundException, SQLException, Exception{
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/axway","root", "tastatura");
		}
		catch (ClassNotFoundException cnfe)
		{
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		}
		catch (SQLException cnfe)
		{
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		}
		catch (Exception e)
		{
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	} // connect()
	
	public void disconnect() throws SQLException{
		try
		{
			if ( con != null )
			{
				con.close();
			}
		}
		catch (SQLException sqle)
		{
			error = ("SQLException: Nu se poate inchide conexiunea la baza de date.");
			throw new SQLException(error);
		}
	} // disconnect()
	
	public void adaugareStudent(int ID_Student, String Nume, String PRENUME, String Adresa, String Telefon, String EMAIL)
			throws SQLException, Exception
				{
				 if (con != null)
				 {
				  try
				  {
				   // create a prepared SQL statement
				   Statement stmt;
				   stmt = con.createStatement();
				   stmt.executeUpdate("insert into `axway`.`Studenti`(ID_Student, Nume, PRENUME, Adresa, Telefon, EMAIL) values('"+ID_Student+"', '"+Nume+"', '"+PRENUME+"', '"+Adresa+"','"+Telefon+"', '"+EMAIL+"');");
				  }
				  catch (SQLException sqle)
				  {
					  error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
					  throw new SQLException(error);
				  }
				 }
				 else
				 {
					 error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
					 throw new Exception(error);
				 }
				} // end of adaugareStudent()
	
	public void adaugareCurs(int ID_Curs, String Denumire, String Profesor, String Locatie, String Data_Inceput, String Interval_Orar, String Data_Sfarsit)
			throws SQLException, Exception
				{
				 if (con != null)
				 {
				  try
				  {
				   // create a prepared SQL statement
				   Statement stmt;
				   stmt = con.createStatement();
				   stmt.executeUpdate("insert into `axway`.`Curs`(ID_Curs, Denumire, Profesor, Locatie, Data_Inceput, Interval_Orar, Data_Sfarsit) values('"+ID_Curs+"', '"+Denumire+"', '"+Profesor+"', '"+Locatie+"','"+Data_Inceput+"', '"+Interval_Orar+"', '"+Data_Sfarsit+"');");
				  }
				  catch (SQLException sqle)
				  {
					  error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
					  throw new SQLException(error);
				  }
				 }
				 else
				 {
					 error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
					 throw new Exception(error);
				 }
				} // end of adaugareCurs()
	
	
	public void modificaTabela(String tabela, String IDTabela, long ID, String[] campuri, String[] valori)
			throws SQLException, Exception
			{
					String update="update " + tabela + " set ";
					String temp="";
				if (con != null)
				{
					try
					{
						for(int i=0; i<campuri.length; i++){
							if(i!=(campuri.length-1))
								temp = temp + campuri[i] + "='"+ valori[i] +"', ";
							else
								temp = temp + campuri[i] + "='"+ valori[i] +"' where " + IDTabela + " = '" + ID + "';";
						}
						update = update + temp;
					// create a prepared SQL statement
						Statement stmt;
						stmt = con.createStatement();
						stmt.executeUpdate(update);
					}
					catch (SQLException sqle)
					{
						error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
						throw new SQLException(error);
					}
				}
				else
				{
					error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
					throw new Exception(error);
				}
			} // end of modificaTabela()
			
	public ResultSet intoarceLinieDupaId(String tabela, String denumireId, long ID) throws SQLException, Exception
	{
		ResultSet rs = null;
		try
		{
			// Execute query
			String queryString = ("SELECT * FROM " + tabela + " where "+ denumireId +"=" + ID + ";");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); //sql exception
		}
		catch (SQLException sqle)
		{
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		}
		catch (Exception e)
		{
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // end of intoarceLinieDupaId()
	
	
	
	public ResultSet gaseste_Curs_Student(long ID) throws SQLException, Exception
	{
		ResultSet res = null;
		try
		{
			// Execute query
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			String queryString = ("SELECT ID_Curs FROM CursXStudenti WHERE ID_Student =" + ID + ";");
			res = stmt.executeQuery(queryString); //sql exception
		}
		catch (SQLException sqle)
		{
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		}
		catch (Exception e)
		{
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return res;
	} // end of gaseste_Curs_Student()
	
	public ResultSet gaseste_Student_Curs(long ID) throws SQLException, Exception
	{
		ResultSet res = null;
		try
		{
			// Execute query
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			String queryString = ("SELECT ID_Student FROM CursXStudenti WHERE ID_Curs =" + ID + ";");
			res = stmt.executeQuery(queryString); //sql exception
		}
		catch (SQLException sqle)
		{
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		}
		catch (Exception e)
		{
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return res;
	} // end of gaseste_Student_Curs()
	
	public String returneaza_nume_Curs(long ID) throws SQLException, Exception
	{
		ResultSet rs = null;
		try {
			String queryString = ("SELECT Denumire FROM Curs where ID_Curs=" + ID + ";");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); //sql exception
			rs.first();
		}
		catch (SQLException sqle)
		{
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(sqle.getMessage());
		}
		catch (Exception e)
		{
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs.getString("Denumire");
	} // end of returneaza_nume_Curs()
		
	public String[] returneaza_nume_Student(long ID) throws SQLException, Exception
	{
		ResultSet rs = null;
		try {
				String queryString = ("SELECT Nume, PRENUME FROM Studenti where ID_Student =" + ID + ";");
				Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				rs = stmt.executeQuery(queryString); //sql exception
				rs.first();
				String[] rezultat= {rs.getString("Nume"), rs.getString("PRENUME")};
				return rezultat;
		}
		catch (SQLException sqle)
		{
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(sqle.getMessage());
		}
		catch (Exception e)
		{
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
	} // end of returneaza_nume_Student()	
	
	public ResultSet vedeTabela(String tabel) throws SQLException, Exception
	{
		ResultSet rs = null;
		try
		{
			String queryString = ("select * from `axway`.`" + tabel + "`;");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString);
		}
		catch (SQLException sqle)
		{
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		}
		catch (Exception e)
		{
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		} return rs;
	} // end of vedeTabela()
}

