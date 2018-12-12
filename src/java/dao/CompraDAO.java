/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import modelo.Compra;
import modelo.Usuario;


/**
 *
 * @author dappo
 */
public class CompraDAO extends GenericDAO<Compra, Long>{
    
    public CompraDAO(){
        super(Compra.class);
    }
    
    public List<Compra> buscarPorUsuario(Usuario user) {
        return em.createQuery("SELECT a FROM Compra a WHERE a.usuario.id = :userid").setParameter("userid", user.getId()).getResultList();
    }
        
}
