package Entity;

import java.util.Date;

public class CT_DONGHOCPHI {
    private String maSV;
    private String nienKhoa;
    private int hocKy;
    private Date ngayDong;
    private float soTienDong;

    public CT_DONGHOCPHI() {
    }

    public CT_DONGHOCPHI(String maSV, String nienKhoa, int hocKy, Date ngayDong, float soTienDong) {
        this.maSV = maSV;
        this.nienKhoa = nienKhoa;
        this.hocKy = hocKy;
        this.ngayDong = ngayDong;
        this.soTienDong = soTienDong;
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

    public Date getNgayDong() {
        return ngayDong;
    }

    public void setNgayDong(Date ngayDong) {
        this.ngayDong = ngayDong;
    }

    public float getSoTienDong() {
        return soTienDong;
    }

    public void setSoTienDong(float soTienDong) {
        this.soTienDong = soTienDong;
    }
}
