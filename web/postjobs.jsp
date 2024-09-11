<%-- 
    Document   : postjobs
    Created on : May 5, 2022, 1:28:38 PM
    Author     : acer
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.vshu.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="CheckCookie"></jsp:include>

<jsp:scriptlet>
   String cname=(String)session.getAttribute("session_cname");
    String clogo = (String) session.getAttribute("session_clogo"); 
    String company=(String) session.getAttribute("session_cname");
</jsp:scriptlet>
<%--<jsp:scriptlet>
    if (cname == null ||  cname.equals("")) {
        response.sendRedirect("login.jsp");
        
    }
</jsp:scriptlet>--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post Jobs</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css"/>

    </head>
    <body>
         <jsp:include page="companyprofileheader.jsp"></jsp:include>
        <jsp:include page="menubar.jsp"></jsp:include>
           <div class="row">
                    <div class="col-md-2">
                        </div>
                   
                   <div class="col-md-8">
                    <div class="row" style="border:1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                        
                            
                        <div class="col-md-2">
                        <img src="company-logo/<jsp:expression>clogo</jsp:expression>" height="120" width="120" style="border-radius: 50px"/>
                    </div>
                        <div class="col-md-10">
                            <h3 style="color: #6600cc"> Post Jobs Details </h3><br>
                            <form action="PostJobsDetails" method="post">
                                Job Profile: <br><input type="text" placeholder="Eg. Java Developer" name="jobprofile1" class="textfield_design"/><br><br>
                                Company : <br><input type="text" value="<jsp:expression>company</jsp:expression>" readonly="" name="company1" class="textfield_design"/><br><br>
                            Experience : <br><input type="text" name="exp1"placeholder="Eg.0-5 years" class="textfield_design"/><br><br>
                            Job Description : <br><textarea name="jd1"placeholder="Requirements"class="textarea_deisgn"></textarea><br><br>
                            Salary : <br><input type="text" name="salary1" placeholder="Eg. 300000-500000 PA" class="textfield_design" /><br><br>
                            No.of Openings : <br><input type="text"  placeholder="Eg. 100" name="noofopen1" class="textfield_design"/><br><br>
                            Time-Venue : <br><input type="text" name="tv1" placeholder="Eg. 1st Jan, 2022-JH Hotel" class="textfield_design" /><br><br>
                            Job Location : <br><input type="text" name="jloc1" placeholder="Eg. Chandigarh" class="textfield_design" /><br><br>
                            Person Name : <br><input type="text" name="pname1" placeholder="Eg. Versha" class="textfield_design" /><br><br>
                            Person Profile : <br><input type="text" placeholder="Eg. HR" name="profile1" class="textfield_design"/><br><br>
                            Phone No. : <br><input type="text" name="phno1" placeholder="Eg. 9999999999" class="textfield_design" /><br><br>
                            
                            
                            
                            <input type="submit" value="Post Jobs" class="btn btn-primary"/>
                            
                        </form>
                        </div>
                            
                    </div>
                </div>
                <div class="col-md-2">
                   
                </div>
            </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
