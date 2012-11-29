package com.lintips.inventario.web;

import com.lintips.inventario.domain.Producto;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebJson(jsonObject = Producto.class)
@Controller
@RequestMapping("/productoes")
public class ProductoController {
}
