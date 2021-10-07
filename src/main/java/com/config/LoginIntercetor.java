package com.config;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by T.a.b
 * Date:2021/10/3
 * Time: 15:17
 */
public class LoginIntercetor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if(request.getRequestURI().contains("login")){
            return true;
        }
       if(session.getAttribute("username")!=null){
           System.out.println(session.getAttribute("username"));
           return true;
       }
        request.getRequestDispatcher("/user/login.jsp").forward(request,response);
        return false;
    }
}
