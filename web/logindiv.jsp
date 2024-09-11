<%-- 
    Document   : logindiv
    Created on : Apr 25, 2022, 11:47:33 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script>
            function myFunction() {
                var x = document.getElementById("myInput");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
        </script>
    </head>
    <body><br><br><br><br>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-5" style="text-align: center;font-size: 18px;margin-top: 20px;">
                
                <h2 style="font-family: serif;font-weight: bold">New to Toil Seeker?</h2><br>
                <img src="images/back.jpg">
                <br><br><p># Apply for relevant jobs using Profile.</p>
                <p># Get jobs easily through location and technology</p>
                <p># Know Application History on Applied jobs</p><br>
                <a href="register.jsp" style="border: 1px solid skyblue;padding: 10px 10px; text-decoration: none">Register for Free</a>
            </div>
            <div class="col-md-5 shadow-lg p-3 mb-5 bg-white rounded spacing display_job_div" >

                <form method="post" action="login" style="text-align: center">
                    <br><h2 style="font-family: serif;font-weight: bold">Login to your ToilSeeker Account</h2><br>
                    <span>New Client ? <a href="register.jsp" >Create Account</a> </span><br><br>
                    Email Id<br><input type="text" placeholder="Enter Email" name="email1" class="reglog_tf_design"/><br><br>
                    Password<br><input type="password" placeholder="Enter Password" name="pass1" class="reglog_tf_design"id="myInput" /><br><br>
                    <input type="checkbox" onclick="myFunction()">Show Password<br><br>
                    <input type="checkbox" name="rememberme1" value="rememberme1" />Remember Me<br><br>
                    <input type="submit" value="Login"class="btn btn-primary"/><br><br>
                    <a href="forgotpassword.jsp">Forgot Password ? </a><br><br>
                </form>

            </div>
            <div class="col-md-1">

            </div>
        </div><br><br><br><br>
    </body>
</html>
