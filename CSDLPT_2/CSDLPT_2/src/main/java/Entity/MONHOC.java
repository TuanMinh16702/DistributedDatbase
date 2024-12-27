/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author TRANG TUAN MINH
 */
public class MONHOC {
    private String mamh;
    private String tenmh;
    private int stlt;
    private int stth;

    public MONHOC(String mamh, String tenmh, int stlt, int stth) {
        this.mamh = mamh;
        this.tenmh = tenmh;
        this.stlt = stlt;
        this.stth = stth;
    }

    public MONHOC() {
    }

    public String getMamh() {
        return mamh;
    }

    public String getTenmh() {
        return tenmh;
    }

    public int getStlt() {
        return stlt;
    }

    public int getStth() {
        return stth;
    }

    public void setMamh(String mamh) {
        this.mamh = mamh;
    }

    public void setTenmh(String tenmh) {
        this.tenmh = tenmh;
    }

    public void setStlt(int stlt) {
        this.stlt = stlt;
    }

    public void setStth(int stth) {
        this.stth = stth;
    }
    
}
