<%-- 
    Document   : contactususer
    Created on : May 3, 2022, 4:52:02 PM
    Author     : acer
--%>

<jsp:scriptlet>
    String name1 = (String) session.getAttribute("session_name");
    String email1 = (String) session.getAttribute("session_email");
</jsp:scriptlet>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact us</title>
        
    </head>
    <body>
        <div class="container-fluid">
            <div class="row ">

                <div class="col-md-1 "></div>

                <div class="col-md-5  shadow-lg p-3 mb-5 bg-white rounded spacing display_job_div" style="padding-top: 40px;padding-left: 10px;padding-right: 10px; margin-top: 20px;text-align: center">
                     <h1 style="font-family: serif;font-weight: bold;"> Interact with Us </h1> <br>
                    <form method="POST" action="ContactUs"><br>
                        
                        <input type="text" placeholder="Enter Name" name="name1" value="<jsp:expression>name1</jsp:expression>" readonly="" class="reglog_tf_design" /> <br> <br>
                        <input type="text" placeholder="Enter Email" name="email1" value="<jsp:expression>email1</jsp:expression>" readonly="" class="reglog_tf_design" /> <br> <br>
                        <input type="text" placeholder="Enter Subject" name="subject1" class="reglog_tf_design" /> <br> <br>
                        <textarea placeholder="Enter Message" name="message1" style="padding: 5px 10px; width: 300px; height: 100px; border-radius: 5px; border: 1px solid gray;"></textarea> <br> <br>
                        <input type="submit" value="Send" class="btn btn-primary" /> <br> <br> <br>
                    </form>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-4">
                    <img src="images/contactus.png" height="400" width="500" />
                </div>
                <div class="col-md-1"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="contactform-header" style="margin-top: 70px;text-align: center">

                        <p>
                            In case if you have any doubt you can mail us...!!
                        </p>
                        <p>

                            <span class="glyphicon glyphicon-phone-alt" style="font-size: 20px;"></span> : +91 82198-51830 &nbsp;
                            <span class="glyphicon glyphicon-envelope" style="font-size: 20px;"></span> : toilseeker@gmail.com
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
