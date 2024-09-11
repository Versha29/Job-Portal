<%-- 
    Document   : jobsearch
    Created on : May 2, 2022, 5:35:26 PM
    Author     : acer
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.vshu.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:include page="CheckCookie"></jsp:include>
    <!DOCTYPE html>

<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
    String cemail = (String) session.getAttribute("session_cemail");
</jsp:scriptlet>

<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Search Jobs</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script>
            function searchJobByTech(tech)
            {
                //alert(tech);

                var obj;
                // 1. creates an XMLHttpRequest Object
                if (window.XMLHttpRequest)
                {
                    obj = new XMLHttpRequest();   //for latest browsers
                } else
                {
                    obj = new ActiveXObject("Microsoft.XMLHTTP");     //for old IE version
                }

                // 2. specify the request
                obj.open("POST", "JobSearchByTechnology?technology=" + tech, true);

                // 3. sends the request to the server
                obj.send();

                // 4. calls the function when readyState property changes
                obj.onreadystatechange = function ()
                {
                    if (obj.readyState === 4 && obj.status === 200)
                    {
                        document.getElementById('respgenerated').innerHTML = obj.responseText;
                    }
                };
            }
            function searchJobByLocation(location)
            {
                //alert(tech);

                var obj;
                // 1. creates an XMLHttpRequest Object
                if (window.XMLHttpRequest)
                {
                    obj = new XMLHttpRequest();   //for latest browsers
                } else
                {
                    obj = new ActiveXObject("Microsoft.XMLHTTP");     //for old IE version
                }

                // 2. specify the request
                obj.open("POST", "JobSearchByLocation?location=" + location, true);

                // 3. sends the request to the server
                obj.send();

                // 4. calls the function when readyState property changes
                obj.onreadystatechange = function ()
                {
                    if (obj.readyState === 4 && obj.status === 200)
                    {
                        document.getElementById('respgenerated').innerHTML = obj.responseText;
                    }
                };
            }

        </script>
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
            <div class="row">
                <img src="images/eg3.jpg" width="1280"/>
            </div>
            <!-- ==============search job div starts================= -->
            <div class="row" style="position: relative" >
                <div class="col-md-1"></div>
                <div class="col-md-10 shadow-lg p-3 mb-5 bg-white rounded display_job_div"style="text-align: center;margin-top: 20px;">
                    <h3 style="color: #000099;font-family: serif"> CHOOSE A JOB YOU LOVE <br> AND YOU WILL NEVER HAVE TO WORK A DAY IN YOUR LIFE...!!!</h3><br>

                    <div class="col-md-6">
                        <br><br><br><br>
                        <input type="text" placeholder="Technology..." class="textfield_design" onkeyup="searchJobByTech(this.value)" /> <br> <br>
                        OR <br> <br>
                        <input type="text" placeholder="Location..." class="textfield_design" onkeyup="searchJobByLocation(this.value)"/> <br> <br>
                    </div>
                    <div class="col-md-6"style="color: #000099;font-family: serif;font-weight: bold;font-size: 18px;">
                        <img src="images/abt.png" height="300" width="400" />
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
            <!-- ==============search job div ends================= -->

            <div class="row">
                <div class="col-md-2">

                </div>
                <div class="col-md-8" style="margin-top: 10px">
                    <div class="row">
                        <div class="col-md-12" >

                            <span id="respgenerated"> </span>

                        </div>
                    </div>
                </div>
                <div class="col-md-2">

                </div>
            </div><br><br>

        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
