package Entity;

import java.util.*;
import java.util.stream.*;

public class HOCPHIMANAGER {
    private List<HOCPHI> listHP;

    public HOCPHIMANAGER() {
        listHP = new ArrayList<>();
    }
    
    public HOCPHIMANAGER(List<HOCPHI> listHP) {
        this.listHP = listHP;
    }

    public List<HOCPHI> getListHP() {
        return listHP;
    }

    public void setListHP(List<HOCPHI> listHP) {
        this.listHP = listHP;
    }
    
    public void insertHP(HOCPHI hp) {
        listHP.add(hp);
    }
    
    public boolean deleteHP(String maSV, String nienKhoa, int hocKy) {
        List<HOCPHI> listmaSV = this.listHP.stream().filter(d -> d.getMaSV().equals(maSV)).collect(Collectors.toList());
        List<HOCPHI> listnienkhoa = listmaSV.stream().filter(d -> d.getNienKhoa().equals(nienKhoa)).collect(Collectors.toList());
        HOCPHI hp = listnienkhoa.stream().filter(d -> d.getHocKy() == hocKy).findFirst().orElse(null);
        return this.listHP.remove(hp);
    }
    
    public List<HOCPHI> searchByMaSV(String maSV) {
        return this.listHP.stream().filter(d -> d.getMaSV().equals(maSV)).collect(Collectors.toList());
    }
    
    public List<HOCPHI> searchByNienKhoa(String nienKhoa) {
        return this.listHP.stream().filter(d -> d.getNienKhoa().equals(nienKhoa)).collect(Collectors.toList());
    }
    
    public List<HOCPHI> searchByHocKy(int hocKy) {
        return this.listHP.stream().filter(d -> d.getHocKy() == hocKy).collect(Collectors.toList());
    }
    
    public HOCPHI searchHP(String maSV, String nienKhoa, int hocKy) {
        List<HOCPHI> listmaSV = this.listHP.stream().filter(d -> d.getMaSV().equals(maSV)).collect(Collectors.toList());
        List<HOCPHI> listnienkhoa = listmaSV.stream().filter(d -> d.getNienKhoa().equals(nienKhoa)).collect(Collectors.toList());
        return listnienkhoa.stream().filter(d -> d.getHocKy() == hocKy).findFirst().orElse(null);
    }
    
    public void clearData() {
        for (int i = 0; i < this.listHP.size(); i++) {
            this.listHP.remove(i);
        }
    }
}
