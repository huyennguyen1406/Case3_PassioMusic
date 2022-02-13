package model;

import java.util.Date;

public class Bill {
    private int idBill;
    private int idCart;
    private Date dateCreate;

    public Bill() {
    }

    public Bill(int idBill, int idCart, Date dateCreate) {
        this.idBill = idBill;
        this.idCart = idCart;
        this.dateCreate = dateCreate;
    }

    public int getIdBill() {
        return idBill;
    }

    public void setIdBill(int idBill) {
        this.idBill = idBill;
    }

    public int getIdCart() {
        return idCart;
    }

    public void setIdCart(int idCart) {
        this.idCart = idCart;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }
}
