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
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author acer
 */
public class PostJobsDetails extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession();
        String c_email2 = (String) session.getAttribute("session_cemail");
        String job_profile2 = req.getParameter("jobprofile1");
        String c_phone_no2 = req.getParameter("phno1");
        String company2 = req.getParameter("company1");
        String c_person_profile2 = req.getParameter("profile1");
        String c_person_name2 = req.getParameter("pname1");
        String experience2 = req.getParameter("exp1");
        String description2 = req.getParameter("jd1");
        String salary2 = req.getParameter("salary1");
        String no_of_openings2 = req.getParameter("noofopen1");
        String job_location2 = req.getParameter("jloc1");
        String time_venue2 = req.getParameter("tv1");

       Date d=new Date();
        SimpleDateFormat sdf1=new SimpleDateFormat("dd-MM-yyyy");
        String date1=sdf1.format(d);
        SimpleDateFormat sdf2=new SimpleDateFormat("HH:mm:ss");
        String time1=sdf2.format(d);
        
        
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DbConnection.getConnect();
            con.setAutoCommit(false);

            PreparedStatement ps1 = con.prepareStatement("insert into jobs(job_profile ,company,experience ,salary,no_of_openings ,job_location ,time_venue ,description ,c_email,c_person_name,c_person_profile ,c_phone_no,date1,time1) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

            ps1.setString(1, job_profile2);
            ps1.setString(2, company2);
            ps1.setString(3, experience2);
            ps1.setString(4, salary2);
            ps1.setString(5, no_of_openings2);
            ps1.setString(6, job_location2);
            ps1.setString(7, time_venue2);
            ps1.setString(8, description2);
            ps1.setString(9, c_email2);
            ps1.setString(10, c_person_name2);
            ps1.setString(11, c_person_profile2);
            ps1.setString(12, c_phone_no2);
            ps1.setString(13, date1);
            ps1.setString(14, time1);
            int i = ps1.executeUpdate();
            if(i>0)
            {
                con.commit();
                
                session.setAttribute("session_company", company2);
                
                resp.sendRedirect("company-profile.jsp");
            }
            else
            {
                con.rollback();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
