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
public class ForgotCompPass extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        System.out.println("------------------1---------------------");
        String newcomppass2=req.getParameter("newcomppass1");
        String newcompemail2 = req.getParameter("compemail1");
        Connection con = null;
        try {
            System.out.println("------------------2---------------------");
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
System.out.println("------------------3---------------------");
            PreparedStatement ps1 = con.prepareStatement("update company_registration set c_password=? where c_email=?");
            ps1.setString(1, newcomppass2);
            ps1.setString(2,newcompemail2);
            System.out.println("------------------4---------------------");
            System.out.println("------------------"+ps1+"---------------------");
            int i1 = ps1.executeUpdate();
            System.out.println(i1);
        if (i1 > 0 ) {
                con.commit();
                System.out.println("------------------5---------------------");
                HttpSession session = req.getSession();
                session.setAttribute("session_cemail", newcompemail2);
                session.setAttribute("session_cpass", newcomppass2);
               
               resp.sendRedirect("forgotcomppass.jsp");
            } else {
            System.out.println("------------------6---------------------");
                con.rollback();
                
            }
        } catch (Exception e) {
            try {
                System.out.println(e);
                con.rollback();
            } catch (Exception ee) {
                ee.printStackTrace();
            }
        } finally {
            try {
            } catch (Exception ee) {
                ee.printStackTrace();
            }
        }
    }
}
