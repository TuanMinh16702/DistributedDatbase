package Entity;

import java.util.*;
import java.util.stream.*;

public class CT_DONGHOCPHIMANAGER {
    private List<CT_DONGHOCPHI> listCTDHP;

    public CT_DONGHOCPHIMANAGER() {
        listCTDHP = new ArrayList<>();
    }

    public CT_DONGHOCPHIMANAGER(List<CT_DONGHOCPHI> listCTDHP) {
        this.listCTDHP = listCTDHP;
    }

    public List<CT_DONGHOCPHI> getListCTDHP() {
        return listCTDHP;
    }

    public void setListCTDHP(List<CT_DONGHOCPHI> listCTDHP) {
        this.listCTDHP = listCTDHP;
    }
    
    public void insertCTDHP(CT_DONGHOCPHI ct) {
        listCTDHP.add(ct);
    }
    
    public boolean deleteCTDHP(String maSV, String nienKhoa, int hocKy, Date ngayDong) {
        List<CT_DONGHOCPHI> listmaSV = this.listCTDHP.stream().filter(d -> d.getMaSV().equals(maSV)).collect(Collectors.toList());
        List<CT_DONGHOCPHI> listnienKhoa = listmaSV.stream().filter(d -> d.getNienKhoa().equals(nienKhoa)).collect(Collectors.toList());
        List<CT_DONGHOCPHI> listhocKy = listnienKhoa.stream().filter(d -> d.getHocKy() == hocKy).collect(Collectors.toList());
        CT_DONGHOCPHI cthp = listhocKy.stream().filter(d -> d.getNgayDong().equals(ngayDong)).findFirst().orElse(null);
        return this.listCTDHP.remove(cthp);
    }
    
    public List<CT_DONGHOCPHI> searchByMaSV(String maSV) {
        return this.listCTDHP.stream().filter(d -> d.getMaSV().equals(maSV)).collect(Collectors.toList());
    }
    
    public List<CT_DONGHOCPHI> searchByNienKhoa(String nienKhoa) {
        return this.listCTDHP.stream().filter(d -> d.getNienKhoa().equals(nienKhoa)).collect(Collectors.toList());
    }
    
    public List<CT_DONGHOCPHI> searchByHocKy(int hocKy) {
        return this.listCTDHP.stream().filter(d -> d.getHocKy() == hocKy).collect(Collectors.toList());
    }
    
    public List<CT_DONGHOCPHI> searchByNgayDong(Date ngayDong) {
        return this.listCTDHP.stream().filter(d -> d.getNgayDong().equals(ngayDong)).collect(Collectors.toList());
    }
    
    public CT_DONGHOCPHI searchByCTDHP(String maSV, String nienKhoa, int hocKy, Date ngayDong) {
        List<CT_DONGHOCPHI> listmaSV = this.listCTDHP.stream().filter(d -> d.getMaSV().equals(maSV)).collect(Collectors.toList());
        List<CT_DONGHOCPHI> listnienKhoa = listmaSV.stream().filter(d -> d.getNienKhoa().equals(nienKhoa)).collect(Collectors.toList());
        List<CT_DONGHOCPHI> listhocKy = listnienKhoa.stream().filter(d -> d.getHocKy() == hocKy).collect(Collectors.toList());
        return listhocKy.stream().filter(d -> d.getNgayDong().equals(ngayDong)).findFirst().orElse(null);
    }
    
    public void clearData() {
        for (int i = 0; i < this.listCTDHP.size(); i++) {
            this.listCTDHP.remove(i);
        }
    }
}
