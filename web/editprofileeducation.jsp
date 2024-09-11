<%-- 
    Document   : profile
    Created on : Apr 25, 2022, 11:34:55 AM
    Author     : acer
--%>

<%@page import="com.vshu.connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="CheckCookie"></jsp:include>
<jsp:declaration>
    Connection con=null;
     String school="",degree="",year="",grade="",description=""; 

</jsp:declaration>
<jsp:scriptlet>
   
    String profile_pic = (String) session.getAttribute("session_profilepic");
</jsp:scriptlet>
<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    
    String id=request.getParameter("id");
   
    try 
    {
        con=DbConnection.getConnect();
        con.setAutoCommit(false); 
        PreparedStatement ps= con.prepareStatement("select * from education where id=?");
        ps.setString(1, id);
        ResultSet rs=ps.executeQuery();
        while(rs.next())
        {
            school=rs.getString("school"); 
            degree=rs.getString("degree");
            year=rs.getString("year");
            grade=rs.getString("grade");
            description=rs.getString("description");
        }
                
    }catch(Exception e)
                            {
                                try{
                                        con.rollback();
                                    }catch(Exception ee)
                                    {
                                        ee.printStackTrace();
                                    }
                                    out.print(e);
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
</jsp:scriptlet>
<jsp:scriptlet>
    if (name == null || name.equals("")) {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile Education- Smart Programming</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        
        <script>
            function submitFunction(val)
            {
                if(val==='update')
                {
                    document.editeduform.action="EditEducationDetails";
                    document.editeduform.submit();
                }
                if(val==='delete')
                {
                    document.editeduform.action="DeleteEducationDetails";
                    document.editeduform.submit();
                }
            }
            
        </script>
                    
    </head>
    <body>
        <jsp:include page="profileheader.jsp"></jsp:include>
        <jsp:include page="menubar.jsp"></jsp:include>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="row" style="border:1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                        <div class="col-md-2">
                        <img src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="100" style="border-radius: 50px"/>
                    </div>
                        <div class="col-md-10">
                            <h3>Edit Educational Details</h3><br>
                            <b> <jsp:expression>name</jsp:expression></b> (<jsp:expression> session.getAttribute("session_email")</jsp:expression>)<br><br>

                           <form name="editeduform" method="post">
                            <input type="hidden" value="<jsp:expression>id</jsp:expression>" name="id1"/> 
                            School/College <br><input type="text"  name="school1" class="textfield_design" value="<jsp:expression>school</jsp:expression>"/><br><br>
                            Degree <br><input type="text" name="degree1"placeholder="10th or B.Tech"class="textfield_design" value="<jsp:expression>degree</jsp:expression>"/><br><br>
                            Year <br><input type="text" name="year1"placeholder="Eg. 2001-2004"class="textfield_design" value="<jsp:expression>year </jsp:expression>"/><br><br>
                            Grade <br><input type="text" name="grade1" placeholder="Eg. 90" class="textfield_design" value="<jsp:expression>grade </jsp:expression>"/>%<br><br>
                            Description <br><textarea  placeholder="Your Certifications, Activities and societies" name="description1" class="textarea_deisgn"><jsp:expression>description</jsp:expression></textarea><br><br>
                            <input type="submit" value="Update Education" class="btn btn-primary" onclick="submitFunction('update')"/>
                            <input type="submit" value="Delete Education" class="btn btn-primary"  onclick="submitFunction('delete')"/>
                            
                        </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
