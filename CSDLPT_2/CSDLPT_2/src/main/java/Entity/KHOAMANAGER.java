package Entity;

import java.util.*;
import java.util.stream.*;

public class KHOAMANAGER {
    private List<KHOA> listK;

    public KHOAMANAGER() {
        listK = new ArrayList<>();
    }
    
    public KHOAMANAGER(List<KHOA> listK) {
        this.listK = listK;
    }

    public List<KHOA> getListK() {
        return listK;
    }

    public void setListK(List<KHOA> listK) {
        this.listK = listK;
    }
    
    public void insertK(KHOA k) {
        listK.add(k);
    }
    
    public boolean deleteK(String maKhoa) {
        KHOA kh = this.listK.stream().filter(d -> d.getMaKhoa().equals(maKhoa)).findFirst().orElse(null);
        return this.listK.remove(kh);
    }
    
    public KHOA searchK(String maKhoa) {
        return this.listK.stream().filter(d -> d.getMaKhoa().equals(maKhoa)).findFirst().orElse(null);
    }
    
    public void clearData() {
        for (int i = 0; i < this.listK.size(); i++) {
            this.listK.remove(i);
        }
    }
}
