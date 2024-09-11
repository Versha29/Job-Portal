
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="CheckCookie"></jsp:include>
<jsp:scriptlet>
    String cname = (String) session.getAttribute("session_cname");
    String cemail=(String)session.getAttribute("session_cemail");
    String clogo = (String) session.getAttribute("session_clogo"); 
   String cphone=(String)session.getAttribute("session_cphone");
   String cloc=(String)session.getAttribute("session_cloc");
</jsp:scriptlet>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Company Profile</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        
    </head>
    <body>
        <jsp:include page="companyprofileheader.jsp"></jsp:include>
        <jsp:include page="menubar.jsp"></jsp:include>
        <br><br>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="row" style="border:1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                         <div class="col-md-2">
                        <img src="company-logo/<jsp:expression>clogo</jsp:expression>" height="120" width="120" style="border: 1px solid black;border-radius: 50%"/>
                    </div>
                        <div class="col-md-10">
                            <h3>Edit Company Details</h3><br>
                            <form action="EditCompanyProfile" method="post">
                                <b> <jsp:expression>cname</jsp:expression></b> (<jsp:expression>cemail</jsp:expression>)<br><br>
                            <input type="text" value="<jsp:expression>cphone</jsp:expression>" name="cphone1" placeholder="Enter Contact No." class="textfield_design"/><br><br>
                            <input type="text" value="<jsp:expression>cloc</jsp:expression>" name="cloc1" placeholder="Enter Location" class="textfield_design"/><br><br>
                      
                            <input type="submit" value="Update" class="btn btn-primary"/>
                            
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
