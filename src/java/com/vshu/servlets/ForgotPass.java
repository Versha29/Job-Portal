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
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author acer
 */
public class ForgotPass extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        System.out.println("------------------1---------------------");
        String newpass2=req.getParameter("newpass1");
        String newemail2 = req.getParameter("newemail1");
        Connection con = null;
        try {
            System.out.println("------------------2---------------------");
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
System.out.println("------------------3---------------------");
            PreparedStatement ps1 = con.prepareStatement("update register set password=? where email=?");
            ps1.setString(1, newpass2);
            ps1.setString(2,newemail2);
            System.out.println("------------------4---------------------");
            int i1 = ps1.executeUpdate();
        if (i1 > 0 ) {
                con.commit();
                System.out.println("------------------5---------------------");
                HttpSession session = req.getSession();
                session.setAttribute("session_email", newemail2);
                session.setAttribute("session_pass", newpass2);
               
               resp.sendRedirect("forgotpassword.jsp");
               
            } else {
            System.out.println("------------------6---------------------");
                con.rollback();
                
            }
        } catch (Exception e) {
            try {
                System.out.println("------------------7---------------------");
                con.rollback();
            } catch (Exception ee) {
                ee.printStackTrace();
            }
        } finally {
            try {
                con.close();
            } catch (Exception ee) {
                ee.printStackTrace();
            }
        }
    }
    
}

