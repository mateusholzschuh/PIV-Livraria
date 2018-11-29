/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.HashMap;
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
        return false;
    }
    
    public boolean remove(Livro livro) {
        if(produtos.containsKey(livro)) {
            return produtos.remove(livro) != null;
        }
        return false;
    }
    
    public int getTotalItems() {
        temp items = new temp();
        produtos.forEach((t, u) -> {
            items.setX(items.getX() + u);
        });
        return items.getX();
    }
    
    public float getTotalPrice() {
        temp items = new temp();
        produtos.forEach((t, u) -> {
            items.setY(items.getY() + (t.getPreco() * u));
        });
        return items.getY();
    }

    public HashMap<Livro, Integer> getProdutos() {
        return produtos;
    }

    public void setProdutos(HashMap<Livro, Integer> produtos) {
        this.produtos = produtos;
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
