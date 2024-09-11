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
public class EditJobDetails extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
         PrintWriter out=resp.getWriter();
        
        HttpSession session=req.getSession();
        String cemail2=(String)session.getAttribute("session_cemail");
        String id2=req.getParameter("id1");
        String jobprofile2=req.getParameter("jobprofile1");
        String company2=req.getParameter("company1");
        String experience2=req.getParameter("experience1");
        String jd2=req.getParameter("jd1");
        String salary2=req.getParameter("salary1");
        String openings2=req.getParameter("openings1");
        String timevenue2=req.getParameter("timevenue1");
        String loc2=req.getParameter("loc1");
        String pname2=req.getParameter("pname1");
        String pprofile2=req.getParameter("pprofile1");
        String pphone2=req.getParameter("pphone1");
        
        Connection  con = null;
        try
        {
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
            PreparedStatement ps=con.prepareStatement("update jobs set job_profile=?, company=?,experience=?, salary=?,no_of_openings=?,job_location=?,time_venue=?,description=?,c_person_name=?,c_phone_no=?,c_person_profile=? where id=?");
            ps.setString(1, jobprofile2);
            ps.setString(2, company2);
            ps.setString(3, experience2);
            ps.setString(4, salary2);
            ps.setString(5, openings2);
            ps.setString(6, loc2);
            ps.setString(7, timevenue2);
            ps.setString(8, jd2);
            ps.setString(9, pname2);
            ps.setString(10, pphone2);
            ps.setString(11, pprofile2);
            ps.setString(12, id2);
            int i=ps.executeUpdate();
            if(i>0)
            {
                con.commit();
                resp.sendRedirect("company-profile.jsp");
            }
            else
            {
                con.rollback();
                  req.setAttribute("error_message","Something went wrong");

                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("editpostedjob.jsp");
                rd2.include(req, resp);
            }
        }catch(Exception e)
        {
             try{
                con.rollback();
                
            }catch(Exception ee)
            {
                ee.printStackTrace();
            }
            e.printStackTrace();
             req.setAttribute("error_message", e.getMessage());

             RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("editpostedjob.jsp");
                rd2.include(req, resp);
        } finally
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
