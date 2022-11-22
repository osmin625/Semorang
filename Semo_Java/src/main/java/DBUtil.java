import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
	private final String URL = "jdbc:oracle:thin:@SEMODB_high?TNS_ADMIN=C:\\\\OracleDBproject\\\\Wallet_SEMODB";
	private final String USER_ID = "ADMIN";
	private final String USER_PWD = "Semorang1234";

	private static DBUtil instance;

	private DBUtil() {
	}

	public static DBUtil getInstance() {
		if (instance == null)
			instance = new DBUtil();
		return instance;
	}

	public Connection getConnection() throws SQLException {
		return DriverManager.getConnection(URL, USER_ID, USER_PWD);
	}

	public void close(AutoCloseable... autoCloseables) {
		try {
			for(AutoCloseable ac : autoCloseables) {
				if(ac != null)
					ac.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
