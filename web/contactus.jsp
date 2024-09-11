<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.vshu.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<jsp:include page="CheckCookie"></jsp:include>

<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
    String cemail=(String)session.getAttribute("session_cemail");
</jsp:scriptlet>

<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Contact us</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body>
       
            <jsp:scriptlet>
                if(email!=null)
                {
            </jsp:scriptlet>
             <jsp:include page="profileheader.jsp"></jsp:include>
             
            <jsp:scriptlet>
                }
            else if(cemail!=null)
            {

            </jsp:scriptlet>
              <jsp:include page="companyprofileheader.jsp"></jsp:include>
            <jsp:scriptlet>
                }
                else
                {
            </jsp:scriptlet>
             <jsp:include page="header.jsp"></jsp:include>
             <jsp:scriptlet>
                }
            </jsp:scriptlet>
            <jsp:include page="menubar.jsp"></jsp:include>

                <div class="row">
                    
                    <div class="col-md-12" style="margin-top: 10px">
                    <jsp:scriptlet>
                    if(email == null ? email == null : email.trim().equals("null"))
                    {
                    </jsp:scriptlet>
                    <jsp:include page="contactusnouser.jsp"></jsp:include>
                    <jsp:scriptlet>
                    }
                    else
                    {
                    </jsp:scriptlet>
                    <jsp:include page="contactususer.jsp"></jsp:include>
                    <jsp:scriptlet>
                    }
                    </jsp:scriptlet>
                    </div>
                    
                </div>

               

            <jsp:include page="footer.jsp"></jsp:include>
        
    </body>
</html>