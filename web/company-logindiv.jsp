
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company Login</title>
        <style>
            .field-icon {
                float: right;
                margin-left: -25px;
                margin-top: -25px;
                position: relative;
                z-index: 2;
            }

        </style>
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
    <body>
        <div class="row" style="margin-top: 30px">

            <div class="col-md-1">
            </div>
            <div class="col-md-5 shadow-lg p-3 mb-5 bg-white rounded spacing display_job_div" >
                <form method="post" action="CompanyLogin" style="text-align: center">
                    
                    <br><h2 style="font-family: serif">LOGIN</h2><br>
                    <p>New to ToilSeeker ? <a href="company-register.jsp">Register Here</a></p>
                    Email Id : <br><input type="text" placeholder="Enter Email Id" name="cemail1" class="reglog_tf_design"/><br><br>
                    Password : <br><input type="password" placeholder="Enter Password" name="cpass1" class="reglog_tf_design"id="myInput" /><br><br>
                    <input type="checkbox" onclick="myFunction()">Show Password<br><br>

                    
                    <input type="submit" id="submit"  value="Login"class="btn btn-success"/><br><br>
                    <a href="forgotcomppass.jsp">Forgot Password ? </a> <br><br>
                </form>

            </div>
            <div class="col-md-6">
                <h3 style="text-align: center">TOIL SEEKER SUITE FOR COMPANIES</h3>
                <h4 style="text-align: center">From campus to senior level Hiring</h4>
                <img src="images/complogin.gif" style="margin-left: 80px"alt="reg" style="margin-left: 150px;"height="400" width="400"/>
            </div>
            
            <div class="col-md-2">
            </div>
        </div>
    </body>
</html>
