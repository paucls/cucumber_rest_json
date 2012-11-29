// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lintips.inventario.domain;

import com.lintips.inventario.domain.Producto;
import com.lintips.inventario.domain.ProductoDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ProductoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProductoDataOnDemand: @Component;
    
    private Random ProductoDataOnDemand.rnd = new SecureRandom();
    
    private List<Producto> ProductoDataOnDemand.data;
    
    public Producto ProductoDataOnDemand.getNewTransientProducto(int index) {
        Producto obj = new Producto();
        setDescripcion(obj, index);
        setIdProducto(obj, index);
        setNombre(obj, index);
        setPrecio(obj, index);
        return obj;
    }
    
    public void ProductoDataOnDemand.setDescripcion(Producto obj, int index) {
        String descripcion = "descripcion_" + index;
        obj.setDescripcion(descripcion);
    }
    
    public void ProductoDataOnDemand.setIdProducto(Producto obj, int index) {
        int idProducto = index;
        obj.setIdProducto(idProducto);
    }
    
    public void ProductoDataOnDemand.setNombre(Producto obj, int index) {
        String nombre = "nombre_" + index;
        obj.setNombre(nombre);
    }
    
    public void ProductoDataOnDemand.setPrecio(Producto obj, int index) {
        double precio = new Integer(index).doubleValue();
        obj.setPrecio(precio);
    }
    
    public Producto ProductoDataOnDemand.getSpecificProducto(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Producto obj = data.get(index);
        Long id = obj.getId();
        return Producto.findProducto(id);
    }
    
    public Producto ProductoDataOnDemand.getRandomProducto() {
        init();
        Producto obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Producto.findProducto(id);
    }
    
    public boolean ProductoDataOnDemand.modifyProducto(Producto obj) {
        return false;
    }
    
    public void ProductoDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Producto.findProductoEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Producto' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Producto>();
        for (int i = 0; i < 10; i++) {
            Producto obj = getNewTransientProducto(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
