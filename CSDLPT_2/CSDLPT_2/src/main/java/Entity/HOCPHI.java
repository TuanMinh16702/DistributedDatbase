package Entity;

public class HOCPHI {
    private String maSV;
    private String nienKhoa;
    private int hocKy;
    private int hocPhi;

    public HOCPHI() {
    }

    public HOCPHI(String maSV, String nienKhoa, int hocKy, int hocPhi) {
        this.maSV = maSV;
        this.nienKhoa = nienKhoa;
        this.hocKy = hocKy;
        this.hocPhi = hocPhi;
    }

    public String getMaSV() {
        return maSV;
    }

    public void setMaSV(String maSV) {
        this.maSV = maSV;
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

    public int getHocPhi() {
        return hocPhi;
    }

    public void setHocPhi(int hocPhi) {
        this.hocPhi = hocPhi;
    }
}
