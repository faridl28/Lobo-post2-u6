package com.universidad.mvc.model;

public class Producto implements java.io.Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private String nombre;
    private String categoria;
    private double precio;
    private int stock;

    public Producto() {}

    public Producto(int id, String nombre, String categoria,
                    double precio, int stock) {
        this.id = id;
        this.nombre = nombre;
        this.categoria = categoria;
        this.precio = precio;
        this.stock = stock;
    }

    public int getId()                 { return id; }
    public void setId(int id)          { this.id = id; }
    public String getNombre()          { return nombre; }
    public void setNombre(String n)    { this.nombre = n; }
    public String getCategoria()       { return categoria; }
    public void setCategoria(String c) { this.categoria = c; }
    public double getPrecio()          { return precio; }
    public void setPrecio(double p)    { this.precio = p; }
    public int getStock()              { return stock; }
    public void setStock(int s)        { this.stock = s; }
}