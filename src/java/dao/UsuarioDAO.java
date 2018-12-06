/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import modelo.Usuario;

/**
 *
 * @author aluno
 */
public class UsuarioDAO extends GenericDAO<Usuario, Long>{
    
    public UsuarioDAO(){
        super(Usuario.class);
    }

    public Usuario fazerLogin(String email, String senha) {
        // a senha deve chegar nesse método criptografada
        // senão
        //String senha_cripto = Criptografia.convertPasswordToMD5(senha); e add throws ...
    
    
        List<Usuario> users = em.createNamedQuery("Usuario.logar").setParameter("email", email).setParameter("senha", senha).getResultList();
        
        if(0==users.size()){
            return new Usuario();
        }else{
            return users.get(0);
        }
    }
    
}
