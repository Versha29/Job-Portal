<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.vshu.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<jsp:include page="CheckCookie"></jsp:include>

<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
    String cemail = (String) session.getAttribute("session_cemail");
</jsp:scriptlet>

<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Companies</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>


        <jsp:scriptlet>
            if (email != null) {
        </jsp:scriptlet>
        <jsp:include page="profileheader.jsp"></jsp:include>

        <jsp:scriptlet>
        } else if (cemail != null) {
        </jsp:scriptlet>
        <jsp:include page="companyprofileheader.jsp"></jsp:include>
        <jsp:scriptlet>
        } else {
        </jsp:scriptlet>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:scriptlet>
            }
        </jsp:scriptlet>
        <jsp:include page="menubar.jsp"></jsp:include>

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-5"style="text-align: left;">

                    <h1 style=" font-family: sans-serif; text-decoration: underline"> OUR PARTNERS </h1>
                    <p style="font-size: 20px;margin-top: 80px" class="glyphicon glyphicon-hand-right"> Find the best career for you based on your skills, education, and levels of experience.</p><br><br>
                    <p style="font-size: 20px ;" class="glyphicon glyphicon-hand-right"> Work is changing, and remote and hybrid jobs are becoming a new normal.</p><br><br>
                    <p style="font-size: 20px ;" class="glyphicon glyphicon-hand-right"> Now,"the office" is often a home office, hybrid workplace, or wherever you want to set up. </p><br><br>
                    <p style="font-size: 20px ;" class="glyphicon glyphicon-hand-right"> Work-from-anywhere jobs give job-seekers ultimate flexibility and independence.</p><br><br>
                    <p style="font-size: 20px ;"  class="glyphicon glyphicon-hand-right"> Explore multiple companies with remote entry-level jobs, along with industries that are perfect for new grads.
                    </p>
                </div>
                <div class="col-md-5">
                    <img src="images/handshake.png"/>
                </div>
                <div class="col-md-1"></div>
            </div>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-8" style=" margin-top: 10px">

                    <div class="row">
                    <jsp:scriptlet>
                        String c_id = "", c_name = "", c_email = "", c_logo = "", c_phone = "", c_loc = "";
                        try {
                            Connection con = DbConnection.getConnect();

                            PreparedStatement ps = con.prepareStatement("select * from company_registration");
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                                c_id = rs.getString("id");
                                c_name = rs.getString("c_name");
                                c_email = rs.getString("c_email");
                                c_logo = rs.getString("c_logo");
                                c_phone = rs.getString("c_phone");
                                c_loc = rs.getString("c_location");
                    </jsp:scriptlet>

                    <div class="col-md-12 display_job_div shadow p-3 mb-5 bg-blue rounded menubardiv ">
                        <div class="row">
                            <div class="col-md-2">
                                <img src="company-logo/<jsp:expression>c_logo</jsp:expression>" height="120" width="120" />
                                </div>
                                <div class="col-md-10">
                                    <b style="font-size: 20px;  "> <jsp:expression>c_name</jsp:expression></b> <span style="font-size: 20px; color: #9f9d9d;"> (<jsp:expression>c_email</jsp:expression>)</span> <br> <br>
                                <span class="glyphicon glyphicon-phone-alt" style="font-size: 18px;"></span> &nbsp; <span style="color: #9f9d9d; font-size: 16px;"> Phone No : </span> <jsp:expression>c_phone</jsp:expression> <br>
                                <span class="glyphicon glyphicon-map-marker" style="font-size: 18px;"></span> &nbsp; <span style="color: #9f9d9d; font-size: 16px;"> Location : </span> <jsp:expression>c_loc</jsp:expression>  <br>

                                    <br><a href="companyjobs.jsp?c_email=<jsp:expression>c_email</jsp:expression>" class="btn btn-primary" style="color: white;">View Jobs</a>
                                </div>
                            </div>
                        </div>

                    <jsp:scriptlet>
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    </jsp:scriptlet>
                    <a href="company-profile.jsp"></a>
                </div>
            </div>
            <div class="col-md-2" style="text-align: center;margin-top: 20px;">

                <a href="https://smartprogramming.in/" > <img src="images/smartprogramming.jpg" /> </a> <br> Smart Programming <br><br>
                <a href="https://www.bebotechnologies.com/"> <img src="images/bebotech.jpg" /> </a> <br>Bebo Technologies<br><br>
                <a href="https://www.tcs.com/">  <img src="images/tcslogo.png" /> </a> <br>Tata Consultancy Services<br><br>
                <a href="https://www.wipro.com/"> <img src="images/wipro.png" /></a> <br>Wipro<br><br>
                <a href="https://www.infosys.com/">  <img src="images/infosys.png" /> </a><br>Infosys<br><br>
                <a href="https://hexaware.com/">  <img src="images/hexaware.png" height="150" width="150"/> </a><br>Hexaware Technologies<br><br>
                <a href="https://www.techmahindra.com/"><img src="images/techmhindra.png" height="150" width="150" /> </a><br>Tech Mahindra<br><br>
                <a href="https://hcl.com/">  <img src="images/hcl.png"height="150" width="150" /> </a><br>HCL Technologies<br><br><br><br>
                <a href="https://www.mindtree.com/">  <img src="images/mindtree.png"height="150" width="150" /> </a><br>Mind Tree<br><br>
                <!--                    <a href="https://www.mphasis.com/home.html">  <img src="images/mphasis.jpg"height="130" width="150" /> </a><br>MPhasis<br><br>-->
            </div>
            <div class="col-md-1"></div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>