/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;


import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TRANG TUAN MINH
 */
public class LOPMANAGER {
    List<LOP> listLOP;
    
    public LOPMANAGER() {
        listLOP = new ArrayList<>();
    }

    public LOPMANAGER(List<LOP> listLOP) {
        this.listLOP = listLOP;
    }

    public List<LOP> getListLOP() {
        return listLOP;
    }

    public void setListLOP(List<LOP> listLOP) {
        this.listLOP = listLOP;
    }
    
    public void insertLOP(LOP lop) {
        listLOP.add(lop);
    }
    
    public boolean deleteLOP(String maLOP) {
        LOP lop = this.listLOP.stream().filter(h -> h.getMaLop().equals(maLOP)).findFirst().orElse(null);
        return this.listLOP.remove(lop);
    }
    
    public LOP searchByMaLOP(String maLOP) {
        return this.listLOP.stream().filter(p -> p.getMaLop().equals(maLOP)).findFirst().orElse(null);
    }
    
    public void clearData() {
        this.listLOP.clear();
    }
}
