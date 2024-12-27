package Entity;


public class LOPTINCHI {
    private int maLTC;
    private String nienKhoa;
    private int hocKy;
    private String maMH;
    private int nhom;
    private String maGV;
    private String maKhoa;
    private int soSVTT;
    private int huyLop;

    public LOPTINCHI() {
    }

    public LOPTINCHI(int maLTC, String nienKhoa, int hocKy, String maMH, int nhom, String maGV, String maKhoa, int soSVTT, int huyLop) {
        this.maLTC = maLTC;
        this.nienKhoa = nienKhoa;
        this.hocKy = hocKy;
        this.maMH = maMH;
        this.nhom = nhom;
        this.maGV = maGV;
        this.maKhoa = maKhoa;
        this.soSVTT = soSVTT;
        this.huyLop = huyLop;
    }

    public int getMaLTC() {
        return maLTC;
    }

    public void setMaLTC(int maLTC) {
        this.maLTC = maLTC;
    }

    public String getNienKhoa() {
        return nienKhoa;
    }

    public void setNienKhoa(String nienKhoa) {
        this.nienKhoa = nienKhoa;
    }

    public int getHocKy() {
        return hocKy;
    }

    public void setHocKy(int hocKy) {
        this.hocKy = hocKy;
    }

    public String getMaMH() {
        return maMH;
    }

    public void setMaMH(String maMH) {
        this.maMH = maMH;
    }

    public int getNhom() {
        return nhom;
    }

    public void setNhom(int nhom) {
        this.nhom = nhom;
    }

    public String getMaGV() {
        return maGV;
    }

    public void setMaGV(String maGV) {
        this.maGV = maGV;
    }

    public String getMaKhoa() {
        return maKhoa;
    }

    public void setMaKhoa(String maKhoa) {
        this.maKhoa = maKhoa;
    }

    public int getSoSVTT() {
        return soSVTT;
    }

    public void setSoSVTT(int soSVTT) {
        this.soSVTT = soSVTT;
    }

    public int getHuyLop() {
        return huyLop;
    }

    public void setHuyLop(int huyLop) {
        this.huyLop = huyLop;
    }
}
