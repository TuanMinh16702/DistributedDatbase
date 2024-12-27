/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Main;

import Entity.User;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;

/**
 *
 * @author ASUS
 */
public class Variables {
    private final String PHONG_GIAO_VU = "PGV";
    private final String KHOA = "KHOA";
    private final String SINH_VIEN = "SV";
    private final String PHONG_KE_TOAN = "PKT";
    private final String KHOA_CNTT_NAME = "KHOA CNTT";
    private final String KHOA_VT_NAME = "KHOA VT";
    private final String PHONG_KE_TOAN_NAME = "Phòng kế toán";
    private final String CNTT_TO_VT_LINK = "LINK1";
    private final String VT_TO_CNTT_LINK = "LINK2";
    private final String TEXT_MALE = "Nam";
    private final String TEXT_FEMALE = "Nữ";
    
    private final int MALE = 0;
    private final int FEMALE = 1;
    private final int DA_NGHI_HOC = 1;
    private final int CHUA_NGHI_HOC = 0;
    private final int CHI_PHI_MOT_TIET = 40000;
    
    private final String[] LIST_ROLES = {"PGV", "KHOA"};
    
    private final DateTimeFormatter SQL_DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    private HashMap<String, String> departments;
    
    private Database database;
    private User user;

    public Variables() throws SQLException {
        this.database = new Database();
        this.user = new User();
        setUpDepartments();
    }

    public Database getDatabase() {
        return database;
    }
    
    public User getUser(){
        return user;
    }

    public String getPHONG_GIAO_VU() {
        return PHONG_GIAO_VU;
    }

    public String getKHOA() {
        return KHOA;
    }

    public String getSINH_VIEN() {
        return SINH_VIEN;
    }
    
    public void setUpDepartments() {
        this.departments = new HashMap<>();
        this.departments.put("PGV", "Phòng giáo vụ");
        this.departments.put("KHOA", "Khoa");
        this.departments.put("SV", "Sinh viên");
        this.departments.put("PKT", "Phòng kế toán");
    }

    public HashMap<String, String> getDepartments() {
        return departments;
    }

    public String getKHOA_CNTT_NAME() {
        return KHOA_CNTT_NAME;
    }

    public String getKHOA_VT_NAME() {
        return KHOA_VT_NAME;
    }

    public String getPHONG_KE_TOAN_NAME() {
        return PHONG_KE_TOAN_NAME;
    }
    
    public String getLink (String currentServerName, String selectedKhoa) {
        if (currentServerName.equals(this.KHOA_CNTT_NAME) && selectedKhoa.equals(this.KHOA_VT_NAME)){
            return this.CNTT_TO_VT_LINK;
        }
        
        if (currentServerName.equals(this.KHOA_VT_NAME) && selectedKhoa.equals(this.KHOA_CNTT_NAME)){
            return this.VT_TO_CNTT_LINK;
        }
        
        return null;
    }

    public int getMALE() {
        return MALE;
    }

    public int getFEMALE() {
        return FEMALE;
    }

    public String getTEXT_MALE() {
        return TEXT_MALE;
    }

    public String getTEXT_FEMALE() {
        return TEXT_FEMALE;
    }

    public int getDA_NGHI_HOC() {
        return DA_NGHI_HOC;
    }

    public int getCHUA_NGHI_HOC() {
        return CHUA_NGHI_HOC;
    }

    public DateTimeFormatter getSQL_DATE_TIME_FORMATTER() {
        return SQL_DATE_TIME_FORMATTER;
    }

    public int getCHI_PHI_MOT_TIET() {
        return CHI_PHI_MOT_TIET;
    }

    public String[] getLIST_ROLES() {
        return LIST_ROLES;
    }

    public String getPHONG_KE_TOAN() {
        return PHONG_KE_TOAN;
    }
}
