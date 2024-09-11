<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="CheckCookie"></jsp:include>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
            <title>Register-Smart Programming</title>

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
                    var name2 = document.regform.name1.value;
                    var email2 = document.regform.email1.value;
                    var pass2 = document.regform.pass1.value;
                    var gender2 = document.regform.gender1.value;
                    // var fields2 = document.regform.field1.value;
                    var city2 = document.regform.city1.value;

                    var name_pattern = /^[a-zA-Z ]{3,30}$/;
                    var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
                    var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
                    //var phno_pattern=/^[0-9]{10}$/;

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
                    if (gender2 === "")
                    {
                        document.getElementById('gender_error').innerHTML = "Please select Gender";
                        flag = false;
                    }
                    /*else if(fields2==="")
                     {
                     alert("Please select atleast one field");
                     return false;
                     }*/
                    if (city2 === "Select City")
                    {
                        document.getElementById('city_error').innerHTML = "Please select city";
                        flag = false;
                    }
                    return flag;


                    //                if(name2==="")
                    //                {
                    //                    alert("Name cannot be empty");
                    //                    return false;
                    //                }
                    //                else if(email2==="")
                    //                {
                    //                    alert("Email cannot be empty");
                    //                    return false;
                    //                }
                    //                else if(pass2==="")
                    //                {
                    //                    alert("Password cannot be empty");
                    //                    return false;
                    //                }
                    //                else if(gender2==="")
                    //                {
                    //                    alert("Please select Gender");
                    //                    return false;
                    //                }
                    //                /*else if(fields2==="")
                    //                {
                    //                    alert("Please select atleast one field");
                    //                    return false;
                    //                }*/
                    //                else if(city2==="Select City")
                    //                {
                    //                    alert("Please select City");
                    //                    return false;
                    //                }
                    //                else
                    //                {
                    //                    document.regform.action="reg";
                    //                    document.regform.submit();
                    //                }
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

                <div class="row">
                    
                    <div class="col-md-4" style="margin-left: 20px ;font-size: 18px; margin-top: 40px;">
                        <img src="images/regis.gif" height="360" width="500" alt="register"/><br><br>
                        <span style="text-align: center">
                            <p style="font-size: 22px;font-weight: bold;font-family: serif;">Registering here can help you to : </p>
                        <p>1. Build your Profile</p>
                        <p>2. Search for job which is relevant to you</p>
                        <p>3. Apply for suitable job and grow your career</p><br>
                        <p style="text-align: center">Already Registered ?   <a href="login.jsp">Login Here</a></p>
                        </span>
                    </div>
                    <div class="col-md-1">
                    </div>
                    <div class="col-md-6" style="border: 2px solid skyblue; text-align: center;margin-top: 40px; margin-bottom: 40px" >
                        <form method="post" name="regform" onsubmit="return validation()" action="reg">
                            <br><h2 style="font-family: serif;font-weight: bold">FIND A JOB AND GROW YOUR CAREER</h2>
                            <h3 style="font-family: serif;font-weight: bold">by registering with ToilSeeker</h3><br>
                            Full Name <br><input type="text" placeholder="Enter Name" name="name1" class="reglog_tf_design" onkeyup="val('name_error')"/><br><span id="name_error" style="color:red"></span><br><br>
                            Email Id <br><input type="text" placeholder="Enter Email" name="email1" class="reglog_tf_design"onkeyup="val('email_error')"/><br><span id="email_error"  style="color:red"></span><br><br>
                            Password<br><input type="password" placeholder="Enter Password" name="pass1" class="reglog_tf_design"onkeyup="val('password_error')" id="myInput" /><br><span id="password_error" style="color:red"></span><br>
                            <input type="checkbox" onclick="myFunction()">Show Password<br><br>
                            <b>Select Gender : </b><input type="radio" name="gender1" value="Male" onclick="val('gender_error')"/>Male<input type="radio" name="gender1" value="Female"onclick="val('gender_error')"/>Female<br><span id="gender_error" style="color:red"></span><br><br>
                            <select name="city1" class="reglog_tf_design" onclick="val('city_error')">
                                <option>Select City</option>
                                <option value="Delhi">Delhi</option>
                                <option value="Chandigarh">Chandigarh</option>
                                <option value="Ambala">Ambala</option>
                                <option value="Noida">Noida</option>
                                <option value="Noida">Hamirpur</option>
                                <option value="Noida">Kangra</option>
                                <option value="Noida">Dharamshala</option>
                                <option value="Noida">Mumbai</option>
                                <option value="Noida">Hydrabad</option>
                                <option value="Noida">Chennai</option>
                                <option value="Noida">Pune</option>
                                <option value="Noida">Other</option>
                            </select><br><span id="city_error" style="color:red"></span><br><br>
                            <input type="submit" value="Register Now"class="btn btn-primary"/><br><br>
                        </form>

                    </div>
                    <div class="col-md-1">
                    </div>
                </div>

            </div>
        <jsp:include page="helpdiv.jsp"></jsp:include>
    </body>
</html>