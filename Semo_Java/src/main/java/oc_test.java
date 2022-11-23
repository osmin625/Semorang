import java.sql.*; // import JDBC package
public class oc_test {
	// jdbc:oracle:thin:@SEMODB_high?TNS_ADMIN=C:\\OracleDBproject\\Wallet_SEMODB
	private static final String URL = "jdbc:oracle:thin:@SEMODB_high?TNS_ADMIN=C:\\\\OracleDBproject\\\\Wallet_SEMODB";
	private static final String USER_ID = "ADMIN";
	private static final String USER_PWD = "Semorang1234";
	public static final String TABLE_NAME = "TEST";
	public static void main(String[] args) {
		Connection conn = null; // Connection object
		Statement stmt = null;	// Statement object
		String sql = ""; // an SQL statement 
		try {
			// Load a JDBC driver for Oracle DBMS
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// Get a Connection object 
			System.out.println("Success!");
		}catch(ClassNotFoundException e) {
			System.err.println("error = " + e.getMessage());
			System.exit(1);
		}

		// Make a connection
		try{
			conn = DriverManager.getConnection(URL, USER_ID, USER_PWD); 
			System.out.println("Connected.");
		}catch(SQLException ex) {
			ex.printStackTrace();
			System.err.println("Cannot get a connection: " + ex.getLocalizedMessage());
			System.err.println("Cannot get a connection: " + ex.getMessage());
			System.exit(1);
		}
		
		// Execute an SQL statement for CREATE TABLE
		try {
			conn.setAutoCommit(false); // auto-commit disabled  
			// Create a statement object
			stmt = conn.createStatement();
			// Let's execute an SQL statement.
			int res = 0;
//			sql = "DROP TABLE " + TABLE_NAME + " CASCADE CONSTRAINT";
//			res = stmt.executeUpdate(sql); 
//			try {
//				 res = stmt.executeUpdate(sql); 
//			}catch(Exception ex) {
//				// in most cases, you'll see "table or view does not exist"
//				System.out.println(ex.getMessage());
//			}
//			if(res == 0) 
//				System.out.println("Table TEST was successfully dropped.");
			StringBuffer sb = new StringBuffer();
			sb.append("CREATE TABLE " + TABLE_NAME + " (Id INT, ");
			sb.append("				      Name VARCHAR(10), ");
			sb.append("				      Address VARCHAR(20))");
			sql = sb.toString();
			// Try 'CREATE TABLE ...'
			res = stmt.executeUpdate(sql); 
			if(res == 0) 
				System.out.println("Table TEST was successfully created.");
			// Make the table permanently stored by a commit.
			conn.commit();			

		}catch(SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
		
		// Execute an SQL statement for INSERT
		try {
			// Let's execute an SQL statement.
			sql = "INSERT INTO TEST VALUES (10, 'SUH', 'Daegu')";
			// Try 'INSERT INTO ...' for the first time
			int res = stmt.executeUpdate(sql);
			System.out.println(res + " row inserted.");
			// Let's do more.
			sql = "INSERT INTO TEST VALUES (20, 'PARK', 'Busan')";
			// Add above SQL statement in the batch.
			stmt.addBatch(sql);
			sql = "INSERT INTO TEST VALUES (30, 'Rivera', 'New York')";
			// Add above SQL statement in the batch.
			stmt.addBatch(sql);
			sql = "INSERT INTO TEST VALUES (40, 'Ryu', 'Los Angeles')";
			// Add above SQL statement in the batch.
			stmt.addBatch(sql);
			// Create an int[] to hold returned values
			int[] count = stmt.executeBatch();
			System.out.println(count.length + " row inserted.");
			// Make the changes permanent 
			conn.commit();			
		}catch(SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
		
		// Execute an SELECT statement 
		try {
			// Let's execute an SQL statement.
			sql = "SELECT * from TEST";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				// no impedance mismatch in JDBC
				int id 		= rs.getInt(1);
				String name = rs.getString(2);
				String addr = rs.getString(3);
				System.out.println("ID = " + id 
								+  ", Name = " + name 
								+  ", Address = " + addr);
			}
			conn.commit();			
		}catch(SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
		
		// Execute an SQL statement for INSERT
		try {
			// Let's execute an SQL statement.
			sql = "UPDATE TEST SET Name = 'Oh' WHERE Id = 40";
			// Try 'UPDATE ...' for the first time
			int res = stmt.executeUpdate(sql);
			System.out.println(res + " row updated.");
			// Let's do DELETE.
			sql = "DELETE FROM TEST WHERE Id = 30";
			// Add above SQL statement in the batch.
			stmt.addBatch(sql);
			int[] count = stmt.executeBatch();
			System.out.println(count.length + " row deleted.");
			// Make the changes permanent 
			conn.commit();			
		}catch(SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
		
		// Execute the same SELECT statement with a PreparedStatement  
		// to confirm the modification
		try {
			// Let's execute an SQL statement.
			sql = "SELECT * from TEST WHERE Id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			//성능이 좋기 때문에 잘쓰면 좋음.
			//쿼리를 준비시켜놓고, 비어있는 부분만 동적으로 update한다.
			//이를 위해 비어있는 부분은 ?로 표시한다.
			//select문 구성하고, parameter로 ?를 넣어준다.
			//createstatement에서 아무것도 넣지 못하는 것과 대비된다.
			//대부분 구조가 동일하고, 일부정보만 바뀌는 query가 반복되는 경우 매우 효율적이다.
			//ResultSet rs = stmt.executeQuery(sql);
			ps.setInt(1, 40);
			ResultSet rs = ps.executeQuery();
			//overloading
			//if rs==null을 확인하는 문법이 빠졌다.
			//이 부분을 매우 흔하게 실수한다.
			//result set이 당연히 있을 것이라 생각해서는 안된다.
			while(rs.next()) {
				// no impedance mismatch in JDBC
				int id 		= rs.getInt(1);
				String name = rs.getString(2);
				String addr = rs.getString(3);
				System.out.println("ID = " + id 
								+  ", Name = " + name 
								+  ", Address = " + addr);
			}
			ps.close();
			rs.close();
			conn.commit();
			//commit 안해도 되는데 commit 했다.
			//callable statement
		}catch(SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
		
		// Release database resources.
		try {
			// Close the Statement object.
			stmt.close(); 
			// Close the Connection object.
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}