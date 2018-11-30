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
    
    //List<ItemVenda> itens;
    
    public Carrinho() {
        produtos = new HashMap<>();
        //itens = new ArrayList<>();
    }
    
    public boolean add(Livro livro) {
        if(produtos.containsKey(livro)) {
            return produtos.replace(livro, produtos.get(livro), produtos.get(livro) + 1);
        }
        produtos.put(livro, 1);
        return true;
    }
    
    public boolean update(Livro livro, Integer items) {
        if(produtos.containsKey(livro)) {
            return produtos.replace(livro, produtos.get(livro), items);
        }
        produtos.put(livro, items);
        return true;
    }
    
    public boolean remove(Livro livro) {
        if(produtos.containsKey(livro)) {
            return produtos.remove(livro) != null;
        }
        return false;
    }
    
    public boolean remove(Long id) {
        LivroDAO dao = new LivroDAO();
        Livro obj = dao.buscarPorChavePrimaria(id);
        dao.fecharConexao();
        if(obj != null) {
            return remove(obj);
        }
        return false;
    }
    
    public List<ItemVenda> getItens() {
        List<ItemVenda> itens = new ArrayList<>();
        
        produtos.forEach((t, u) -> {
            ItemVenda item = new ItemVenda(t, u);
            itens.add(item);
        });
        
        return itens;
    }
    
    public Integer getTotalItems() {
        temp items = new temp();
        produtos.forEach((t, u) -> {
            items.setX(items.getX() + u);
        });
        return items.getX();
    }
    
    public Float getTotalPrice() {
        temp items = new temp();
        produtos.forEach((t, u) -> {
            items.setY(items.getY() + (t.getPreco() * u));
        });
        return items.getY();
    }
    
}

class temp {
    int x;
    float y;

    public float getY() {
        return y;
    }

    public void setY(float y) {
        this.y = y;
    }
    
    temp() {
        x=0;
        y=0;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }
    
}
