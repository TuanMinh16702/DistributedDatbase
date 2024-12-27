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
public class MONHOCMANAGER {
     List<MONHOC> listMONHOC;
    
    public MONHOCMANAGER() {
        listMONHOC = new ArrayList<>();
    }

    public MONHOCMANAGER(List<MONHOC> listMONHOC) {
        this.listMONHOC = listMONHOC;
    }

    public List<MONHOC> getListMONHOC() {
        return listMONHOC;
    }

    public void setListMONHOC(List<MONHOC> listMONHOC) {
        this.listMONHOC = listMONHOC;
    }
    
    public void insertMONHOC(MONHOC monhoc) {
        listMONHOC.add(monhoc);
    }
    
    public boolean deleteMONHOC(String maMH) {
        MONHOC monhoc = this.listMONHOC.stream().filter(h -> h.getMamh().equals(maMH)).findFirst().orElse(null);
        return this.listMONHOC.remove(monhoc);
    }
    
    public MONHOC searchByMaLOP(String maMH) {
        return this.listMONHOC.stream().filter(p -> p.getMamh().equals(maMH)).findFirst().orElse(null);
    }
    
    public void clearData() {
        this.listMONHOC.clear();
    }
}
