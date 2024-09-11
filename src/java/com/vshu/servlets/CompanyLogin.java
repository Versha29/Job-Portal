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
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author acer
 */
public class CompanyLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String id2 = req.getParameter("id1");
        String cemail2 = req.getParameter("cemail1");
        String cpass2 = req.getParameter("cpass1");
        String remme2 = req.getParameter("rememberme1");

        Connection con = null;
        try {
            con = DbConnection.getConnect();

            PreparedStatement ps = con.prepareStatement("select * from company_registration where c_email=? and c_password=?");

            ps.setString(1, cemail2);
            ps.setString(2, cpass2);

            ResultSet rs = ps.executeQuery();
            System.out.println("finding result : " + ps);
            if (rs.next()) {
                String cname2 = rs.getString("c_name");
                String cphone2 = rs.getString("c_phone");
                String cloc2 = rs.getString("c_location");
                String clogo=rs.getString("c_logo");

                session.setAttribute("session_cid", id2);
                session.setAttribute("session_cname", cname2);
                session.setAttribute("session_cemail", cemail2);
                session.setAttribute("session_cphone", cphone2);
                session.setAttribute("session_cloc", cloc2);
                session.setAttribute("session_clogo", clogo);
                
                System.out.println("login page "+clogo);
//                if(remme2==null || remme2.equals("null"))
//                {
//                    remme2="";
//                }
//                if(remme2.equals("rememberme1"))
//                {
//                    Cookie ck1=new Cookie("cookie_email", cemail2);
//                    ck1.setMaxAge(60*60*24*365);
//                    resp.addCookie(ck1);
//                    
//                    Cookie ck2=new Cookie("cookie_status", "true");
//                    ck2.setMaxAge(60*60*24*365);
//                    resp.addCookie(ck2);
//                }
//                
//                RequestDispatcher rd=req.getRequestDispatcher("GetUserData");
//                rd.include(req, resp);
                resp.sendRedirect("company-profile.jsp");

            } else {

                //resp.sendRedirect("login.jsp");
                RequestDispatcher rd1 = req.getRequestDispatcher("header.jsp");
                rd1.include(req, resp);

                RequestDispatcher rd2 = req.getRequestDispatcher("menubar.jsp");
                rd2.include(req, resp);

                req.setAttribute("error_message", "Invalid Email and Password...!!!");
                RequestDispatcher rd3 = req.getRequestDispatcher("error.jsp");
                rd3.include(req, resp);

                RequestDispatcher rd4 = req.getRequestDispatcher("company-logindiv.jsp");
                rd4.include(req, resp);

                RequestDispatcher rd5 = req.getRequestDispatcher("footer.jsp");
                rd5.include(req, resp);

            }
        } catch (Exception e) {
            out.print(e);
            //resp.sendRedirect("login.jsp");
            RequestDispatcher rd1 = req.getRequestDispatcher("header.jsp");
            rd1.include(req, resp);

            RequestDispatcher rd2 = req.getRequestDispatcher("menubar.jsp");
            rd2.include(req, resp);

            req.setAttribute("error_message", e.getMessage());
            RequestDispatcher rd3 = req.getRequestDispatcher("error.jsp");
            rd3.include(req, resp);

            RequestDispatcher rd4 = req.getRequestDispatcher("company-logindiv.jsp");
            rd4.include(req, resp);

            RequestDispatcher rd5 = req.getRequestDispatcher("footer.jsp");
            rd5.include(req, resp);

        } finally {
            try {
                // con.close();
            } catch (Exception ee) {
                ee.printStackTrace();
            }
        }
    }

}
