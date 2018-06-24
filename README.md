# axway

connect() - realizeaza conectarea la baza de date;

disconnect() - realizeaza deconectarea de la baza de date;

adugareStudent() - realizeaza adaugarea unui student in baza de date pe baza denumirilor campurilor tabelului Studenti din baza de date, respectiv Id student, nume, prenume, adresa, telefon si e-mail;

adaugareCurs() - realizeaza adugarea unui nou curs pe baza denumirilor campurilor tabelului Curs din baza de date, respectiv Id Curs, denumire, profesor, locatie, data inceput, interval orar, data sfarsit;

modificaTabela() - permite realizarea de update-uri in tabelele bazei de date;

intoarceLinieDupaId() - permite obtinerea datelor din tabelele bazei de date;

gaseste_Curs_Student() - permite obtinerea cursurilor pe care le urmeaza un anumit student;

returneaza_nume_Curs() - permite obtinerea numelui si prenumelui studentului cautat pe baza id-ului de curs returnat de gaseste_Curs_Student;

gaseste_Student_Curs() - permite obtinerea studentilor care urmeaza un anumit curs;

returneaza_nume_Student() - permite obtinerea denumirii cursului cautat pe baza id-ului de student returnat de gaseste_Student_Curs;

vedeTabela() - permite obtinerea datelor din tabele pe baza denumirii tabelei;



cauta_Curs.jsp - reprezinta fisierul ce implementeaza interfata de cautare a studentilor care participa la un anumit curs si utilizeaza gaseste_Student_Curs(), returneaza_nume_Curs() si returneaza_nume_Student()

cauta_Student.jsp - implementeaza interfata de cautare a cursurilor pe care le urmeaza un anumit student si utilizeaza gaseste_Curs_Student, returneaza_nume_Curs() si returneaza_nume_Student()

index.jsp - implementeaza interfata meniului principal

init_Curs.jsp - implementeaza interfata de update-are a tabelei Curs si utilizeaza intoarceLinieDupaId()

init2_Curs.jsp - implementeaza procesul de update-are a tabelei Curs si afiseaza mesajul de confirmare a modificarilor si utilizeaza modificaTabela()

init_Student.jsp - implementeaza interfata de update-are a tabelei Student si utilizeaza intoarceLinieDupaId()

init2_Student.jsp - implementeaza procesul de update-are a tabelei Student si afiseaza mesajul de confirmare a modificarilor si utilizeaza modificareTabela()

modifica_Curs - implementeaza interfata de alegere a liniei ce se doreste a fi modificata din tabela Curs si utilizeaza vedeTabela()

modifica_Student - implementeaza interfata de alegere a liniei ce se doreste a fi modificata din tabela Student si utilizeaza vedeTabela()

nou_Curs.jsp - implementeaza interfata de adaugare a unei noi intrari in tabela Curs si utilizeaza adaugareCurs()

nou_Student.jsp - implementeaza interfata de adaugare a unei noi intrari in tabela Student si utilizeaza adaugareStudent()

tabela_Cursuri.jsp - implementeaza afisarea tuturor inregistrarilor din tabela Curs si utilizeaza vedeTabela()

tabela_Studenti.jsp - implementeaza afisarea tuturor inregistrarilor din tabela Student si utilizeaza vedeTabela()

