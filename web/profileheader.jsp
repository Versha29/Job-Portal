<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String profile_pic = (String) session.getAttribute("session_profilepic");
</jsp:scriptlet>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Welcome : <jsp:expression> name</jsp:expression> </title>
        </head>
        <body>
            <div class="container-fluid">
                <div class="row" style="background-color: #333333">

                <div class="col-md-4">
                    <a href="index.jsp">
                        <img src="images/toilseeker.png" height="40"/>
                        <span style="font-weight: bold; font-size:20px; color: white; ">TOIL SEEKER</span>
                    </a>
                </div>
                <div class="col-md-6">
                    <span style= "color:white"> <a href="profile.jsp" style="text-decoration: none; color: white;font-size: 18px;padding-left: 100px"> <img src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="30" style="border-radius: 15px"/>  <jsp:expression> name</jsp:expression> </a></span>
                </div>
                <div class="col-md-2">
                <a href="Logout" style="color: white; margin-top: 30px">Logout</a>
                </div>

        </div>

            </div>
    </body>
</html>