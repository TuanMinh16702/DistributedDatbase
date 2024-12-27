/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author ASUS
 */
public class SinhVienManager {
    private List<SinhVien> listSinhVien;

    public SinhVienManager() {
        this.listSinhVien = new ArrayList<>();
    }

    public List<SinhVien> getListSinhVien() {
        return listSinhVien;
    }
    
    public void insertSinhVien(SinhVien sv) {
        listSinhVien.add(sv);
    }

    public void setListSinhVien(List<SinhVien> listSinhVien) {
        this.listSinhVien = listSinhVien;
    }
    
    public void deleteSinhVien(String maSV) {
        listSinhVien.forEach((sv) -> {
            if (sv.getMaSV().equals(maSV)){
                listSinhVien.remove(sv);
            }
        });
    }
    
    public void clearData() {
        this.listSinhVien.clear();
    }
}
