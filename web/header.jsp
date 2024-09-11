<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Header</title>

        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"> 
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row" style="background-color: #333333;">
                <div class="col-md-8">
                    <a href="index.jsp">
                        <img src="images/toilseeker.png"height="40"/>
                        <span style="font-weight: bold; font-size:20px; color: white; ">TOIL SEEKER</span>
                    </a>
                </div>
                <div class="col-md-2">
                    <a  style="color: white; text-decoration: none;"  data-toggle="dropdown" href="#1"class="dropdown-menubar ">JobSeeker
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu ">
                        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>&nbsp; Login</a></li>
                        <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp; Register</a></li>
                    </ul>
                </div>
                <div class="col-md-2 ">
                    <a  style="color: white; text-decoration: none;"  data-toggle="dropdown" href="#2"class="dropdown-menubar">Employers
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="company-login.jsp"><span class="glyphicon glyphicon-log-in"></span>&nbsp; Company Login</a></li>
                        <li><a href="company-register.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp; Company Register</a></li>
                    </ul>
                </div>

            </div>
        </div>

    </body>
</html>