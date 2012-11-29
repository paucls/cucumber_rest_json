Feature: Listar Productos
  Como cliente
  Quiero poder listar los diferentes productos
  Para comparar precios
  
  Background:
  	Given los siguientes productos existen:
  	| nombre | descripcion		    | precio |
  	| iphone | Smartphone iOS	    | 100.0  |
  	| galaxy | Smartphone Android | 200.0  |
  	| nokia  | Smartphone Win.8   | 300.0  |
  
  Scenario: Listar todos los productos
	 When the client requests GET /inventario/productoes
	 Then the response should be JSON:
	 """
   [
		 {nombre: iphone, descripcion: Smartphone iOS, precio: 100.0}
		,{nombre: galaxy, descripcion: Smartphone Android, precio: 200.0}
		,{nombre: nokia, descripcion: Smartphone Win.8, precio: 300.0}
	 ]
	 """