/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vshu.servlets;

import com.vshu.connection.DbConnection;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author acer
 */
public class UpdateCompanyProfilePic extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        HttpSession session=req.getSession();
        String cemail=(String)session.getAttribute("session_cemail");
        
        String file_name = null;
        try
        {
            DiskFileItemFactory factory=new DiskFileItemFactory();
            ServletFileUpload sfu=new ServletFileUpload(factory);
            List<FileItem> items=sfu.parseRequest(req);
            FileItem item=items.get(0);
            String file_path=item.getName();
            File file=new File(file_path);
            file_name=file.getName();
            
            File f1=new File(PathDetails.COMPANY_LOGO_PATH+file_name);
            item.write(f1);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        Connection con=null;
        try
        {
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
            
            PreparedStatement ps=con.prepareStatement("update company_registration set c_logo=? where c_email=?");
            ps.setString(1, file_name);
            ps.setString(2, cemail);
            
            int i=ps.executeUpdate();
            if(i>0)
            {
                session.setAttribute("session_clogo", file_name);
                con.commit();
                resp.sendRedirect("editcompanyprofilepic.jsp");
            }
            else
            {
                con.rollback();
                 req.setAttribute("error_message", "something went wrong...!!!");
                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("editcompanyprofilepic.jsp");
                rd2.include(req, resp);
            }
        }
        catch(Exception e)
        {
            try
            {
                con.rollback();
                 req.setAttribute("error_message", e.getMessage());
                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("editcompanyprofilepic.jsp");
                rd2.include(req, resp);
            }
            catch(Exception ee)
            {
                ee.printStackTrace();
            }
            e.printStackTrace();
        }
        finally
        {
            try
            {
                con.close();
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
    }
    
}
