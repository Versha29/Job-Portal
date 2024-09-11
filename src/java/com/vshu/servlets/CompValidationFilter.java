/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vshu.servlets;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 *
 * @author acer
 */
public class CompValidationFilter implements Filter{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
    {
        String c_name2=request.getParameter("c_name1");
        String c_email2=request.getParameter("c_email1");
        String c_pass2=request.getParameter("c_pass1");
        String c_phone2=request.getParameter("c_phone1");
        String c_loc2=request.getParameter("c_loc1");
        
        CompValidationServerSide validations=new CompValidationServerSide();
        
        if(!validations.cnameValidate(c_name2))
        {
            RequestDispatcher rd1=request.getRequestDispatcher("company-register.jsp");
            rd1.include(request, response);
        }
        else if(!validations.cemailValidate(c_email2))
        {
            RequestDispatcher rd1=request.getRequestDispatcher("company-register.jsp");
            rd1.include(request, response);
        }
        else if(!validations.cpasswordValidate(c_pass2))
        {
            RequestDispatcher rd1=request.getRequestDispatcher("company-register.jsp");
            rd1.include(request, response);
        }
        else if(c_phone2==null || c_phone2.equals(""))
        {
            RequestDispatcher rd1=request.getRequestDispatcher("company-register.jsp");
            rd1.include(request, response);
        }
        else if(c_loc2==null || c_loc2.equals(""))
        {
            RequestDispatcher rd1=request.getRequestDispatcher("company-register.jsp");
            rd1.include(request, response);
        }
        else
        {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
    }
}








