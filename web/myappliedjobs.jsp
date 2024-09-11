<%-- 
    Document   : myappliedjobs
    Created on : May 2, 2022, 11:52:56 AM
    Author     : acer
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.vshu.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<jsp:include page="CheckCookie"></jsp:include>
<jsp:declaration>
    String email;
</jsp:declaration>
<jsp:scriptlet>
    email = (String) session.getAttribute("session_email");
</jsp:scriptlet>

<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>My Applied Jobs</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
        <div>

            <jsp:scriptlet>
                if (email == null ? email == null : email.trim().equals("null")) {
            </jsp:scriptlet>
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:scriptlet>
            } else {
            </jsp:scriptlet>
            <jsp:include page="profileheader.jsp"></jsp:include>
            <jsp:scriptlet>
                }
            </jsp:scriptlet>
            <jsp:include page="menubar.jsp"></jsp:include>

                <div class="row">
                    <div class="col-md-1">

                    </div>
                    <div  class="col-md-10" style=" margin-top: 10px">
                        <div class="row">
                           <div class="col-md-1"></div>
                           <div class="col-md-5">
                               <img src="images/eg2.jpg"/>
                       
                           </div> 
                           <div class="col-md-5">
                               
                           </div>
                            <div class="col-md-1"></div>
                        </div>
                        
                        <div class="row">
                        <jsp:scriptlet>

                            String jobid = "", job_profile = "", company = "", experience = "", description = "", date1 = "", time1 = "";
                            try {
                                Connection con = DbConnection.getConnect();

                                PreparedStatement ps = con.prepareStatement("select * from applied_jobs where email=?");
                                ps.setString(1, email);
                                ResultSet rs = ps.executeQuery();
                                while (rs.next()) {
                                    jobid = rs.getString("jobid");

                                    PreparedStatement ps2 = con.prepareStatement("select * from jobs where id=?");
                                    ps2.setString(1, jobid);
                                    ResultSet rs2 = ps2.executeQuery();
                                    while (rs2.next()) {
                                        job_profile = rs2.getString("job_profile");
                                        company = rs2.getString("company");
                                        experience = rs2.getString("experience");
                                        description = rs2.getString("description");
                                        date1 = rs2.getString("date1");
                                        time1 = rs2.getString("time1");
                        </jsp:scriptlet>

                        <div class="col-md-12 display_job_div shadow-lg p-3 mb-5 bg-white rounded">
                            <b> <jsp:expression>job_profile</jsp:expression></b> <span style="font-size: 12px; color: #9f9d9d; float: right"> (<jsp:expression>date1</jsp:expression> & <jsp:expression>time1</jsp:expression>)</span> <br>
                            <span class="glyphicon glyphicon-home"></span> <span style="color: #9f9d9d"> Company : </span> <jsp:expression>company</jsp:expression> </span> <br>
                            <span> <span class="glyphicon glyphicon-book"></span> <span style="color: #9f9d9d"> Experience : </span> <jsp:expression>experience</jsp:expression> </span> <br>
                            <span> <span class="glyphicon glyphicon-file"></span>  <span style="color: #9f9d9d"> Job Description : </span> <jsp:expression>description</jsp:expression> </span> <br>
                            <br><a href="jobdescription.jsp?jid=<jsp:expression>jobid</jsp:expression>" class="btn btn-primary"> See Full Details </a>
                            </div>

                        <jsp:scriptlet>
                                    }
                                }
                            } catch (Exception e) {
                                out.print(e);
                            }
                        </jsp:scriptlet>

                    </div>
                </div>
                <div class="col-md-1">

                </div>
            </div>
            <br><br><br><br>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>
