<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
</jsp:scriptlet>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Menubar</title>
    </head>
    <body>
        <div class="row" style="border: 1px solid #999999">
            <div class="col-md-7" id="mynavbar">
                <ul>
                    <li> <a href="index.jsp" > Home </a> </li>
                    <li> <a href="jobsearch.jsp"> Search Jobs </a> </li>
                    <li> <a href="companies.jsp"> Companies </a> </li>
                        <jsp:scriptlet>
                                if (email == null ? email == null : email.trim().equals("null")) {
                        </jsp:scriptlet>

                    <jsp:scriptlet>
                        } else {
                    </jsp:scriptlet>
                    <li> <a href="myappliedjobs.jsp"> My Applied Jobs </a> </li>
                        <jsp:scriptlet>
                                }
                        </jsp:scriptlet>
                </ul>
            </div>
            <div class="col-md-5" id="mynavbar">
                <ul>
                    <li> <a href="aboutus.jsp"> About Us </a> </li>
                    <li> <a href="contactus.jsp"> Contact Us </a> </li>
                </ul>
            </div>
        </div>
    </body>
</html>