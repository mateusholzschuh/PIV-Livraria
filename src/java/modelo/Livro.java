/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.time.Instant;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author aluno
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "Livro.findAll", query = "SELECT e FROM Livro e"),
    @NamedQuery(name = "Livro.findFilter", query = "SELECT e FROM Livro e WHERE UPPER(e.nome) like :filtro"),
    @NamedQuery(name = "Livro.findFck", query = "SELECT l FROM Livro l WHERE UPPER(l.autor.nome) LIKE :autor AND UPPER(l.nome) LIKE :nome AND UPPER(l.editora.nome) LIKE :editora AND UPPER(l.genero.genero) LIKE :genero AND UPPER(l.classificacao.classificacao) LIKE :classificacao AND l.preco BETWEEN :minimo AND :maximo")
})
public class Livro implements Serializable {

    @OneToMany(mappedBy = "livro")
    private List<Avaliacao> avaliacaos;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    private String nome;
    
    private String capa;
    
    @Temporal(TemporalType.DATE)
    private Date lancamento;
    
    @ManyToOne
    private Autor autor;
    
    @ManyToOne
    private Editora editora;
    
    @ManyToOne
    private Genero genero;
    
    @ManyToOne
    private Classificacao classificacao;
    
    private float preco;
    
    private String descricao;   

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
        if (!(object instanceof Livro)) {
            return false;
        }
        Livro other = (Livro) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }
    
    public String dataLancamento(){
        return util.FormataData.formata(lancamento, "dd/MM/yyyy");
    }

    @Override
    public String toString() {
        return "modelo.Livro[ id=" + id + " ]";
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCapa() {
        return capa;
    }

    public void setCapa(String capa) {
        this.capa = capa;
    }

    public Date getLancamento() {
        return lancamento;
    }

    public void setLancamento(Date lancamento) {
        this.lancamento = lancamento;
    }

    public Autor getAutor() {
        return autor;
    }

    public void setAutor(Autor autor) {
        this.autor = autor;
    }

    public Editora getEditora() {
        return editora;
    }

    public void setEditora(Editora editora) {
        this.editora = editora;
    }

    public Genero getGenero() {
        return genero;
    }

    public void setGenero(Genero genero) {
        this.genero = genero;
    }

    public Classificacao getClassificacao() {
        return classificacao;
    }

    public void setClassificacao(Classificacao classificacao) {
        this.classificacao = classificacao;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

    public List<Avaliacao> getAvaliacaos() {
        return avaliacaos;
    }

    public void setAvaliacaos(List<Avaliacao> avaliacaos) {
        this.avaliacaos = avaliacaos;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    // se for lançado no mesmo dia, é lançamento
    public boolean isRecente() {
        return this.lancamento.compareTo(Date.from(Instant.now())) >= 0;
    }
}
