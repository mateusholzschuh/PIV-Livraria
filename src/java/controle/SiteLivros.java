/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import com.sun.corba.se.spi.presentation.rmi.StubAdapter;
import dao.LivroDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Livro;

/**
 *
 * @author Mateus
 */
@WebServlet(name = "SiteLivros", urlPatterns = {"/site/store"})
public class SiteLivros extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LivroDAO dao = new LivroDAO();
        List<Livro> livros = dao.listar();
        dao.fecharConexao();
        
        req.setAttribute("lista", livros);
        req.getRequestDispatcher("store.jsp").forward(req, resp);
        
    }

    

}
