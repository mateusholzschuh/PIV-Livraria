/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import dao.LivroDAO;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Mateus
 */
public class Carrinho {

    private HashMap<Livro, Integer> produtos;

    public Carrinho() {
        produtos = new HashMap<>();
    }

    public boolean add(Livro livro) {
        // verifica se o livro ja esta no carrinho, caso esteja
        // ::Atualiza a quantidade desse item
        if (produtos.containsKey(livro)) {
            return produtos.replace(livro, produtos.get(livro), produtos.get(livro) + 1);
        }
        // caso contrario
        // ::Add um novo item
        produtos.put(livro, 1);
        return true;
    }
    
    public boolean add(Livro livro, Integer quantidade) {
        // verifica se o livro ja esta no carrinho, caso esteja
        // ::Atualiza a quantidade desse item
        if (produtos.containsKey(livro) && quantidade > 0) {
            return produtos.replace(livro, produtos.get(livro), produtos.get(livro) + quantidade);
        }
        // caso contrario
        // ::Add um novo item
        if(quantidade > 0) {
            produtos.put(livro, quantidade);
            return true;
        }
        
        return false;
    }

    public boolean update(Livro livro, Integer items) {

        // ja existe o livro no carrinho e o numero é maior que 0
        // ::Atualiza o numero de quantidade do item
        if (produtos.containsKey(livro) && items > 0) {
            return produtos.replace(livro, produtos.get(livro), items);
        } 
        // não existe o livro no carrinho, mas o numero de itens é maior que 0
        // ::Add o(s) livro(s) no carrinho
        else if (items > 0) {
            return this.add(livro, items);
        } 
        // se o numero de itens for igual a 0 ou menor
        // ::Tenta deletar o item do carrinho
        else {
            return this.remove(livro);
        }
    }

    public boolean remove(Livro livro) {
        // verifica se o livro ja está no carrinho
        // ::Remove o livro correspondente do carrinho
        if (produtos.containsKey(livro)) {
            return produtos.remove(livro) != null;
        }
        return false;
    }

    /**
     * Tenta remover o item do carrinho através do ID do livro.
     *
     * @param id
     * @return
     */
    public boolean remove(Long id) {
        LivroDAO dao = new LivroDAO();
        Livro obj = dao.buscarPorChavePrimaria(id);
        dao.fecharConexao();
        if (obj != null) {
            return remove(obj);
        }
        return false;
    }

    /**
     * Retorna uma lista de <b>ItemVenda</b> correspondente aos produtos no
     * carrinho
     *
     * @return lista de ItemVenda
     */
    public List<ItemVenda> getItens() {
        List<ItemVenda> itens = new ArrayList<>();

        produtos.forEach((t, u) -> {
            ItemVenda item = new ItemVenda(t, u);
            itens.add(item);
        });

        return itens;
    }

    /**
     * Retorna o numero total de itens no carrinho
     *
     * @return
     */
    public Integer getTotalItems() {
        // pega as quantidades e soma elas
        return produtos.values().stream()
                .mapToInt(i -> i).sum();
    }

    /**
     * Retorna o valor total dos produtos no carrinho
     *
     * @return
     */
    public Float getTotalPrice() {
        // pega os ItemVenda e mapeia os valores de cada um, após soma todos e retorna
        return (float) this.getItens().stream()
                .mapToDouble(e -> e.getPrecoTotal()).sum();
    }

}