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
public class CompanyRegistration extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String c_name2 = req.getParameter("c_name1");
        String c_email2 = req.getParameter("c_email1");
        String c_pass2 = req.getParameter("c_pass1");
        String c_phone2 = req.getParameter("c_phone1");
        String c_loc2 = req.getParameter("c_loc1");
        
        Connection con = null;
        try {
            con = DbConnection.getConnect();
            con.setAutoCommit(false);

            PreparedStatement ps1 = con.prepareStatement("insert into company_registration(c_name,c_email,c_password,c_phone,c_location) values(?,?,?,?,?)");
            ps1.setString(1, c_name2);
            ps1.setString(2, c_email2);
            ps1.setString(3, c_pass2);
            ps1.setString(4, c_phone2);
            ps1.setString(5, c_loc2);
            int i1 = ps1.executeUpdate();
          
            if (i1 > 0 ) {
                con.commit();
                HttpSession session = req.getSession();
                session.setAttribute("session_cname", c_name2);
                session.setAttribute("session_cemail", c_email2);
                session.setAttribute("session_cphone", c_phone2);
                session.setAttribute("session_cloc", c_loc2);
                session.setAttribute("session_clogo", "company_logo.png");

                resp.sendRedirect("index.jsp");
            } else {
                con.rollback();
                RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                RequestDispatcher rd2 = req.getRequestDispatcher("company-register.jsp");
                rd2.include(req, resp);
            }
        } catch (Exception e) {
            try {
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
