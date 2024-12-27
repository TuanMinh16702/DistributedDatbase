/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author ASUS
 */
public class User {
    private String username;
    private String maGV;
    private String databaseRole;

    public User() {
    }

    public User(String username, String maGV, String databaseRole) {
        this.username = username;
        this.maGV = maGV;
        this.databaseRole = databaseRole;
    }

    public String getUsername() {
        return username;
    }

    public String getMaGV() {
        return maGV;
    }

    public String getDatabaseRole() {
        return databaseRole;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setMaGV(String maGV) {
        this.maGV = maGV;
    }

    public void setDatabaseRole(String databaseRole) {
        this.databaseRole = databaseRole;
    }
}
