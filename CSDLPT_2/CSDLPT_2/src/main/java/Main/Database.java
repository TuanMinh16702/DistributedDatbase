/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Main;

import Entity.DANGKY;
import Entity.DANGKYMANAGER;
import Entity.GIANGVIEN;
import Entity.GIANGVIENMANAGER;
import Entity.LOP;
import Entity.LOPMANAGER;
import Entity.LOPTINCHI;
import Entity.LOPTINCHIMANAGER;
import Entity.MONHOC;
import Entity.MONHOCMANAGER;
import Entity.SinhVien;
import Entity.SinhVienManager;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class Database {
    private final String connectionString = "jdbc:sqlserver://localhost:1433;databaseName=QLDSV_TC;encrypt=true;trustServerCertificate=true;";
    private final String connectionUsername = "sa";
    private final String connectionPassword = "123";
    private final String tksv_username = "TKSV";
    private final String tksv_password = "123";
    private final String connectionInstance = "instance=MSI;";
    
    private HashMap<String, String> servers;
    private HashMap<String, String> ports;
    private Connection connection;
    private Statement statement;
    private String currentServer;
    private String currentServerName;
    
    private SinhVienManager sinhVienManager;
    private GIANGVIENMANAGER giangVienManager;
    private LOPMANAGER lopManager;
    private LOPTINCHIMANAGER lopTinChiManager;
    private MONHOCMANAGER monHocManager;
    private DANGKYMANAGER dangKyManager;
    
    public Database() throws SQLException {
        sinhVienManager = new SinhVienManager();
        giangVienManager = new GIANGVIENMANAGER();
        lopManager = new LOPMANAGER();
        lopTinChiManager = new LOPTINCHIMANAGER();
        monHocManager = new MONHOCMANAGER();
        dangKyManager = new DANGKYMANAGER();
        servers = new HashMap<>();
        ports = new HashMap<>();
        getAllSubcriberServers();
    }

    public HashMap<String, String> getServers() {
        return servers;
    }

    public Connection getConnection() {
        return connection;
    }

    public Statement getStatement() {
        return statement;
    }
    
    public void getAllSubcriberServers() throws SQLException{
        Connection conn = null;
        conn = DriverManager.getConnection(connectionString + connectionInstance, connectionUsername, connectionPassword);
        if (conn != null) {
            String allSubcriberServers = "{call sp_getSubcriberServer}";
            CallableStatement stmt = conn.prepareCall(allSubcriberServers);
            boolean isSuccess = stmt.execute();
            if (isSuccess) {
                ResultSet rs = stmt.getResultSet();
                while(rs.next()) {
                    servers.put(rs.getString("TENKHOA"), rs.getString("TENSERVER"));
                    ports.put(rs.getString("TENKHOA"), String.valueOf(1433 + rs.getRow()));
                }
            }
            conn.close();
        }
    }
    
    public boolean connectingToSQLServer(String site, String username, String password){
        if (this.connection != null){
            try {
                this.connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.currentServer = servers.get(site);
        this.currentServerName = site;
        String newConnectionString = connectionString.replace("1433", ports.get(site)) + "instance=" + servers.get(site).replace("\\", "\\\\");
        
        try {
            connection = DriverManager.getConnection(newConnectionString, username, password);
            this.statement = this.connection.createStatement();
            return true;
        } catch (SQLException ex) {
            try {
                connection = DriverManager.getConnection(newConnectionString, tksv_username, tksv_password);
                this.statement = this.connection.createStatement();
                if (connection != null) {
                    String query = "EXEC QLDSV_TC.DBO.SP_TimSV '" + username + "'";
                    ResultSet rs = this.statement.executeQuery(query);
                    while(rs.next()) {
                        if (rs.getString("PASSWORD").equals(password)){
                            return true;
                        } else {
                            connection.close();
                        }
                    }
                }
            } catch (SQLException ex1) {
                Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
        return false;
    }
    
    public void loadListSinhVien() throws SQLException {
        String allSinhVien = "Select * from view_getAllSinhVien";
        ResultSet rs = this.statement.executeQuery(allSinhVien);
        while(rs.next()) {
            SinhVien sv = new SinhVien();
            sv.setMaSV(rs.getString("MASV"));
            sv.setHo(rs.getString("HO"));
            sv.setTen(rs.getString("TEN"));
            sv.setPhai(rs.getInt("PHAI"));
            sv.setDiaChi(rs.getString("DIACHI"));
            sv.setNgaySinh(rs.getDate("NGAYSINH").toLocalDate());
            sv.setMaLop(rs.getString("MALOP"));
            sv.setDaNghiHoc(rs.getInt("DANGHIHOC"));
            sv.setPassword(rs.getString("PASSWORD"));
            sinhVienManager.insertSinhVien(sv);
        }
    }
    
    public void loadListGiangVien() throws SQLException {
        String allGiangVien = "Select * from view_getAllGiangVien";
        ResultSet rs = this.statement.executeQuery(allGiangVien);
        while(rs.next()) {
            GIANGVIEN gv = new GIANGVIEN();
            gv.setMaGV(rs.getString("MAGV"));
            gv.setMaKhoa(rs.getString("MAKHOA"));
            gv.setHo(rs.getString("HO"));
            gv.setTen(rs.getString("TEN"));
            gv.setHocVi(rs.getString("HOCVI"));
            gv.setHocHam(rs.getString("HOCHAM"));
            gv.setChuyenMon(rs.getString("CHUYENMON"));
            giangVienManager.insertGV(gv);
        }
    }
    
    public void loadListLop() throws SQLException {
        String allLop = "Select * from view_getAllLop";
        ResultSet rs = this.statement.executeQuery(allLop);
        while(rs.next()) {
            LOP lop = new LOP();
            lop.setMaLop(rs.getString("MALOP"));
            lop.setTenLop(rs.getString("TENLOP"));
            lop.setKhoaHoc(rs.getString("KHOAHOC"));
            lop.setMaKhoa(rs.getString("MAKHOA"));
            lopManager.insertLOP(lop);
        }
    }
    
    public void loadListLopTinChi() throws SQLException {
        String allLopTinChi = "Select * from view_getAllLopTinChi";
        ResultSet rs = this.statement.executeQuery(allLopTinChi);
        while(rs.next()) {
            LOPTINCHI ltc = new LOPTINCHI();
            ltc.setMaLTC(rs.getInt("MALTC"));
            ltc.setNienKhoa(rs.getString("NIENKHOA"));
            ltc.setHocKy(rs.getInt("HOCKY"));
            ltc.setMaMH(rs.getString("MAMH"));
            ltc.setNhom(rs.getInt("NHOM"));
            ltc.setMaGV(rs.getString("MAGV"));
            ltc.setMaKhoa(rs.getString("MAKHOA"));
            ltc.setSoSVTT(rs.getInt("SOSVTOITHIEU"));
            ltc.setHuyLop(rs.getInt("HUYLOP"));
            lopTinChiManager.insertLTC(ltc);
        }
    }
    
    public void loadListMonHoc() throws SQLException {
        String allMonHoc = "Select * from view_getAllMonHoc";
        ResultSet rs = this.statement.executeQuery(allMonHoc);
        while(rs.next()) {
            MONHOC mh = new MONHOC();
            mh.setMamh(rs.getString("MAMH"));
            mh.setTenmh(rs.getString("TENMH"));
            mh.setStlt(rs.getInt("SOTIET_LT"));
            mh.setStth(rs.getInt("SOTIET_TH"));
            monHocManager.insertMONHOC(mh);
        }
    }
    
    public void loadListDangKy() throws SQLException {
        String allDangKy = "Select * from view_getAllDangKy";
        ResultSet rs = this.statement.executeQuery(allDangKy);
        while(rs.next()) {
            DANGKY dk = new DANGKY();
            dk.setMaLTC(rs.getString("MALTC"));
            dk.setMaSV(rs.getString("MASV"));
            dk.setDiemCC(rs.getInt("DIEM_CC"));
            dk.setDiemGK(rs.getInt("DIEM_GK"));
            dk.setDiemCK(rs.getInt("DIEM_CK"));
            dk.setHuyDK(rs.getInt("HUYDANGKY"));
            dangKyManager.insertDK(dk);
        }
    }
    
    public void clearAllData() {
        this.sinhVienManager.clearData();
        this.giangVienManager.clearData();
        this.lopManager.clearData();
        this.lopTinChiManager.clearData();
        this.monHocManager.clearData();
        this.dangKyManager.clearData();
        System.out.println("All Data cleared.");
    }
    
    

    public SinhVienManager getSinhVienManager() {
        return sinhVienManager;
    }

    public GIANGVIENMANAGER getGiangVienManager() {
        return giangVienManager;
    }

    public LOPMANAGER getLopManager() {
        return lopManager;
    }

    public LOPTINCHIMANAGER getLopTinChiManager() {
        return lopTinChiManager;
    }

    public MONHOCMANAGER getMonHocManager() {
        return monHocManager;
    }

    public DANGKYMANAGER getDangKyManager() {
        return dangKyManager;
    }

    public String getCurrentServer() {
        return currentServer;
    }

    public String getCurrentServerName() {
        return currentServerName;
    }
}
