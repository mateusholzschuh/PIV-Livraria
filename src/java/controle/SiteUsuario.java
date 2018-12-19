/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import dao.AvaliacaoDAO;
import dao.CompraDAO;
import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Usuario;
import util.Criptografia;

/**
 *
 * @author aluno
 */
@WebServlet(name = "SiteUsuario", urlPatterns = {"/site/user"})
public class SiteUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tab = request.getParameter("tab");
        String path = "user/";
        String pagina = "account.jsp";

        CompraDAO compra_dao;

        Usuario user = (Usuario) request.getSession().getAttribute("usuario-site");

        switch (String.valueOf(tab)) {
            case "orders":
                compra_dao = new CompraDAO();
                request.setAttribute("orders", compra_dao.buscarPorUsuario(user));
                compra_dao.fecharConexao();
                pagina = "orders.jsp";
                break;

            case "order":
                Long id = Long.parseLong(request.getParameter("id"));
                compra_dao = new CompraDAO();
                request.setAttribute("order", compra_dao.buscarPorChavePrimaria(id));
                compra_dao.fecharConexao();
                pagina = "order.jsp";
                break;

            case "reviews":
                AvaliacaoDAO avaliacao_dao = new AvaliacaoDAO();
                request.setAttribute("reviews", avaliacao_dao.buscarPorUsuario(user));
                avaliacao_dao.fecharConexao();
                pagina = "reviews.jsp";
                break;

            default:
                pagina = "account.jsp";
        }

        request.getRequestDispatcher(path + pagina).forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String deletar = request.getParameter("deletar");
        String alterar = request.getParameter("alterar");

        Usuario user = (Usuario) request.getSession().getAttribute("usuario-site");
        UsuarioDAO udao;

        switch (String.valueOf(alterar)) {
            case "foto":
                String foto = request.getParameter("data[image]");
                udao = new UsuarioDAO();
                user.setFoto(foto);
                udao.alterar(user);
                udao.fecharConexao();
                request.setAttribute("msg", "Foto alterada com sucesso!");
                request.setAttribute("color", "alert-success");
                request.getRequestDispatcher("user/account.jsp").forward(request, response);
                break;
            case "dados":
                String nome = request.getParameter("txtNome");
                String email = request.getParameter("txtEmail");
                String senha1 = request.getParameter("txtSenha");
                String senha2 = request.getParameter("txtSenhaConf");

                if (nome != null && email != null && senha1 != null && senha2 != null && senha1.equals(senha2)) {
                    try {
                        senha1 = Criptografia.convertPasswordToMD5(senha1);
                        udao = new UsuarioDAO();

                        user.setNome(nome);
                        user.setEmail(email);
                        user.setSenha(senha1);

                        udao.alterar(user);
                        udao.fecharConexao();

                        request.setAttribute("msg", "Dados alterados com sucesso!");
                        request.setAttribute("color", "alert-success");
                        request.getRequestDispatcher("user/account.jsp").forward(request, response);

                    } catch (NoSuchAlgorithmException ex) {
                        Logger.getLogger(SiteUsuario.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    request.setAttribute("msg", "Ocorreu um erro ao alterar os dados!");
                    request.getRequestDispatcher("user/account.jsp").forward(request, response);
                }
        }

        //quer apagar
        if (deletar != null && user != null) {
            String senha = request.getParameter("txtSenha");

            try {
                senha = util.Criptografia.convertPasswordToMD5(senha);
                boolean excluiu = false;

                if (user.getSenha().equals(senha)) {
                    udao = new UsuarioDAO();
                    user = udao.buscarPorChavePrimaria(user.getId());

                    if (user.getAvaliacaos().size() > 0 || user.getCompras().size() > 0) {
                        request.setAttribute("msg", "Não foi possível excluir tua conta, há compras pendentes!");
                        request.getRequestDispatcher("user/account.jsp").forward(request, response);
                    } else {
                        excluiu = udao.excluir(user);
                    }
                    
                    if (excluiu) {
                        request.getSession().removeAttribute("usuario-site");
                        response.sendRedirect("../site/login");
                    } else {
                        request.setAttribute("msg", "Não foi possível excluir tua conta!");
                        request.getRequestDispatcher("user/account.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("msg", "Senha não está correta!");
                    request.getRequestDispatcher("user/account.jsp").forward(request, response);
                }

            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(SiteUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
