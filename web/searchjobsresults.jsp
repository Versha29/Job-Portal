<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.vshu.connection.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="CheckCookie"></jsp:include>
<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
    String cemail = (String) session.getAttribute("session_cemail");

    String technology2 = request.getParameter("technology1");
    String location2 = request.getParameter("location1");
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Search Jobs</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    <body>
        <div>
            <jsp:scriptlet>
                if (email != null) {
            </jsp:scriptlet>
            <jsp:include page="profileheader.jsp"></jsp:include>

            <jsp:scriptlet>
            } else if (cemail != null) {
            </jsp:scriptlet>
            <jsp:include page="cpmpanyprofileheader.jsp"></jsp:include>
            <jsp:scriptlet>
            } else {
            </jsp:scriptlet>
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:scriptlet>
                 }
            </jsp:scriptlet>

            <jsp:include page="menubar.jsp"></jsp:include>
                <div class="row">
                    <img src="images/eg3.jpg" width="1280"/>
                </div>

                <!-- ================= Search job division starts===================== -->
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10 shadow-lg p-3 mb-5 bg-white rounded"style="text-align: center;margin-top: 20px;">
                        <br><h3 style="color: #000099;font-family: serif">  CHOOSE A JOB YOU LOVE <br> AND YOU WILL NEVER HAVE TO WORK A DAY IN YOUR LIFE...!!!</h3><br>
                        <form action="searchjobsresults.jsp" method="post">
                            <input type="text" name="technology1" placeholder="Technology" class="textfield_design"/>
                            <input type="text" name="location1" placeholder="Location" class="textfield_design"/>
                            <input type="submit"value="Find Jobs" class="btn btn-primary" />
                        </form><br>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- ================= Search job division ends===================== -->

                <div class="row">
                    <div class="col-md-2">

                    </div>
                    <div class="col-md-8" style=" margin-top: 10px;" >
                        <div class="row">
                        <jsp:scriptlet>
                            String id = "", job_profile = "", company = "", experience = "", description = "", date1 = "", time1 = "";
                            try {
                                Connection con = DbConnection.getConnect();

                                PreparedStatement ps = con.prepareStatement("select * from jobs where job_profile LIKE '%" + technology2 + "%' AND job_location LIKE '%" + location2 + "%'");
                                ResultSet rs = ps.executeQuery();
                                while (rs.next()) {
                                    id = rs.getString("id");
                                    job_profile = rs.getString("job_profile");
                                    company = rs.getString("company");
                                    experience = rs.getString("experience");
                                    description = rs.getString("description");
                                    date1 = rs.getString("date1");
                                    time1 = rs.getString("time1");
                        </jsp:scriptlet>
                        <div class="col-md-12 display_job_div">

                            <b><jsp:expression>job_profile</jsp:expression></b><span style="font-size: 10px;color: #9f9d9d; float: right"> (<jsp:expression>date1</jsp:expression> & <jsp:expression>time1</jsp:expression>)</span><br>
                            <span class="glyphicon glyphicon-home"></span><span style="color: #9f9d9d"> Company : </span><jsp:expression>company</jsp:expression></span><br>
                            <span class="glyphicon glyphicon-book"></span><span style="color: #9f9d9d"> Experience : </span><jsp:expression>experience</jsp:expression></span><br>
                            <span class="glyphicon glyphicon-file"></span><span style="color: #9f9d9d"> Description : </span><jsp:expression>description</jsp:expression></span><br>
                            <br><a href="jobdescription.jsp?jid=<jsp:expression>id</jsp:expression>" class="btn btn-primary"> See Full Details </a><br>
                            </div>

                        <jsp:scriptlet>
                                     }
                                 } catch (Exception e) {
                                     e.printStackTrace();
                                 }
                        </jsp:scriptlet>


                    </div>
                </div>
                <div class="col-md-2">

                </div>

            </div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </body>
</html>