<%-- 
    Document   : profile
    Created on : Apr 25, 2022, 11:34:55 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="CheckCookie"></jsp:include>
<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String gender = (String) session.getAttribute("session_gender");
    String city = (String) session.getAttribute("session_city");
    String fields = (String) session.getAttribute("session_fields");
    String title = (String) session.getAttribute("session_title");
    if(title==null || title.equals(""))
    {
        title="";
    }
    String skills = (String) session.getAttribute("session_skills");
    if(skills==null || skills.equals(""))
    {
        skills= "";
    }
     
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
        <title>Update Profile- Smart Programming</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <script>
            function changeGender()
            {
                document.getElementById('changegendertf').value=document.getElementById('changegender').value;
            }
            function changeCity()
            {
                 document.getElementById('changecitytf').value=document.getElementById('changecity').value;
            }
        </script>
    </head>
    <body>
        <jsp:include page="profileheader.jsp"></jsp:include>
        <jsp:include page="menubar.jsp"></jsp:include>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="row" style="border:1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                        <div class="col-md-2">
                        <img src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="120"  width="120"style="border-radius: 50%"/>
                    </div> 
                        <div class="col-md-10">
                            <h3>Edit Personal Details</h3><br>
                            <form action="EditProfileAbout" method="post">
                                <b> <jsp:expression>name</jsp:expression></b> (<jsp:expression> session.getAttribute("session_email")</jsp:expression>)<br><br>
                            <input type="text" value="<jsp:expression>name</jsp:expression>" name="name1" placeholder="Enter Name" class="textfield_design"/><br><br>
                            <input id="changegendertf" type="text" value="<jsp:expression>gender</jsp:expression>" name="gender1"placeholder="Select Gender" class="textfield_design"/>
                            <select id="changegender" onchange="changeGender()">
                                <option disabled="">Select Gender</option>
                                <option>Male</option>
                                <option>Female</option>
                            </select><br><br>
                            <input id="changecitytf"  type="text" value="<jsp:expression>city</jsp:expression>" name="city1" placeholder="Select City"class="textfield_design"/>
                            <select id="changecity" onchange="changeCity()">
                                <option disabled=""> Select City</option>
                                <option value="Delhi">Delhi</option>
                                <option value="Chandigarh">Chandigarh</option>
                                <option value="Ambala">Ambala</option>
                                <option value="Noida">Noida</option>
                                <option value="Chennai">Chennai</option>
                                <option value="Mumbai">Mumbai</option>
                                <option value="Other">Other</option>
                                
                            </select><br><br>
                            <input type="text" value="<jsp:expression>title</jsp:expression>" name="title1"class="textfield_design" placeholder="Profile Title"/><br><br>
                            <textarea placeholder="Skills" name="skills1" class="textarea_deisgn"><jsp:expression>skills</jsp:expression></textarea><br><br>
                            <input type="submit" value="Update" class="btn btn-primary"/>
                            
                        </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
