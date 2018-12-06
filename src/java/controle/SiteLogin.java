/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mateus
 */
@WebServlet(name = "SiteLogin", urlPatterns = {"/site/login"})
public class SiteLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("txtNome");
        String email = request.getParameter("txtEmail");
        String senha = request.getParameter("txtSenha");
        
        String msg = null;
        
        //Quer fazer login
        if(request.getParameter("acao") != null && request.getParameter("acao").equals("login")) {
            if(email != null && senha != null && !email.isEmpty() && !senha.isEmpty()) {
                msg="tudo completo";
            }
            else {
                msg = "Verifique os campos!";
            }
            
            request.setAttribute("msglogin", msg);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        //quer cadastrar
        else if(request.getParameter("acao") != null && request.getParameter("acao").equals("register")) {
            if(nome != null && email != null && senha != null && !nome.isEmpty() && !email.isEmpty() && !senha.isEmpty()) {
                msg = "tudo completo!";
            }
            else {
                msg = "Todos os campos devem ser preenchidos!";
            }
            
            request.setAttribute("msgregister", msg);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        else {
            response.sendRedirect("../site/login");
        }
    }
    
}
