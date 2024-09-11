<%-- 
    Document   : forgotcomppass
    Created on : Jul 4, 2022, 5:52:33 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company- Forgot Password</title>
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    <body>
        <div>
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:include page="menubar.jsp"></jsp:include>

            </div>
            <div class="container-fluid" >
                <div class="row" >
                    <div class="col-md-6"style="text-align: center; margin-top: 40px">
                        <img src="images/fcp.webp" width="600"  />
                    </div>
                    
                    <div class="col-md-5"style="border: 2px solid #990099;margin-top: 40px;margin-bottom: 40px;">
                        <form method="post"action="ForgotCompPass" style="text-align: center">
                            <h1 style="font-family: serif;font-weight: bold;color: #990099">Forgot Password...?</h1><br><br>
                            
                            Email Id Registered<br><input type="text" name="compemail1" placeholder="Enter Email Id" class="reglog_tf_design"/><br><br><br>
                            New Password <br><input type="password" name="newcomppass1" id="myInput" placeholder="Enter New Password" class="reglog_tf_design"/><br><br><br>
                            <input type="checkbox" onclick="myFunction()">Show Password<br><br>
                            <input type="submit" value="SUBMIT" class="btn btn-primary"/><br><br>
                            <a href="company-login.jsp"style="color: #990099">Go back to Company's Login Page </a><br><br>
                        </form>
                    </div>
                    <div class="col-md-1"></div>
                </div>

            </div>
        <jsp:include page="helpdiv.jsp"></jsp:include>

    </body>
</html>
