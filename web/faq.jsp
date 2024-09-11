<%-- 
    Document   : faq
    Created on : May 11, 2022, 6:18:40 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FAQ's</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <script src="jquery3.5/jquery.js"></script>
        <script src="jquery3.5/slidercycle.js"></script>

        <script>

            $(document).ready(function () {
                $(".div1").click(function () {
                    $(".div2").slideToggle();
                });
            });
            $(document).ready(function () {
                $("div2").false;
                $(".div3").click(function () {
                    $(".div4").slideToggle();
                });
            });
            $(document).ready(function () {
                $(".div5").click(function () {
                    $(".div6").slideToggle();
                });
            });
            $(document).ready(function () {
                $(".div7").click(function () {
                    $(".div8").slideToggle();
                });
            });
        </script>

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="menubar.jsp"></jsp:include>
        <div class="container-fluid">
            <div class="row ">
                <div class="col-md-12" style="color: black;font-size: 28px;text-align: center;font-weight: bold">
                    HI, HOW CAN WE HELP YOU?
                </div>
            </div>
            <div class="row fq">
                
                <div class="row " >
                    <div class="col-md-12" style="margin-top: 30px;">
                        <div class="service-heading">
                        </div>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-2   div1 ques-style display_job_div" >
                                <div class="service-icons" >
                                    <i class="glyphicon glyphicon-search"></i>
                                </div>
                                <div class="service-heading">
                                    How do I search for jobs?
                                </div>


                            </div>&nbsp;&nbsp;&nbsp;&nbsp;
                            <div class="col-md-2  ques-style div3 display_job_div">
                                <div class="service-icons">
                                    <i class="glyphicon glyphicon-check"></i>
                                </div>
                                <div class="service-heading">
                                    How can I apply for Job?
                                </div>
                                <div class="service-subheading">

                                </div>
                            </div>&nbsp;&nbsp;&nbsp;&nbsp;
                            <div class="col-md-2  ques-style div5 display_job_div">
                                <div class="service-icons">
                                    <i class="glyphicon glyphicon-refresh"></i>
                                </div>
                                <div class="service-heading">
                                    How to change my profile?
                                </div>
                                <div class="service-subheading">

                                </div>
                            </div>&nbsp;&nbsp;&nbsp;&nbsp;
                            <div class="col-md-2  ques-style div7 display_job_div">
                                <div class="service-icons">
                                    <i class="glyphicon glyphicon-user"></i>
                                </div>
                                <div class="service-heading">
                                    How can I create account?
                                </div>
                                <div class="service-subheading">

                                </div>
                            </div>&nbsp;&nbsp;&nbsp;&nbsp;

                            <div class="col-md-2"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 div2 shadow-lg p-3 mb-5 bg-white rounded display_job_div" style="text-align: left;font-size: 20px; display: none">
                        You can search for jobs that have been posted by companies on ToilSeeker based on your preferred location or technology.
                        <br>  <b> Here's how you can search for the right jobs on ToilSeeker:-</b>
                        <br>   1. Go to Home and scroll to Find Job Option .
                        <br>   2. In the search bar, type preferred location where you would like to get a job in the location field or technology.
                        <br>   3. Click Search.You will get jobs according to your convinience.
                        <br>   4. Now ,if you want to know more about the particular job then you can click on See Full Details.
                        <br>   5. Click on Apply if you are logged in Otherwise you have to login with valid credentials to apply.

                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 div4 shadow-lg p-3 mb-5 bg-white rounded display_job_div" style="text-align: left;font-size: 20px; display: none">
                        You can search for jobs that have been posted by companies on ToilSeeker based on your preferred location or technology.
                        <br>  <b> Here's how you can apply for the right job on ToilSeeker:-</b>
                        <br>   1. Register on ToilSeeker to create profile and then login using those credentials.
                        <br>   2. Fill details in your profile. These details will be shown to the recruiter when you apply for a job. Based on these details,the recruiter may shortlist you for an interview.
                        <br>   3. Search for jobs. Click on a job to which you would like to apply.
                        <br>   4. Click on Apply button to apply to the job.
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8  div6 shadow-lg p-3 mb-5 bg-white rounded display_job_div" style="text-align: left;font-size: 20px; display: none">
                        <br>  <b> Here's how you can change your profile details in ToilSeeker:-</b>
                        <br>   1. Register on ToilSeeker to create profile and then login using those credentials.
                        <br>   2. Your profile will open ,there will be separate icon for changing your profile details,profile picture,education details,experience details.
                        <br>   3. You can edit details by clicking on their respective icon. 
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8  div8 shadow-lg p-3 mb-5 bg-white rounded display_job_div" style="text-align: left;font-size: 20px; display: none">
                        <br>  <b> Here's how you can create your account/profile  on ToilSeeker:-</b>
                        <br>   1. Go to Home.
                        <br>   2. Click on Job Seeker and then Register.Fill your credentials and register yourself.
                        <br>   3. Again click on Job Seeker and now click on Login, login with your valid email and password. 
                        <br>   4. You will be move on to your profile.Fill details in your profile. These details will be shown to the recruiter when you apply for a job. Based on these details,the recruiter may shortlist you for an interview.


                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="col-md-12" style="margin-top: 30px; border-top: 1px solid gray;font-size: 20px; padding: 10px 10px;text-align: center">
                    Still need help? &nbsp;&nbsp;   <a href="contactus.jsp" class="glyphicon glyphicon-envelope submitreq" style="text-decoration: none">&nbsp;Submit a request</a>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
