<%-- 
    Document   : profile
    Created on : Apr 25, 2022, 11:34:55 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String gender = (String) session.getAttribute("session_gender");
    String city = (String) session.getAttribute("session_city");
    String fields = (String) session.getAttribute("session_fields");
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
        <title>Update Profile- Smart Programming</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css"/>

    </head>
    <body>
        <jsp:include page="profileheader.jsp"></jsp:include>
        <jsp:include page="menubar.jsp"></jsp:include>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-2">
                            <img src="images/profile.jpg" height="100"/>
                        </div>
                        <div class="col-md-10">
                            <h3 style="color: #6b0ef4"><jsp:expression> name.toUpperCase()</jsp:expression></h3>
                            <table>
                                <tr>
                                    <td><span style="color: #acaaaa">Gender : </span></td>
                                    <td><input type="text" value="<jsp:expression> gender</jsp:expression> " class="textfield_design"/><br><br></td>
                                </tr>
                                <tr>
                                    <td><span style="color: #acaaaa">City : </span></td>
                                    <td><input type="text" value="<jsp:expression> city</jsp:expression>" class="textfield_design"/><br><br></td>
                                </tr>
                                <tr>
                                    <td><span  style="color: #acaaaa">Fields : </span></td>
                                    <td><input type="text" value="<jsp:expression> fields</jsp:expression>" class="textfield_design"/><br><br></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Update" class="btn btn-danger"</td>
                                </tr>
                                    
                                    
                            </table>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-10">
                            <h5>Education details </h5>
                            <table>
                                <tr>
                                    <td>School: </td>
                                    <td><input type="text" value=""  class="textfield_design"/><br><br></td>
                                </tr>
                                <tr>
                                    <td>Year: </td>
                                    <td><input type="text" value=""  class="textfield_design"/><br><br></td>
                                </tr>
                                <tr>
                                    <td>College: </td>
                                    <td><input type="text" value=""  class="textfield_design"/><br><br></td>
                                </tr>
                                <tr>
                                    <td>Passing Year: </td>
                                    <td><input type="text" value=""  class="textfield_design"/><br><br></td>
                                </tr>
                                <tr>
                                    <td>Experience:  </td>
                                    <td><input type="text" value=""  class="textfield_design"/><br><br></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Update" class="btn btn-danger"</td>
                                </tr>
                            </table>

                        </div>
                    </div>

                </div>
                <div class="col-md-2"></div>
            </div>


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
