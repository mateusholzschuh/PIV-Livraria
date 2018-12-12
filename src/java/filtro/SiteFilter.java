/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filtro;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;

/**
 *
 * @author Mateus
 */
@WebFilter(filterName = "SiteFilter", urlPatterns = {"/site/user/*"})
public class SiteFilter implements Filter {
   // to disable the filter, put true
    private static final boolean debug = false;  
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpSession session = ((HttpServletRequest) request).getSession();
        Usuario user = (Usuario) session.getAttribute("usuario-site");
        
        String path = ((HttpServletRequest)request).getRequestURI();
        String base = ((HttpServletRequest)request).getContextPath();
        
        if(user == null) {
            user = new Usuario();
        }
       
        
        if(debug || (user.getId()!=null)){
            chain.doFilter(request, response);
        }else{
            //request.setAttribute("msg", "Você não está logado no sistema!");
            ((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+ "/site/login");
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void destroy() {
        
    }
}
