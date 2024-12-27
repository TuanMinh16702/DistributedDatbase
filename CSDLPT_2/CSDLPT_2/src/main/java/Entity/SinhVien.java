/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.time.LocalDate;

/**
 *
 * @author ASUS
 */
public class SinhVien {
    private String maSV;
    private String ho;
    private String ten;
    private int phai;
    private String diaChi;
    private LocalDate ngaySinh;
    private String maLop;
    private int daNghiHoc;
    private String password;

    public SinhVien() {
    }

    public SinhVien(String maSV, String ho, String ten, int phai, String diaChi, LocalDate ngaySinh, String maLop, int daNghiHoc, String password) {
        this.maSV = maSV;
        this.ho = ho;
        this.ten = ten;
        this.phai = phai;
        this.diaChi = diaChi;
        this.ngaySinh = ngaySinh;
        this.maLop = maLop;
        this.daNghiHoc = daNghiHoc;
        this.password = password;
    }

    public String getMaSV() {
        return maSV;
    }

    public String getHo() {
        return ho;
    }

    public String getTen() {
        return ten;
    }

    public int getPhai() {
        return phai;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public LocalDate getNgaySinh() {
        return ngaySinh;
    }

    public String getMaLop() {
        return maLop;
    }

    public int getDaNghiHoc() {
        return daNghiHoc;
    }

    public String getPassword() {
        return password;
    }

    public void setMaSV(String maSV) {
        this.maSV = maSV;
    }

    public void setHo(String ho) {
        this.ho = ho;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public void setPhai(int phai) {
        this.phai = phai;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public void setNgaySinh(LocalDate ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public void setMaLop(String maLop) {
        this.maLop = maLop;
    }

    public void setDaNghiHoc(int daNghiHoc) {
        this.daNghiHoc = daNghiHoc;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
