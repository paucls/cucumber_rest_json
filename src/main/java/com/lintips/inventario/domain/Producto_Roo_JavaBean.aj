// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lintips.inventario.domain;

import com.lintips.inventario.domain.Producto;

privileged aspect Producto_Roo_JavaBean {
    
    public int Producto.getIdProducto() {
        return this.idProducto;
    }
    
    public void Producto.setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }
    
    public String Producto.getNombre() {
        return this.nombre;
    }
    
    public void Producto.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String Producto.getDescripcion() {
        return this.descripcion;
    }
    
    public void Producto.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public double Producto.getPrecio() {
        return this.precio;
    }
    
    public void Producto.setPrecio(double precio) {
        this.precio = precio;
    }
    
}
