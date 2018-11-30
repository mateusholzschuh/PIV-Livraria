/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import dao.LivroDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Autor;
import modelo.Livro;

/**
 *
 * @author Mateus
 */
@WebServlet(name = "SiteLivros", urlPatterns = {"/site/store"})
public class SiteLivros extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LivroDAO dao;
        
        /*= new LivroDAO();
        List<Livro> livros = dao.listar();
        dao.fecharConexao();
        
        request.setAttribute("lista", livros);
        request.getRequestDispatcher("store.jsp").forward(request, response);
        *//////////////////////////////////////////
        
        String acao;
        String pagina = "store.jsp";
        
        acao = request.getParameter("acao");
        List<Livro> lista = null;
        
        switch(String.valueOf(acao)){
            case "mostrar":
                String id = request.getParameter("id");
                if (id==null) return;
                dao = new LivroDAO();
                Livro obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
                dao.fecharConexao();
                if(obj == null) return;
                request.setAttribute("livro", obj);
                pagina = "product.jsp";
                
                break;
            case "filtro":
                String q = request.getParameter("q");
                
                String autor="", genero="", classificacao="", editora="", preco;
                Float min=0f, max=9999f;
                
                if(q!=null) {
                    String[] filtros = q.split("@");
                    
                    for(String f : filtros) {
                        if(f.contains("autor")) {
                            autor = f.split("=").length > 1 ? f.split("=")[1] : "";
                        } else
                        if(f.contains("genero")) {
                            genero = f.split("=").length > 1 ? f.split("=")[1] : "";
                        } else
                        if(f.contains("classificacao")) {
                            classificacao = f.split("=").length > 1 ? f.split("=")[1] : "";
                        } else
                        if(f.contains("editora")) {
                            editora = f.split("=").length > 1 ? f.split("=")[1] : "";
                        } else
                        if(f.contains("preco")) {
                            preco = f.split("=").length > 1 ? f.split("=")[1] : "";
                            if(!preco.equals("")) {
                                min = Float.parseFloat(preco.split(":")[0]);
                                max = Float.parseFloat(preco.split(":")[1]);
                            }
                        }
                    }
                    
                    dao = new LivroDAO();
                    request.setAttribute("lista", dao.listar("", autor, editora, genero, classificacao, min, max));                    
                }
                
                break;
                
            default://total
                dao = new LivroDAO();
                request.setAttribute("lista", dao.listar());
                break;
                
        }
        RequestDispatcher destino = request.getRequestDispatcher(pagina);
        destino.forward(request, response);
        
    }

    

}
