<%-- 
    Document   : profile
    Created on : Apr 25, 2022, 11:34:55 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="CheckCookie"></jsp:include>
<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
        String profile_pic = (String) session.getAttribute("session_profilepic");

</jsp:scriptlet>
<jsp:scriptlet>
    if (name == null || name.equals("")) {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Resume- Smart Programming</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css"/>

    </head>
    <body>
        <jsp:include page="profileheader.jsp"></jsp:include>
        <jsp:include page="menubar.jsp"></jsp:include>
        <br><br>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="row" style="border:1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                        <div class="col-md-3">
                            <img src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="150" width="150"style="border-radius: 50%"/>
                        </div>
                        <div class="col-md-9">
                            <h3>Upload Resume</h3><br>
                            <form action="UpdateResume" method="post" enctype="multipart/form-data">
                                <b> <jsp:expression>name</jsp:expression></b> (<jsp:expression> session.getAttribute("session_email")</jsp:expression>)<br><br>
                            <input type="file" name="uploadresume"/>  <br><br>  
                            <input type="submit" value="Upload Resume" class="btn btn-primary"/>

                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>

                           <br><br>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
