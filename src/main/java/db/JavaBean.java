package db;

import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.Arrays;

public class JavaBean {

	String error;
	Connection con;

	public JavaBean() {
	}
	
	// Stabilirea conexiunii cu baza de date
	public void connect() throws ClassNotFoundException, SQLException, Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/databaseName?useSSL=false", "root", "databasePassword");
		} catch (ClassNotFoundException cnfe) {
			error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
			throw new ClassNotFoundException(error);
		} catch (SQLException cnfe) {
			error = "SQLException: Nu se poate conecta la baza de date.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
			throw new Exception(error);
		}
	}
	
	// Incheierea conexiunii cu baza de date
	public void disconnect() throws SQLException {
		try {
			if (con != null) {
				con.close();
			}
		} catch (SQLException sqle) {
			error = ("SQLException: Nu se poate inchide conexiunea la baza de date.");
			throw new SQLException(error);
		}
	}
	
	public ResultSet vedeTabela(String tabela) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			String queryString = ("SELECT * FROM `magazinmuzicadb`.`" + tabela + "`;");
			Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
			rs = stmt.executeQuery(queryString);
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // vedeTabela()
	
	public ResultSet checkRole(String username) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			String queryString = "SELECT * FROM users WHERE username = '" + username + "';";
			Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
			rs = stmt.executeQuery(queryString);
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // vedeTabela()
	
	public ResultSet vedeInterogare( String id_comanda, String sortColumn, String sortOrder) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			 if (!sortOrder.equalsIgnoreCase("asc") && !sortOrder.equalsIgnoreCase("desc")) {
				 sortOrder = "asc"; // Default order if sortOrder is invalid
			 }
			 
			String queryString = "SELECT tblprodusecomenzi.id, id_comanda, id_produs, nume_album, artist, gen_muzical, data_lansare, tip_produs, pret, cantitate, pretFinal FROM `magazinmuzicadb`.`tblprodusecomenzi` JOIN `tblalbume` ON `tblprodusecomenzi`.`id_produs` = `tblalbume`.`id` WHERE id_comanda =" + id_comanda +  " ORDER BY " + sortColumn + " " + sortOrder;
			Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
			rs = stmt.executeQuery(queryString);
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	} // vedeTabela()
	
	
	public ResultSet vedeTabela(String tabela, String sortColumn, String sortOrder) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			 if (!sortOrder.equalsIgnoreCase("asc") && !sortOrder.equalsIgnoreCase("desc")) {
				 sortOrder = "asc"; // Default order if sortOrder is invalid
			 }

		    String query = "SELECT * FROM `magazinmuzicadb`.`" + tabela + "` ORDER BY " + sortColumn + " " + sortOrder;
		    Statement stmt = con.createStatement();
		    rs = stmt.executeQuery(query);
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	}
	
	public ResultSet vedeTabelaComenzi(String sortColumn, String sortOrder) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			 if (!sortOrder.equalsIgnoreCase("asc") && !sortOrder.equalsIgnoreCase("desc")) {
				 sortOrder = "asc"; // Default order if sortOrder is invalid
			 }

		    String query = "SELECT tblcomenzi.id, id_client, nume, email, data_comanda, status, total_comanda FROM `magazinmuzicadb`.`tblcomenzi` JOIN `tblclienti` ON `tblclienti`.`id` = `tblcomenzi`.`id` ORDER BY " + sortColumn + " " + sortOrder;
		    Statement stmt = con.createStatement();
		    rs = stmt.executeQuery(query);
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	}
	
	public void addClient(String nume, String email, String telefon, String adresa)
			throws SQLException, Exception {
		if (con != null) {
			try {
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("INSERT INTO tblClienti(nume, email, telefon, adresa) values('" + nume + "'  , '" + email + "', '" + telefon + "', '" + adresa + "');");

			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	}
	
	public void addAlbum(String nume_album, String artist, String gen_muzical, String data_lansare, String pret, String casa_discuri, String tip_produs, String stoc)
			throws SQLException, Exception {
		if (con != null) {
			try {
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				if (gen_muzical != "" && tip_produs != "") {
					stmt.executeUpdate("INSERT INTO tblAlbume(nume_album, artist, gen_muzical, data_lansare, pret, casa_discuri, tip_produs, stoc) values('" + nume_album + "'  , '" + artist + "', '" + gen_muzical + "', '" + data_lansare + "', '" + pret + "', '" + casa_discuri + "', '" + tip_produs + "', '" + stoc  + "');");
				}else if (gen_muzical != "") {
					stmt.executeUpdate("INSERT INTO tblAlbume(nume_album, artist, gen_muzical, data_lansare, pret, casa_discuri, stoc) values('" + nume_album + "'  , '" + artist + "', '" + gen_muzical + "', '" + data_lansare + "', '" + pret + "', '" + casa_discuri + "', '"  + stoc  + "');");
				}else if (tip_produs != "") {
					stmt.executeUpdate("INSERT INTO tblAlbume(nume_album, artist, data_lansare, pret, casa_discuri, tip_produs, stoc) values('" + nume_album + "'  , '" + artist + "', '" + data_lansare + "', '" + pret + "', '" + casa_discuri + "', '" + tip_produs + "', '" + stoc  + "');");
				}else {
					stmt.executeUpdate("INSERT INTO tblAlbume(nume_album, artist, data_lansare, pret, casa_discuri, stoc) values('" + nume_album + "'  , '" + artist + "', '" + data_lansare + "', '" + pret + "', '" + casa_discuri + "', '" + stoc  + "');");
				}
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	}
	public void addComanda(String id_client, String data_comanda, String status, String total_comanda)
			throws SQLException, Exception {
		if (con != null) {
			try {
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("INSERT INTO tblComenzi (id_client, data_comanda, status, total_comanda) values('" + id_client + "', '" + data_comanda + "', '" + status + "', '" + total_comanda + "');");

			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	}
	public void addProdus(String id_comanda, String id_produs, String cantitate)
			throws SQLException, Exception {
		if (con != null) {
			try {
				// creaza un "prepared SQL statement"
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate("INSERT INTO tblProduseComenzi (id_comanda, id_produs, cantitate, pretFinal) values('" + id_comanda + "', '" + id_produs + "', '" + cantitate + "','0');");

			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	}
	public void modificaTabela(String tabela, String IDTabela, int ID, String[] campuri, String[] valori) throws SQLException, Exception {
		String update = "update " + tabela + " set ";
		String temp = "";
		if (con != null) {
			try {
				for (int i = 0; i < campuri.length; i++) {
					if (i != (campuri.length - 1)) {
						temp = temp + campuri[i] + "='" + valori[i] + "', ";
					} else {
						temp = temp + campuri[i] + "='" + valori[i] + "' where " + IDTabela + " = '" + ID + "';";
					}
				}
				update = update + temp;
				Statement stmt;
				stmt = con.createStatement();
				stmt.executeUpdate(update);
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	}
	
	public ResultSet showTotalComanda(String id_comanda) throws SQLException, Exception {
		ResultSet rs = null;
		try {
		    String query = "SELECT SUM(pretFinal) AS totalComanda FROM `magazinmuzicadb`.`tblProduseComenzi` WHERE id_comanda = " + id_comanda;
		    Statement stmt = con.createStatement();
		    rs = stmt.executeQuery(query);
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	}
	
	public ResultSet intoarceLinieDupaId(String tabela, String denumireId, int ID) throws SQLException, Exception {
		ResultSet rs = null;
		try {
			String queryString = ("SELECT * FROM " + tabela + " where " + denumireId + "=" + ID + ";");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(queryString); //sql exception
		} catch (SQLException sqle) {
			error = "SQLException: Interogarea nu a fost posibila.";
			throw new SQLException(error);
		} catch (Exception e) {
			error = "A aparut o exceptie in timp ce se extrageau datele.";
			throw new Exception(error);
		}
		return rs;
	}
	
	public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception {
		if (con != null /*Verfica daca avem conexiune la baza de date*/) {
			try {
				// creaza un "prepared SQL statement"
				long aux;
				PreparedStatement delete;
				delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
				for (int i = 0; i < primaryKeys.length; i++) {
					aux = java.lang.Long.parseLong(primaryKeys[i]); /*se face conversia id-ului in long*/
					delete.setLong(1, aux); /*Inlocuieste primul semn de intreabare cu aux*/
					delete.execute(); /*Executa statemeent-ul anterior creat*/
				}
			} catch (SQLException sqle) {
				error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
				throw new SQLException(error);
			} catch (Exception e) {
				error = "A aparut o exceptie in timp ce erau sterse inregistrarile.";
				throw new Exception(error);
			}
		} else {
			error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
			throw new Exception(error);
		}
	}
	
	public void register(String username, String password, String email) throws SQLException, Exception {
        if (con != null) {
            try {
            	String hashedPassword = SecurityUtil.hashPassword(password);
            	
                // Creare statement pentru inserare
                Statement stmt = con.createStatement();
                String query = "INSERT INTO users (username, password, email) VALUES ('" + username + "', '" + hashedPassword + "', '" + email + "');";
                stmt.executeUpdate(query);
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Nu a fost posibila inregistrarea utilizatorului.";
                throw new SQLException(error);
            } catch (NoSuchAlgorithmException nsae) {
            	error = "Exceptie: Algoritm de hash nerecunoscut.";
            	throw new Exception(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    }

    // Metoda de logare (login)
    public boolean login(String username, String password) throws SQLException, Exception {
        boolean isLoggedIn = false;
        if (con != null) {
            try {
            	String hashedPassword = SecurityUtil.hashPassword(password);
            	
                // Creare statement pentru a verifica daca exista utilizatorul cu email si parola
                Statement stmt = con.createStatement();
                String query = "SELECT * FROM users WHERE username = '" + username + "' AND password = '" + hashedPassword + "';";
                ResultSet rs = stmt.executeQuery(query);
                
                if (rs.next()) {
                    // Daca gasim un utilizator, inseamna ca logarea a reusit
                    isLoggedIn = true;
                }
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Nu a fost posibila logarea utilizatorului.";
                throw new SQLException(error);
            } catch (NoSuchAlgorithmException nsae) {
            	error = "Exceptie: Algoritm de hash nerecunoscut.";
            	throw new Exception(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
        return isLoggedIn;
    }
	
    
}