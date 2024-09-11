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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Register extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        System.out.println("regg1------------------------");

        String name2=req.getParameter("name1");
        String email2=req.getParameter("email1");
        String pass2=req.getParameter("pass1");
        String gender2=req.getParameter("gender1");
        String city2=req.getParameter("city1");
        
        
        System.out.println("regg11------------------------");
        Connection  con=null;
        System.out.println("regg12------------------------");

        try
        {
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
            
            PreparedStatement ps1=con.prepareStatement("insert into register(name, email, password, gender, city) values(?,?,?,?,?)");
            ps1.setString(1, name2);
            ps1.setString(2, email2);
            ps1.setString(3, pass2);
            ps1.setString(4, gender2);
            ps1.setString(5, city2);
            int i1=ps1.executeUpdate();
            System.out.println("regg2------------------------");
            PreparedStatement ps2=con.prepareStatement("insert into about_user(email, about, skills) values(?,?,?)");
            ps2.setString(1, email2);
            ps2.setString(2, "");
            ps2.setString(3, "");
            int i2=ps2.executeUpdate();
            System.out.println("regg3------------------------");
            
            PreparedStatement ps3=con.prepareStatement("insert into profile_pics(email, path) values(?,?)");
            ps3.setString(1, email2);
            ps3.setString(2, "user.png");
            int i3=ps3.executeUpdate();
            System.out.println("regg4------------------------");
            
            if(i1>0 && i2>0 && i3>0)
            {
                con.commit();
                HttpSession session=req.getSession();
                session.setAttribute("session_name", name2);
                session.setAttribute("session_email", email2);
                session.setAttribute("session_gender", gender2);
                session.setAttribute("session_city", city2);
                
                session.setAttribute("session_title", "");
                session.setAttribute("session_skills", "");
                
                session.setAttribute("session_profilepic", "user.png");
                System.out.println("regg5------------------------");
                resp.sendRedirect("index.jsp");
            }
            else
            {
                System.out.println("regg6------------------------");
                con.rollback();
                out.println("Failed");
            }
        }
        catch(Exception e)
        {
            try
            {
                System.out.println("regg7------------------------");
                con.rollback();
            }
            catch(Exception ee)
            {
                ee.printStackTrace();
            }
        }
        finally
        {
            try{
            }
            catch(Exception ee)
            {
                ee.printStackTrace();
            }
        }
        
    }
}
