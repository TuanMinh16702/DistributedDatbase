/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author TRANG TUAN MINH
 */
public class LOP {
    private String maLop;
    private String tenLop;
    private String khoaHoc;
    private String maKhoa;

    public LOP() {
    }

    public LOP(String maLop, String tenLop, String khoaHoc, String maKhoa) {
        this.maLop = maLop;
        this.tenLop = tenLop;
        this.khoaHoc = khoaHoc;
        this.maKhoa = maKhoa;
    }

    public String getMaLop() {
        return maLop;
    }

    public String getTenLop() {
        return tenLop;
    }

    public String getKhoaHoc() {
        return khoaHoc;
    }

    public String getMaKhoa() {
        return maKhoa;
    }

    public void setMaLop(String maLop) {
        this.maLop = maLop;
    }

    public void setTenLop(String tenLop) {
        this.tenLop = tenLop;
    }

    public void setKhoaHoc(String khoaHoc) {
        this.khoaHoc = khoaHoc;
    }

    public void setMaKhoa(String maKhoa) {
        this.maKhoa = maKhoa;
    }
}
