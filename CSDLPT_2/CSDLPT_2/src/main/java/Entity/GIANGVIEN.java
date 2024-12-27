package Entity;

public class GIANGVIEN {
    private String maGV;
    private String ho;
    private String ten;
    private String hocVi;
    private String hocHam;
    private String chuyenMon;
    private String maKhoa;

    public GIANGVIEN() {
    }

    public GIANGVIEN(String maGV, String ho, String ten, String hocVi, String hocHam, String chuyenMon, String maKhoa) {
        this.maGV = maGV;
        this.ho = ho;
        this.ten = ten;
        this.hocVi = hocVi;
        this.hocHam = hocHam;
        this.chuyenMon = chuyenMon;
        this.maKhoa = maKhoa;
    }

    public String getMaGV() {
        return maGV;
    }

    public void setMaGV(String maGV) {
        this.maGV = maGV;
    }

    public String getHo() {
        return ho;
    }

    public void setHo(String ho) {
        this.ho = ho;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getHocVi() {
        return hocVi;
    }

    public void setHocVi(String hocVi) {
        this.hocVi = hocVi;
    }

    public String getHocHam() {
        return hocHam;
    }

    public void setHocHam(String hocHam) {
        this.hocHam = hocHam;
    }

    public String getChuyenMon() {
        return chuyenMon;
    }

    public void setChuyenMon(String chuyenMon) {
        this.chuyenMon = chuyenMon;
    }

    public String getMaKhoa() {
        return maKhoa;
    }

    public void setMaKhoa(String maKhoa) {
        this.maKhoa = maKhoa;
    }
}
