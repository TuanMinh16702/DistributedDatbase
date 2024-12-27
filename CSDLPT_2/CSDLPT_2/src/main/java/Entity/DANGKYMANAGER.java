package Entity;

import java.util.*;
import java.util.stream.*;

public class DANGKYMANAGER {
    private List<DANGKY> listDK;

    public DANGKYMANAGER() {
        listDK = new ArrayList<>();
    }
    
    public DANGKYMANAGER(List<DANGKY> listDK) {
        this.listDK = listDK;
    }

    public List<DANGKY> getListDK() {
        return listDK;
    }

    public void setListDK(List<DANGKY> listDK) {
        this.listDK = listDK;
    }
    
    public void insertDK(DANGKY dk) {
        listDK.add(dk);
    }
    
    public boolean deleteDK(String maLTC, String maSV) {
        List<DANGKY> listMLTC = this.listDK.stream().filter(s -> s.getMaLTC().equals(maLTC)).collect(Collectors.toList());
        DANGKY dk = listMLTC.stream().filter(s -> s.getMaSV().equals(maSV)).findFirst().orElse(null);
        return this.listDK.remove(dk);
    }
    
    public List<DANGKY> searchByMaLTC(String maLTC) {
        return this.listDK.stream().filter(d -> d.getMaLTC().equals(maLTC)).collect(Collectors.toList());
    }
    
    public List<DANGKY> searchByMaSV(String maSV) {
        return this.listDK.stream().filter(d -> d.getMaSV().equals(maSV)).collect(Collectors.toList());
    }
    
    public DANGKY searhbyDK(String maLTC, String maSV) {
        List<DANGKY> listMLTC = this.listDK.stream().filter(s -> s.getMaLTC().equals(maLTC)).collect(Collectors.toList());
        return listMLTC.stream().filter(s -> s.getMaSV().equals(maSV)).findFirst().orElse(null);
    }
    
    public void clearData() {
        this.listDK.clear();
    }
}
