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
        
        switch(String.valueOf(tab)) {
            case "orders":
                pagina = "orders.jsp";
                break;
                
            case "order":
                pagina = "order.jsp";
                break;
                
            case "reviews":
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
        
    }

}
