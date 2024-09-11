<%-- 
    Document   : aboutus
    Created on : May 3, 2022, 5:09:30 PM
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

<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
    String cemail = (String) session.getAttribute("session_cemail");
</jsp:scriptlet>

<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>About Us</title>

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

            <div class="container-fluid">
               
                <h2 style="text-align: center;">ABOUT TOILSEEKER</h2>

                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8 intro-img " style="text-align: center;margin-top: 60px">
                        <img src="images/jobprtl.png"  />
                    </div>
                    <div class="col-md-2"></div>
                </div>
                

                <br><br><br><br><br><br><br><br>
                <div class="row" style="margin-top: 10px">

                    <div class="col-md-1">

                    </div>
                    <div class="col-md-10 shadow p-3 mb-5 bg-blue rounded"style="margin-top:20px; border: 1px solid black;">

                        <p>
                            At Toil Seeker,our mission is to help people get jobs and complete their DREAMS.
                            Here, You can get a job you love and you will never have to work.
                            All you have to do is to register yourself with us and build your profile based on your education ,experience and you are good to go.
                            Also you can upload your resume and let the companies and recruiters find you.
                        </p>
                        <h3>
                            Questions :-
                        </h3>

                        <h4 style="cursor: pointer;color: #000099"> 1. How we can help you ?</h4>
                        <p>If you have a common query then you can refer to FAQ's section otherwise you can contact us.<br><br>
                            <a href="faq.jsp" class="btn btn-default">FAQ's</a>  &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="contactus.jsp"class="btn btn-default">Contact Us</a>
                        </p>


                        <h4 style="cursor: pointer;color: #000099"> 2. How you can easily search and apply for a job ?</h4>
                        <p>
                            You can search for jobs that have been posted by companies on ToilSeeker based on your preferred location or technology.<br>
                            <br><a href="jobsearch.jsp" class="btn btn-default">Search Jobs</a> 
                        </p>
                    </div>
                    <div class="col-md-1">

                    </div>
                </div>
                
                 <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10 "style="text-align: center;">
                        <b><h2>OUR MISSION</h2></b>
                        <p class="shadow p-3 mb-5 bg-blue rounded"style="font-size: 16px;border: 1px solid black;">The mission of ToilSeeker is simple: Connect the world's professionals to make them more productive and successful.</p>

                    </div>
                    <div class="col-md-1"></div>
                </div>
                
                <div class="row ">
                    <div class="col-md-12">
                        <div class="service-heading">
                            <h2> KEY BENEFITS</h2>
                        </div><br>
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-2 left-ryt-space shadow-lg p-3 mb-5 bg-white rounded display_job_div">
                                <div class="service-icons">
                                    <i class="glyphicon glyphicon-list"></i>
                                </div>
                                <div class="service-subheading">
                                    <h3 style="text-align: center"> Manage Jobs</h3>
                                </div>
                                <div class="service-subpara">
                                    <p> Create detailed job profiles including job summary and employer information. Show all jobs posted by the respective company, list similar jobs, and feature selected jobs. </p>
                                </div>
                            </div>&nbsp;&nbsp;&nbsp;
                            <div class="col-md-2  left-ryt-space shadow-lg p-3 mb-5 bg-white rounded display_job_div">
                                <div class="service-icons">
                                    <i class="glyphicon glyphicon-search"></i>
                                </div>
                                <div class="service-subheading">
                                    <h3  style="text-align: center"> Search Jobs</h3>
                                </div>
                                <div class="service-subpara">
                                    <p>Search Jobs on the basis of technology,job profile or location.Better is to look for company you like and then apply for a job in same. </p>
                                </div>
                            </div>&nbsp;&nbsp;&nbsp;
                            <div class="col-md-2 left-ryt-space shadow-lg p-3 mb-5 bg-white rounded display_job_div">
                                <div class="service-icons">
                                    <i class="glyphicon glyphicon-education"></i>
                                </div>
                                <div class="service-subheading">
                                    <h3 style="text-align: center"> Employer Profile </h3>
                                </div>
                                <div class="service-subpara">
                                    <p> Companies can create their profiles, add their contact details and describe their business. They can easily post job ads, review candidates. </p>
                                </div>
                            </div>&nbsp;&nbsp;&nbsp;
                            <div class="col-md-2 left-ryt-space shadow-lg p-3 mb-5 bg-white rounded display_job_div">
                                <div class="service-icons">
                                    <i class="glyphicon glyphicon-user"></i>
                                </div>
                                <div class="service-subheading">
                                    <h3 style="text-align: center"> Job Seeker Profile </h3>
                                </div>
                                <div class="service-subpara">
                                    <p> After signup, job seekers can add their personal info and career path. They can specify their job preferences, upload their CV, and review their application history. </p>
                                </div>
                            </div>&nbsp;&nbsp;&nbsp;
                            <div class="col-md-2 left-ryt-space shadow-lg p-3 mb-5 bg-white rounded display_job_div">
                                <div class="service-icons">
                                    <i class="glyphicon glyphicon-ok"></i>
                                </div>
                                <div class="service-subheading">
                                    <h3 style="text-align: center"> Job Application </h3>
                                </div>
                                <div class="service-subpara">
                                    <p>Job seeker can apply to the jobs they are interested in and can access their job applications from My Applied Jobs menu,also they can delete the application if required. </p>
                                </div>
                            </div>

                            <div class="col-md-1"></div>
                        </div>
                    </div>
                </div>               
            </div>
        <jsp:include page="helpdiv.jsp"></jsp:include>
    </body>
</html>