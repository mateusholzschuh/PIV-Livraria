/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import dao.LivroDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Carrinho;
import modelo.Livro;

/**
 *
 * @author Mateus
 */
@WebServlet(name = "SiteCarrinho", urlPatterns = {"/site/cart"})
public class SiteCarrinho extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String add = request.getParameter("add");        
        String remove = request.getParameter("remove");
        String update = request.getParameter("update");
        
        // Add item
        if(add != null) {
            Carrinho cart = (Carrinho) request.getSession().getAttribute("carrinho");
            if(cart == null) {
                cart = new Carrinho();
            }
            LivroDAO dao = new LivroDAO();
            Livro obj = dao.buscarPorChavePrimaria(Long.parseLong(add));
            
            if(obj != null) {
                String qtd = request.getParameter("qtd");
                
                if(qtd != null)
                    cart.add(obj, Integer.valueOf(qtd));
                else
                    cart.add(obj);
            }
            
            request.getSession().setAttribute("carrinho", cart);
            response.sendRedirect("../site/cart");
        }
        else if(remove != null) {
            Carrinho cart = (Carrinho) request.getSession().getAttribute("carrinho");
            if(cart == null) {
                return;
            }
            LivroDAO dao = new LivroDAO();
            Livro obj = dao.buscarPorChavePrimaria(Long.parseLong(remove));
            
            if(obj != null) {
                cart.remove(obj);
            }
            
            request.getSession().setAttribute("carrinho", cart);
            response.sendRedirect("../site/store");
        }
        else if(update != null) {
            Carrinho cart = (Carrinho) request.getSession().getAttribute("carrinho");
            if(cart == null) {
                return;
            }
            LivroDAO dao = new LivroDAO();
            Livro obj = dao.buscarPorChavePrimaria(Long.parseLong(update));
            
            Integer quantidade = Integer.parseInt(request.getParameter("qtd"));
            
            if(obj != null && quantidade != null) {
                cart.update(obj, quantidade);
            }
            
            request.getSession().setAttribute("carrinho", cart);
            response.sendRedirect("../site/cart");
        }
        else{
        request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


}
