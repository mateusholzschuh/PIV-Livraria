/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;

/**
 *
 * @author Mateus
 */
@Entity
public class Avaliacao implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    @ManyToOne
    private Usuario usuario;
    
    @ManyToOne
    private Livro livro;    
    
    private Integer estrelas;
    
    @Column(length = 600)
    private String comentario;
    
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date data;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Avaliacao)) {
            return false;
        }
        Avaliacao other = (Avaliacao) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Avaliacao[ id=" + id + " ]";
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Livro getLivro() {
        return livro;
    }

    public void setLivro(Livro livro) {
        this.livro = livro;
    }

    public Integer getEstrelas() {
        return estrelas;
    }

    public void setEstrelas(Integer estrelas) {
        this.estrelas = estrelas;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Date getData() {
        return data;     
    }
    
    public String getDataString() {
        return util.FormataData.formata(data);
    }

    public void setData(Date data) {
        this.data = data;
    }
    
    public String getEstrelasHTML() {
        String s = "<i class=\"fa fa-star\"></i>";
        String t = "<i class=\"fa fa-star-o empty\"></i>";
        String out = "";
        for(int i=0; i<estrelas; i++){
            out+=s;
        }
        for(int i=estrelas; i<5; i++){
            out+=t;
        }
        
        return out;
    }
    
}
