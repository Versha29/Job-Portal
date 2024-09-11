<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="CheckCookie"></jsp:include>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
            <title>Company Register-Smart Programming</title>

            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <link rel="stylesheet" type="text/css" href="css/style.css"/>

            <script>
                function val(v)
                {
                    document.getElementById(v).innerHTML = "";
                }
                function validation()
                {
                    var flag = true;
                    var name2 = document.regform.c_name1.value;
                    var email2 = document.regform.c_email1.value;
                    var pass2 = document.regform.c_pass1.value;
                    var contact2 = document.regform.c_phone1.value;
                    var loc2 = document.regform.c_loc1.value;

                    var name_pattern = /^[a-zA-Z ]{3,30}$/;
                    var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
                    var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
//                    var phno_pattern = /^[0-9]{10}$/;
//                    var phno_pattern=/^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}$/;
                    if (!name2.match(name_pattern))
                    {
                        document.getElementById('name_error').innerHTML = "Name is not properly formatted";
                        flag = false;
                    }
                    if (name2 === "")
                    {
                        document.getElementById('name_error').innerHTML = "Name cannot be empty";
                        flag = false;
                    }
                    if (!email2.match(email_pattern))
                    {
                        document.getElementById('email_error').innerHTML = "Email is not properly formatted";
                        flag = false;
                    }
                    if (email2 === "")
                    {
                        document.getElementById('email_error').innerHTML = "Email cannot be empty";
                        flag = false;
                    }
                    if (!pass2.match(password_pattern))
                    {
                        document.getElementById('password_error').innerHTML = "Password is not properly formatted(should contain special character,uppercase letter,lowercaseletter ,number)";
                        flag = false;
                    }
                    if (pass2 === "")
                    {
                        document.getElementById('password_error').innerHTML = "Password cannot be empty";
                        flag = false;
                    }
//                    if (!contact2.match(phno_pattern))
//                    {
//                        document.getElementById('contact_error').innerHTML = "Contact No. is not properly formatted";
//                        flag = false;
//                    }
                    if (contact2 === "")
                    {
                        document.getElementById('contact_error').innerHTML = "Contact No. cannot be empty";
                        flag = false;
                    }
                    if (loc2 === "")
                    {
                        document.getElementById('location_error').innerHTML = "Location cannot be empty";
                        flag = false;
                    }
                    return flag;
                }
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
            <div>
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:include page="menubar.jsp"></jsp:include>

                <div class="container-fluid">
                    <div class="row" style="margin-top: 30px">
                        <div class="col-md-5" style="text-align: center;margin-top: 30px">
                            <h2 style="color: #0099ff">WELCOME</h2>
                            <h3>Get Started with Toil Seeker </h3>                            
                            <img src="images/compreg.gif" alt="reg"/>
                        </div>
                        <div class="col-md-1">                            
                        </div>
                        <div class="col-md-5 shadow-lg p-3 mb-5 bg-white rounded spacing display_job_div" >
                            <form method="post" name="regform" onsubmit="return validation()" action="CompanyRegistration" style="text-align: center">
                                <br><br><span style="font-weight: bold;font-size: 22px;">REGISTER YOUR COMPANY...!!!</span><br><br>
                                <p>or Already Registered ? <a href="company-login.jsp">Login Now</a></p><br>
                                
                                <input type="text" placeholder="Enter Company Name" name="c_name1" class="reglog_tf_design" onkeyup="val('name_error')"/><br><span id="name_error" style="color:red"></span><br>
                                <br><input type="text" placeholder="Enter Email ID" name="c_email1" class="reglog_tf_design" onkeyup="val('email_error')"/><br><span id="email_error"  style="color:red"></span><br>
                                <br><input type="password" placeholder="Enter Password" name="c_pass1" class="reglog_tf_design" onkeyup="val('password_error')" id="myInput" /><br><span id="password_error" style="color:red"></span><br>
                                <input type="checkbox" onclick="myFunction()">Show Password<br><br>
                                <br><input type="text" placeholder="Enter Contact No." name="c_phone1" class="reglog_tf_design" onkeyup="val('contact_error')"/><br><span id="contact_error" style="color:red"></span><br>
                                <br><input type="text" placeholder="Enter Location" name="c_loc1" class="reglog_tf_design"onkeyup="val('location_error')"/><br><span id="location_error" style="color:red"></span><br>
                                <input type="submit" value="Register"class="btn btn-primary"/><br>
                                <span>&nbsp;&nbsp;</span>
                            </form>
                        </div>                       
                    </div>
                </div>
            </div>

        <jsp:include page="helpdiv.jsp"></jsp:include>
    </body>
</html>