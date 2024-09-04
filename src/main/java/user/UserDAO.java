package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    final String dbURL = "jdbc:oracle:thin:@localhost:1521:XE";
    final String dbUser = "c##java";
    final String dbPassword = "1234";
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDAO() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int login(String userId, String password) {
        String sql = "select userPassword from board_user where userID=?";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                if (rs.getString(1).equals(password)) {
                    return 1; //로그인 성공

                } else {
                    return 0;
                }
            }
            return -1;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return -2;

    }

    public int join(UserDTO userDTO) {
        String sql = "INSERT INTO board_user (userId, userPassword, userEmail) VALUES (?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userDTO.getUserId());
            pstmt.setString(2, userDTO.getUserPassword());
            pstmt.setString(3, userDTO.getUserEmail());

            return pstmt.executeUpdate(); // 성공 시 1 반환, 실패 시 0 반환

        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    public boolean isDuplicateId(String userId) {
        String sql = "SELECT COUNT(*) FROM board_user WHERE userId = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; // 데이터베이스 오류 시 false 반환
    }
}