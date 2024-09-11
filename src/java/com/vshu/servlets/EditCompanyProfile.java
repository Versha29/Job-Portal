/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vshu.servlets;

import com.vshu.connection.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author acer
 */
public class EditCompanyProfile  extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        PrintWriter out=resp.getWriter();
        HttpSession session=req.getSession();
        String cemail=(String)session.getAttribute("session_cemail");
        String cphone2=req.getParameter("cphone1");
        String cloc2=req.getParameter("cloc1");
       
        
        Connection con=null;
        try
        {
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
            
            PreparedStatement ps1=con.prepareStatement("update company_registration set c_phone=?,c_location=? where c_email=?");
            ps1.setString(1, cphone2);
            ps1.setString(2, cloc2);
            ps1.setString(3, cemail);
            
            int i1=ps1.executeUpdate();
            
           
            if(i1>0)
            {
                con.commit();
                
                session.setAttribute("session_cphone", cphone2);
                session.setAttribute("session_cloc", cloc2);
                
//                session.setAttribute("session_cphone", cphone2);
//                session.getAttribute("session_cloc",cloc2);
                resp.sendRedirect("company-profile.jsp");
            }
            else
            {
                con.rollback();
                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("editcompanyprofile.jsp");
                rd2.include(req, resp);
            }
        }
        catch(Exception e)
        {
           try{
               con.rollback();
           }
           catch(Exception ee)
           {
               ee.printStackTrace();
           }
           
        }
        finally
        {
            try
            {
                con.close();
            }
            catch(Exception ee)
            {
                ee.printStackTrace();
            }
        }
    }
    
}
