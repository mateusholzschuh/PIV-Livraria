/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mateus
 */
public class Rotas {
    
    public static boolean forcaRota(HttpServletRequest request, HttpServletResponse response, String url) throws IOException {
        String URI = request.getRequestURI().substring(request.getContextPath().length());
        
        if (!URI.equals(url)) {
            response.sendRedirect(request.getContextPath() + url);
            return true;
        }
        
        return false;
    }
}
