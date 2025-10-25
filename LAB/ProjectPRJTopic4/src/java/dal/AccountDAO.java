/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import models.Account;
import models.Role;
import java.sql.*;
import utils.Utils;

/**
 *
 * @author Admin
 */
public class AccountDAO extends DBContext {

    public PreparedStatement stm;
    public ResultSet rs;

    // login
    public Account getAccountByEmail(String email) {
        Account account = null;
        try {
            String strSQL = "SELECT a.*, r.roleName FROM Accounts a JOIN Roles r ON a.roleId = r.roleId WHERE a.email = ?";

            stm = connection.prepareStatement(strSQL);
            stm.setString(1, email);
            rs = stm.executeQuery();

            if (rs.next()) {
                Role role = new Role(
                        rs.getInt("roleId"),
                        rs.getString("roleName"));

                account = new Account(
                        rs.getString("accountId"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getTimestamp("createdAt").toLocalDateTime(),
                        role,
                        rs.getString("avatar"));
            }

        } catch (Exception e) {
            System.out.println("getAccountByEmail: " + e.getMessage());
        }
        return account;
    }

    // User Register
    public boolean createAccountByUser(Account account) {
        try {
            // Tạo accountId 8 ký tự
            String accountId = Utils.generateId(8);
            account.setAccountId(accountId);

            String strSQL = "INSERT INTO Accounts(accountId, username, password, email, roleId, createdAt) "
                    + "VALUES(?, ?, ?, ?, ?, GETDATE())";

            stm = connection.prepareStatement(strSQL);
            stm.setString(1, account.getAccountId());
            stm.setString(2, account.getUsername());
            stm.setString(3, account.getPassword());
            stm.setString(4, account.getEmail());
            stm.setInt(5, account.getRole().getRoleId());

            int rows = stm.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            System.out.println("createAccount: " + e.getMessage());
            return false;
        }
    }

    // 🔹 Lấy Account theo accountId
    public Account getAccountById(String accountId) {
        Account account = null;
        try {
            String strSQL = """
                        SELECT a.*, r.roleName
                        FROM Accounts a
                        JOIN Roles r ON a.roleId = r.roleId
                        WHERE a.accountId = ?
                    """;
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, accountId);
            rs = stm.executeQuery();

            if (rs.next()) {
                Role role = new Role(
                        rs.getInt("roleId"),
                        rs.getString("roleName"));

                account = new Account(
                        rs.getString("accountId"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getTimestamp("createdAt").toLocalDateTime(),
                        role,
                        rs.getString("avatar"));
            }
        } catch (Exception e) {
            System.out.println("getAccountById: " + e.getMessage());
        }
        return account;
    }

    // 🔹 Lấy danh sách tất cả Account
    public List<Account> getAllAccounts() {
        List<Account> accounts = new ArrayList<>();
        try {
            String strSQL = """
                        SELECT a.*, r.roleName
                        FROM Accounts a
                        JOIN Roles r ON a.roleId = r.roleId
                    """;

            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();

            while (rs.next()) {

                Role role = new Role(
                        rs.getInt("roleId"),
                        rs.getString("roleName"));

                Account account = new Account(
                        rs.getString("accountId"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getTimestamp("createdAt").toLocalDateTime(),
                        role);

                accounts.add(account);
            }
        } catch (Exception e) {
            System.out.println("getAllAccounts: " + e.getMessage());
        }
        return accounts;
    }

    // 🔹 Tìm kiếm Account theo accountId hoặc username, có thể lọc role
    public List<Account> searchAccount(String searchText, int roleId) {
        List<Account> accounts = new ArrayList<>();
        try {
            String strSQL = """
                        SELECT a.*, r.roleName
                        FROM Accounts a
                        JOIN Roles r ON a.roleId = r.roleId
                        WHERE a.accountId LIKE ? OR a.username LIKE ?
                    """;

            if (roleId > 0) {
                strSQL += " AND r.roleId = ?";
            }

            stm = connection.prepareStatement(strSQL);
            stm.setString(1, "%" + searchText + "%");
            stm.setString(2, "%" + searchText + "%");
            if (roleId > 0) {
                stm.setInt(3, roleId);
            }

            rs = stm.executeQuery();
            while (rs.next()) {
                Role role = new Role(
                        rs.getInt("roleId"),
                        rs.getString("roleName"));

                Account account = new Account(
                        rs.getString("accountId"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getTimestamp("createdAt").toLocalDateTime(),
                        role);
                accounts.add(account);
            }
        } catch (Exception e) {
            System.out.println("searchAccount: " + e.getMessage());
        }
        return accounts;
    }

    // Admin
    public boolean createAccount(Account account) {
        try {
            // Check email tồn tại
            if (getAccountByEmail(account.getEmail()) != null) {
                System.out.println("⚠️ Email đã tồn tại: " + account.getEmail());
                return false;
            }

            String strSQL = """
                        INSERT INTO Accounts (username, password, email, createdAt, roleId)
                        VALUES (?, ?, ?, ?, ?)
                    """;

            stm = connection.prepareStatement(strSQL, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, account.getUsername());
            stm.setString(2, account.getPassword());
            stm.setString(3, account.getEmail());
            stm.setTimestamp(4, Timestamp.valueOf(account.getCreatedAt()));
            stm.setInt(5, account.getRole().getRoleId());

            int rows = stm.executeUpdate();

            if (rows > 0) {
                // Lấy accountId vừa tạo (tự tăng)
                rs = stm.getGeneratedKeys();
                if (rs.next()) {
                    account.setAccountId(rs.getString(1)); // accountId kiểu String, nếu DB tự tăng INT vẫn lấy được
                }
                return true;
            }
        } catch (Exception e) {
            System.out.println("createAccount: " + e.getMessage());
        }
        return false;
    }

    // 🔹 Cập nhật Account theo accountId
    public boolean updateAccount(Account account) {
        try {
            String strSQL = """
                        UPDATE Accounts
                        SET username=?, password=?, email=?, roleId=?
                        WHERE accountId=?
                    """;
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, account.getUsername());
            stm.setString(2, account.getPassword());
            stm.setString(3, account.getEmail());
            stm.setInt(4, account.getRole().getRoleId());
            stm.setString(5, account.getAccountId());

            return stm.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("updateAccount: " + e.getMessage());
        }
        return false;
    }

    // 🔹 Cập nhật Account theo accountId, bao gồm cả avatar
    public boolean updateAccount(String accountId, String username, String email, String password, String avatar) {
        try {
            String strSQL;
            if (password == null || password.isEmpty()) {
                strSQL = """
                            UPDATE Accounts
                            SET username=?, email=?, avatar=?
                            WHERE accountId=?
                        """;
                stm = connection.prepareStatement(strSQL);
                stm.setString(1, username);
                stm.setString(2, email);
                stm.setString(3, avatar);
                stm.setString(4, accountId);
            } else {
                strSQL = """
                            UPDATE Accounts
                            SET username=?, email=?, password=?, avatar=?
                            WHERE accountId=?
                        """;
                stm = connection.prepareStatement(strSQL);
                stm.setString(1, username);
                stm.setString(2, email);
                stm.setString(3, password);
                stm.setString(4, avatar);
                stm.setString(5, accountId);
            }
            return stm.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("updateAccount: " + e.getMessage());
        }
        return false;
    }

    // 🔹 Xóa Account theo accountId
    public boolean deleteAccount(String accountId) {
        try {
            String strSQL = "DELETE FROM Accounts WHERE accountId = ?";
            stm = connection.prepareStatement(strSQL);
            stm.setString(1, accountId);
            return stm.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("deleteAccount: " + e.getMessage());
        }
        return false;
    }

}
