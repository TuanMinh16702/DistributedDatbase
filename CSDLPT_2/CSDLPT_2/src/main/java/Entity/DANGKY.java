package Entity;

public class DANGKY {
    private String maLTC;
    private String maSV;
    private int diemCC;
    private float diemGK;
    private float diemCK;
    private int huyDK;

    public DANGKY() {
    }

    public DANGKY(String maLTC, String maSV, int diemCC, float diemGK, float diemCK, int huyDK) {
        this.maLTC = maLTC;
        this.maSV = maSV;
        this.diemCC = diemCC;
        this.diemGK = diemGK;
        this.diemCK = diemCK;
        this.huyDK = huyDK;
    }

    public String getMaLTC() {
        return maLTC;
    }

    public void setMaLTC(String maLTC) {
        this.maLTC = maLTC;
    }

    public String getMaSV() {
        return maSV;
    }

    public void setMaSV(String maSV) {
        this.maSV = maSV;
    }

    public int getDiemCC() {
        return diemCC;
    }

    public void setDiemCC(int diemCC) {
        this.diemCC = diemCC;
    }

    public float getDiemGK() {
        return diemGK;
    }

    public void setDiemGK(float diemGK) {
        this.diemGK = diemGK;
    }

    public float getDiemCK() {
        return diemCK;
    }

    public void setDiemCK(float diemCK) {
        this.diemCK = diemCK;
    }

    public int getHuyDK() {
        return huyDK;
    }

    public void setHuyDK(int huyDK) {
        this.huyDK = huyDK;
    }
}
