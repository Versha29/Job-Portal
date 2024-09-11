
<%@page import="java.lang.String"%>
<%@page import="com.vshu.servlets.PathDetails"%>
<%@page import="java.io.File"%>
<%@page import="com.vshu.connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="CheckCookie"></jsp:include>

<jsp:declaration>Connection con = null;</jsp:declaration>

<jsp:scriptlet>
    String cemail = (String) session.getAttribute("session_cemail");
    String cname = (String) session.getAttribute("session_cname");
    String cphone = (String) session.getAttribute("session_cphone"); 
    String cloc = (String) session.getAttribute("session_cloc");
    String clogo=(String) session.getAttribute("session_clogo");  
    System.out.println(clogo);
</jsp:scriptlet>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome: <jsp:expression> cname</jsp:expression></title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <link rel="stylesheet" type="text/css" href="css/style.css"/>

        </head>
        <body>
        <jsp:include page="companyprofileheader.jsp"></jsp:include>
        <jsp:include page="menubar.jsp"></jsp:include>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="row" style="border:1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                        <div class="col-md-2">
                            <a href="editcompanyprofilepic.jsp" style="font-size: 15px; float: right"><span class="glyphicon glyphicon-pencil"></span></a>

                            <img src="company-logo/<jsp:expression>clogo</jsp:expression>" height="120" width="120" style="border: 1px solid black;border-radius: 50%"/> 
                        </div>
                        <div class="col-md-10">
                            <h3 style="color: #6b0ef4"><jsp:expression>cname</jsp:expression>  <a href="editcompanyprofile.jsp" style="font-size: 15px; float: right"><span class="glyphicon glyphicon-pencil"></span></a></h3>

                            <span  style="color: #acaaaa">Email : </span><jsp:expression>cemail</jsp:expression><br>
                        <span class="glyphicon glyphicon-phone-alt"style="color: #acaaaa"> Contact: </span><jsp:expression>cphone</jsp:expression><br>
                        <span class="glyphicon glyphicon-map-marker" style="color: #acaaaa"> Location: </span><jsp:expression>cloc</jsp:expression><br>
                        </div>
                    </div><br><br>
                    <div class="row"style="border:1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">

                        <div class="col-md-12">
                            <h4>Post Jobs  <a href="postjobs.jsp" style="font-size: 12px; float: right"><span class="glyphicon glyphicon-plus"></span></a></h4>
                                <jsp:scriptlet>
                                   String id = "", job_profile = "", company = "", experience = "", description = "", date1 = "", time1 = "";
                                   try {
                                       Connection con = DbConnection.getConnect();

                                       PreparedStatement ps = con.prepareStatement("select * from jobs where c_email=?");
                                       ps.setString(1, cemail);
                                       ResultSet rs = ps.executeQuery();
                                       while (rs.next()) {
                                           id = rs.getString("id");
                                           System.out.println("compprofile==============="+id);
                                           String compid=rs.getString("id");
                                           job_profile = rs.getString("job_profile");
                                           company = rs.getString("company");
                                           experience = rs.getString("experience");
                                           description = rs.getString("description");
                                           System.out.println("desc:"+description); 
                                           date1 = rs.getString("date1");
                                           time1 = rs.getString("time1");
                                </jsp:scriptlet>
                        <div class="col-md-12 display_job_div">
                            <b> <jsp:expression>job_profile</jsp:expression></b><a href="editpostedjob.jsp?id=<jsp:expression>id</jsp:expression>" style="font-size: 12px; float: right"><span class="glyphicon glyphicon-pencil"></span></a><span style="font-size: 12px; color: #9f9d9d; float: right"> (<jsp:expression>date1</jsp:expression> & <jsp:expression>time1</jsp:expression>) &nbsp;</span> <br>
                            <span class="glyphicon glyphicon-home"></span> <span style="color: #9f9d9d"> Company : </span> <jsp:expression>company</jsp:expression>  <br>
                            <span class="glyphicon glyphicon-book"></span> <span style="color: #9f9d9d"> Experience : </span> <jsp:expression>experience</jsp:expression>  <br>
                             <span class="glyphicon glyphicon-file"></span>  <span style="color: #9f9d9d"> Job Description : </span> <jsp:expression>description</jsp:expression> <br>
                            <br><a href="jobdescription.jsp?jid=<jsp:expression>id</jsp:expression>"> See Full Details </a>
                            </div><br>
                        <jsp:scriptlet>
                                 }
                             } catch (Exception e) {
                                 e.printStackTrace();
                             }
                        </jsp:scriptlet>


                    </div>
                </div><br><br>


            </div>
            <div class="col-md-2"></div>
        </div>


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
