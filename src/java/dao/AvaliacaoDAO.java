/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import modelo.Avaliacao;
import modelo.Usuario;


/**
 *
 * @author dappo
 */
public class AvaliacaoDAO extends GenericDAO<Avaliacao, Long>{
    
    public AvaliacaoDAO(){
        super(Avaliacao.class);
    }
    
    public List<Avaliacao> buscarPorUsuario(Usuario user) {
        return em.createQuery("SELECT a FROM Avaliacao a WHERE a.usuario.id = :userid").setParameter("userid", user.getId()).getResultList();
    }
        
}
