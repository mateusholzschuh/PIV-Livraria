/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import dao.CompraDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.Instant;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Carrinho;
import modelo.Compra;
import modelo.Usuario;

/**
 *
 * @author Mateus
 */
@WebServlet(name = "SiteCheckout", urlPatterns = {"/site/checkout"})
public class SiteCheckout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Usuario user = (Usuario) request.getSession().getAttribute("usuario-site");
        Carrinho cart = (Carrinho) request.getSession().getAttribute("carrinho");

        if (user != null && cart != null) {
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } else {
            response.sendRedirect("../site/login");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String endereco = request.getParameter("address");
        String cidade = request.getParameter("city");
        String cep = request.getParameter("zip-code");
        String telefone = request.getParameter("tel");
        String observacoes = request.getParameter("observacoes");
        String pagamento = request.getParameter("payment");

        Usuario user = (Usuario) request.getSession().getAttribute("usuario-site");
        Carrinho cart = (Carrinho) request.getSession().getAttribute("carrinho");

        if (user == null && cart == null) {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
            return;
        } 

        Compra order = new Compra();

        order.setEndereco(endereco);
        order.setCidade(cidade);
        order.setCep(cep);
        order.setTelefone(telefone);
        order.setObservacoes(observacoes);
        order.setMetodoPagamento(pagamento);
        order.setDataCompra(Date.from(Instant.now()));
        order.setStatus("Em processamento");
        order.setUsuario(user);
        order.setItens(cart.getItens());

        CompraDAO CDAO = new CompraDAO();
        CDAO.incluir(order);
        CDAO.fecharConexao();
        
        request.getSession().removeAttribute("carrinho");
        response.sendRedirect("../site/user?tab=orders");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
