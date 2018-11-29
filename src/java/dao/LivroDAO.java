/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import modelo.Livro;


/**
 *
 * @author dappo
 */
public class LivroDAO extends GenericDAO<Livro, Long>{
    
    public LivroDAO(){
        super(Livro.class);
    }
    
    public List<Livro> listar(String nome, String autor, String editora, String genero, String classificacao, Float precoMinimo, Float precoMaximo) {
        nome = nome == null ? "" : nome;
        autor = autor == null ? "" : autor;
        editora = editora == null ? "" : editora;
        genero = genero == null ? "" : genero;
        classificacao = classificacao == null ? "" : classificacao;
        precoMinimo = precoMinimo == null ? 0 : precoMinimo;
        precoMaximo = precoMaximo == null ? 9999 : precoMaximo;
        
        return em.createNamedQuery(persistedClass.getSimpleName()+".findFck")
                .setParameter("nome","%" + nome + "%")
                .setParameter("autor","%" + autor + "%")
                .setParameter("editora","%" + editora + "%")
                .setParameter("genero","%" + genero + "%")
                .setParameter("classificacao","%" + classificacao + "%")
                .setParameter("minimo","%" + precoMinimo + "%")
                .setParameter("maximo","%" + precoMaximo + "%")
                .getResultList();
    }
    
}
