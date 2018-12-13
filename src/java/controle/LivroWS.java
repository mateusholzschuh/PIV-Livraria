/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import dao.AutorDAO;
import dao.ClassificacaoDAO;
import dao.EditoraDAO;
import dao.GeneroDAO;
import dao.LivroDAO;
import java.io.IOException;
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
import modelo.Classificacao;
import modelo.Editora;
import modelo.Genero;
import modelo.Livro;


/**
 *
 * @author dappo
 */
@WebServlet(name = "LivroWS", urlPatterns = {"/admin/livro/", "/admin/livro/LivroWS"})
public class LivroWS extends HttpServlet {
    private LivroDAO dao;
    private Livro obj;
    private String pagina;
    private String acao;
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if(util.Rotas.forcaRota(request, response, "/admin/livro/LivroWS")) {
            return;
        }
        
        acao = request.getParameter("acao");
        List<Livro> lista = null;
        String id;
        switch(String.valueOf(acao)){
            case "add":
                request.setAttribute("_classificacao", listarClassificacao());
                request.setAttribute("_autor", listarAutores());
                request.setAttribute("_editora", listarEditoras());
                request.setAttribute("_genero", listarGeneros());
                
                pagina = "add.jsp";
                
                break;
            case "del":
                id = request.getParameter("id");
                dao = new LivroDAO();
                pagina = "index.jsp";
                obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
                Boolean deucerto = dao.excluir(obj);
                if(deucerto){   
                    lista = dao.listar();
                    request.setAttribute("lista", lista);
                    request.setAttribute("msg", "Excluído com sucesso");
                }
                else{
                    request.setAttribute("msg", "Erro ao excluir");
                }
                break;
            case "edit":
                id = request.getParameter("id");
                dao = new LivroDAO();
                Livro obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
                request.setAttribute("obj", obj);
                
                request.setAttribute("_classificacao", listarClassificacao());
                request.setAttribute("_autor", listarAutores());
                request.setAttribute("_editora", listarEditoras());
                request.setAttribute("_genero", listarGeneros());
                
                pagina = "edita.jsp";
                break;
            default:
                dao = new LivroDAO();
                if (request.getParameter("filtro") != null) {
                    try {
                        lista = dao.listar(request.getParameter("filtro"));
                    } catch (Exception ex) {
                        Logger.getLogger(LivroWS.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    lista = dao.listar();
                }
                //pra onde deve ser redirecionada a página
                pagina = "index.jsp";
                //passar a listagem para a página
                request.setAttribute("lista", lista);
                break;
                
        }
        RequestDispatcher destino = request.getRequestDispatcher(pagina);
        destino.forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String msg;
            request.setCharacterEncoding("UTF-8");
            //verificar campos obrigatórios
            // nome, capa, autor, classificacao, editora, genero, lancamento
            String _nome = request.getParameter("txtNome");
            String _preco = request.getParameter("txtPreco");
            String _capa = request.getParameter("txtCapa");
            String _autor = request.getParameter("txtAutor");
            String _classificacao = request.getParameter("txtClassificacao");
            String _editora = request.getParameter("txtEditora");
            String _genero = request.getParameter("txtGenero");
            String _lancamento = request.getParameter("txtLancamento");
            String _descricao = request.getParameter("txtDescricao");
            
            if(_nome == null || _preco == null || _capa == null || _autor == null || _classificacao == null ||
                    _editora == null || _genero == null || _lancamento == null || _descricao == null){
                msg = "Campos obrigatórios não informados";
            }
            else{
                dao = new LivroDAO();
                obj = new Livro();
                //preencho o objeto com o que vem do post
                
                Boolean deucerto;
                
                //se veio com a chave primaria então tem q alterar
                if(request.getParameter("txtId")!= null){ 
                    obj = dao.buscarPorChavePrimaria(Long.parseLong(request.getParameter("txtId")));
                }
                
                obj.setNome(_nome);
                obj.setPreco(Float.parseFloat(_preco));
                obj.setCapa(_capa); //foto
                obj.setLancamento(util.FormataData.formata(_lancamento, "yyyy-MM-dd"));
                obj.setDescricao(_descricao);
                
                //Autor
                AutorDAO autorDAO = new AutorDAO();
                obj.setAutor(
                        autorDAO.buscarPorChavePrimaria(
                                Long.parseLong(_autor)
                        )
                );
                autorDAO.fecharConexao();

                //Editora
                EditoraDAO editoraDAO = new EditoraDAO();
                obj.setEditora(
                        editoraDAO.buscarPorChavePrimaria(
                                Long.parseLong(_editora)
                        )
                );
                editoraDAO.fecharConexao();

                //Genero
                GeneroDAO generoDAO = new GeneroDAO();
                obj.setGenero(
                        generoDAO.buscarPorChavePrimaria(
                                Long.parseLong(_genero)
                        )
                );
                generoDAO.fecharConexao();

                //Classificação
                ClassificacaoDAO classDAO = new ClassificacaoDAO();
                obj.setClassificacao(
                        classDAO.buscarPorChavePrimaria(
                                Long.parseLong(_classificacao)
                        )
                );
                classDAO.fecharConexao();
                
                dao = new LivroDAO();
                //se veio com a chave primaria então tem q alterar
                if(request.getParameter("txtId")!= null){                    
                    deucerto = dao.alterar(obj);
                    pagina="edita.jsp";
                }
                else{
                    deucerto = dao.incluir(obj);
                    pagina="add.jsp";   
                }
                if(deucerto){
                    msg = "Operação realizada com sucesso";    
                }
                else{
                    msg = "Erro ao realizar a operação";
                }
                dao.fecharConexao();
            }
            request.setAttribute("msg", msg);
            RequestDispatcher destino = request.getRequestDispatcher(pagina);
            destino.forward(request, response);
    }
    
    public List<Genero> listarGeneros() {
        GeneroDAO _dao = new GeneroDAO();
        List<Genero> lista = _dao.listar();
        return lista;
    }
    
    public List<Editora> listarEditoras() {
        EditoraDAO _dao = new EditoraDAO();
        List<Editora> lista = _dao.listar();
        return lista;
    }
    
    public List<Autor> listarAutores() {
        AutorDAO _dao = new AutorDAO();
        List<Autor> lista = _dao.listar();
        return lista;
    }
    
    public List<Classificacao> listarClassificacao() {
        ClassificacaoDAO _dao = new ClassificacaoDAO();
        List<Classificacao> lista = _dao.listar();
        return lista;
    }


}
