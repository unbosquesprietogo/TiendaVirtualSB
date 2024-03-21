package com.BO.TiendaVirtualSB;

import java.util.ArrayList;
import java.util.List;

import com.DAO.TiendaVirtualSB.*;
import com.DTO.TiendaVirtualSB.*;
import org.springframework.web.bind.annotation.*;

@RestController
public class ClienteController {
	@CrossOrigin("*")
	@RequestMapping("/registrarCliente")
	public void registrarCliente(ClienteVO cli) 
	 {
		ClienteDAO Dao=new ClienteDAO(); 
	    Dao.registrarCliente(cli);	    
	 }	 
	/**
	 * permite consultar el Cliente asociado al documento enviado como parámetro
	 * o todos los clientes si no hay parámetro 
	 * @param documento 
	 * @return
	 */	
	@RequestMapping("/consultarClientes")
	public ArrayList<ClienteVO> consultarClientes(String nit) {
		ClienteDAO Dao=new ClienteDAO(); 
	    return 	Dao.consultarClientes(nit);		
	}

	//?NIT=112233&nombre=Gato&direccion=Barranquilla&telefono=314456987&email=gato@hotmail.com&sitioweb=www.elgato.com
	@RequestMapping("/registrarProveedor")
	public String registrarProveedor(ProveedorVO p) {		
		ProveedorDAO dao = new ProveedorDAO();
		dao.insertProveedor(p);
		return "Proveedor Registrado";		
	}

	@RequestMapping("/consultarProveedores")
	public ArrayList<ProveedorVO> consultarProveedores(String nit) {
		ProveedorDAO dao = new ProveedorDAO();
		return dao.consultarProveedores(nit);
	}

	@RequestMapping("/registrarProducto")
	public String registrarProducto(ProductoVO p) {
		ProductoDAO dao = new ProductoDAO();
		dao.insertarProducto(p);
		return "Producto Registrado";
	}

	@RequestMapping("/consultarProductos")
	public List<ProductoVO> consultarProductos(Integer id) {
		ProductoDAO dao = new ProductoDAO();
		return dao.listarProductos(id);
	}

	@PostMapping("/registrarVenta")
	public boolean registrarVenta(@RequestBody VentaVO venta) {
		VentaDAO ventaDAO = new VentaDAO();
		return ventaDAO.insertarVentaConDetalles(venta, venta.getDetalles());
	}

	@RequestMapping("/consultarVenta")
	public VentaVO consultarVenta(int id) {
		VentaDAO ventaDAO = new VentaDAO();
		return ventaDAO.consultarVentaConDetalles(id);
	}

	@RequestMapping("/registrarUsuario")
	public String registrarUsuario(UsuarioVO u) {
		UsuarioDAO dao = new UsuarioDAO();
		boolean result = dao.registrarUsuario(u);
		if(result){
		return "Usuario Registrado";
		}else {
			return "Usuario no registrado";
		}
	}

	@RequestMapping("/consultarUsuario")
	public boolean consultarUsuario(UsuarioVO u) {
		UsuarioDAO dao = new UsuarioDAO();
		return dao.login(u);

	}

}