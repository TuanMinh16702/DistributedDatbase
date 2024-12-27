package Entity;

import java.util.*;
import java.util.stream.*;

public class GIANGVIENMANAGER {
    private List<GIANGVIEN> listGV;

    public GIANGVIENMANAGER() {
        listGV = new ArrayList<>();
    }
    
    public GIANGVIENMANAGER(List<GIANGVIEN> listGV) {
        this.listGV = listGV;
    }

    public List<GIANGVIEN> getListGV() {
        return listGV;
    }

    public void setListGV(List<GIANGVIEN> listGV) {
        this.listGV = listGV;
    }
    
    public void insertGV(GIANGVIEN gv) {
        listGV.add(gv);
    }
    
    public boolean deleteGV(String maGV) {
        GIANGVIEN gv = this.listGV.stream().filter(s -> s.getMaGV().equals(maGV)).findFirst().orElse(null);
        return this.listGV.remove(gv);
    }
    
    public GIANGVIEN searchByMaGV(String maGV) {
        return this.listGV.stream().filter(d -> d.getMaGV().equals(maGV)).findFirst().orElse(null);
    }
    
    public void clearData() {
        this.listGV.clear();
    }
}
