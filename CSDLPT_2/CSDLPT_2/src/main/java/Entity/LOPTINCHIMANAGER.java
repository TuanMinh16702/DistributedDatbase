package Entity;

import java.util.*;
import java.util.stream.*;

public class LOPTINCHIMANAGER {
    private List<LOPTINCHI> listLTC;

    public LOPTINCHIMANAGER() {
        listLTC = new ArrayList<>();
    }

    public LOPTINCHIMANAGER(List<LOPTINCHI> listLTC) {
        this.listLTC = listLTC;
    }

    public List<LOPTINCHI> getListLTC() {
        return listLTC;
    }

    public void setListLTC(List<LOPTINCHI> listLTC) {
        this.listLTC = listLTC;
    }
    
    public void insertLTC(LOPTINCHI ltc) {
        listLTC.add(ltc);
    }
    
    public boolean deleteLTC(String nienKhoa, int hocKy, String maMH, int nhom) {
        List<LOPTINCHI> listnienKhoa = this.listLTC.stream().filter(d -> d.getNienKhoa().equals(nienKhoa)).collect(Collectors.toList());
        List<LOPTINCHI> listhocKy = listnienKhoa.stream().filter(d -> d.getHocKy() == hocKy).collect(Collectors.toList());
        List<LOPTINCHI> listmaMH = listhocKy.stream().filter(d -> d.getMaMH().equals(maMH)).collect(Collectors.toList());
        LOPTINCHI ltc = listmaMH.stream().filter(d -> d.getNhom() == nhom).findFirst().orElse(null);
        return this.listLTC.remove(ltc);
    }
    
    public List<LOPTINCHI> searchByNienKhoa(String nienKhoa) {
        return this.listLTC.stream().filter(d -> d.getNienKhoa().equals(nienKhoa)).collect(Collectors.toList());
    }
    
    public List<LOPTINCHI> searchByHocKy(int hocKy) {
        return this.listLTC.stream().filter(d -> d.getHocKy() == hocKy).collect(Collectors.toList());
    }
    
    public List<LOPTINCHI> searchByMaMH(String maMH) {
        return this.listLTC.stream().filter(d -> d.getMaMH().equals(maMH)).collect(Collectors.toList());
    }
    
    public List<LOPTINCHI> searchByNhom(int nhom) {
        return this.listLTC.stream().filter(d -> d.getNhom() == nhom).collect(Collectors.toList());
    }
    
    public LOPTINCHI searchByLTC(String nienKhoa, int hocKy, String maMH, int nhom) {
        List<LOPTINCHI> listnienKhoa = this.listLTC.stream().filter(d -> d.getNienKhoa().equals(nienKhoa)).collect(Collectors.toList());
        List<LOPTINCHI> listhocKy = listnienKhoa.stream().filter(d -> d.getHocKy() == hocKy).collect(Collectors.toList());
        List<LOPTINCHI> listmaMH = listhocKy.stream().filter(d -> d.getMaMH().equals(maMH)).collect(Collectors.toList());
        return listmaMH.stream().filter(d -> d.getNhom() == nhom).findFirst().orElse(null);
    }
    
    public void clearData() {
        this.listLTC.clear();
    }
}
