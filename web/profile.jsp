
<%@page import="com.vshu.servlets.PathDetails"%>
<%@page import="java.io.File"%>
<%@page import="com.vshu.connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="CheckCookie"></jsp:include>

<jsp:declaration>Connection con = null;</jsp:declaration>

<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");

    String gender = (String) session.getAttribute("session_gender");
    String city = (String) session.getAttribute("session_city");
    String profile_pic = (String) session.getAttribute("session_profilepic");
    System.out.println(profile_pic);
    
    String title = (String) session.getAttribute("session_title");
    String skills = (String) session.getAttribute("session_skills");
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
        <title>Welcome: <jsp:expression> name.toUpperCase()</jsp:expression></title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <link rel="stylesheet" type="text/css" href="css/style.css"/>

        </head>
        <body>
        <jsp:include page="profileheader.jsp"></jsp:include>
        <jsp:include page="menubar.jsp"></jsp:include>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8 " >
                    <div class="row"  style="border:1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                        <div class="col-md-2">
                            <a href="editprofilepic.jsp" style="font-size: 15px; float: right"><span class="glyphicon glyphicon-pencil"></span></a>

                            <img src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="120" width="120"style="border-radius: 50%"/>
                        </div>
                        <div class="col-md-10">
                            <h3 style="color: #6b0ef4"><jsp:expression> name.toUpperCase()</jsp:expression>  <a href="editprofileabout.jsp" style="font-size: 15px; float: right"><span class="glyphicon glyphicon-pencil"></span></a></h3>
                        <span><jsp:expression> title</jsp:expression></span><br><br>
                        <span style="color: #acaaaa">Skills : </span><jsp:expression> skills</jsp:expression><br>
                        <span style="color: #acaaaa">Gender : </span><jsp:expression> gender</jsp:expression><br>
                        <span style="color: #acaaaa">City : </span><jsp:expression> city</jsp:expression><br>
                        
                        </div>
                    </div><br><br>
                    <div class="row"style="border:1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">

                        <div class="col-md-12 ">
                            <h4>EDUCATION DETAILS <a href="addprofileeducation.jsp" style="font-size: 12px; float: right"><span class="glyphicon glyphicon-plus"></span></a></h4>
                                <jsp:scriptlet>
                                    String school = "", degree = "", grade = "", year = "", id = "";
                                    String email = (String) session.getAttribute("session_email");

                                    try {
                                        con = DbConnection.getConnect();
                                        con.setAutoCommit(false);

                                        PreparedStatement ps = con.prepareStatement("select * from education where email=?");
                                        ps.setString(1, email);
                                        ResultSet rs = ps.executeQuery();
                                        while (rs.next()) {
                                            id = rs.getString("id");
                                            school = rs.getString("school");
                                            degree = rs.getString("degree");
                                            grade = rs.getString("grade");
                                            year = rs.getString("year");
                                </jsp:scriptlet>

                        <div class="row display_job_div" style="margin-right: 2px;background-color: #eeecec; margin-left: 2px;border-radius: 10px;">
                            <div class="col-md-2"> &nbsp;&nbsp;&nbsp; <img src="images/school.png" height="70" /> </div>
                            <div class="col-md-10">
                                <a href="editprofileeducation.jsp?id=<jsp:expression>id</jsp:expression>" style="font-size: 12px; float: right"> <span class="glyphicon glyphicon-pencil"></span> </a>
                                <b> <span class="glyphicon glyphicon-home">&nbsp;</span> <jsp:expression>school</jsp:expression> <br> </b>
                                <span class="glyphicon glyphicon-book"></span> &nbsp; <jsp:expression> degree</jsp:expression> <span style="color: #858585">(<jsp:expression> year</jsp:expression>)</span> <br>
                                <span class="glyphicon glyphicon-file"></span> &nbsp; <jsp:expression> grade</jsp:expression>% <br>
                                </div>
                            </div> <br>

                        <jsp:scriptlet>
                                }
                            } catch (Exception e) { 
                                try {
                                    con.rollback();
                                } catch (Exception ee) {
                                    ee.printStackTrace();
                                }
                                out.print(e);
                            } finally {
                                try {
                                    con.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                        </jsp:scriptlet>

                    </div>
                </div><br><br>

                <div class="row"style="border:1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">

                    <div class="col-md-12">
                        <h4>EXPERIENCE DETAILS  <a href="addprofileexperience.jsp" style="font-size: 12px; float: right"><span class="glyphicon glyphicon-plus"></span></a></h4>
                                <jsp:scriptlet>
                                    String company1 = "", location1 = "", jobtitle1 = "", year1 = "", id1 = "";

                                    try {
                                        con = DbConnection.getConnect();
                                        con.setAutoCommit(false);

                                        PreparedStatement ps = con.prepareStatement("select * from experience where email=?");
                                        ps.setString(1, email);
                                        ResultSet rs = ps.executeQuery();
                                        while (rs.next()) {
                                            id1 = rs.getString("id");
                                            company1 = rs.getString("company");
                                            location1 = rs.getString("location");
                                            jobtitle1 = rs.getString("job_title");
                                            year1 = rs.getString("year");
                                </jsp:scriptlet>

                        <div class="row  display_job_div" style="background-color: #eeecec; margin-left: 2px; margin-right: 2px; border-radius: 10px;">
                            <div class="col-md-2"> &nbsp;&nbsp;&nbsp; <img src="images/school.png" height="70" /> </div>
                            <div class="col-md-10">
                                <a href="editprofileexperience.jsp?id=<jsp:expression>id1</jsp:expression>" style="font-size: 12px; float: right"> <span class="glyphicon glyphicon-pencil"></span> </a>
                                <b> <span class="glyphicon glyphicon-home">&nbsp;</span> <jsp:expression>company1</jsp:expression> <br> </b>
                                <span class="glyphicon glyphicon-book"></span> &nbsp; <jsp:expression>location1</jsp:expression> <span style="color: #858585">(<jsp:expression>year1</jsp:expression>)</span> <br>
                                <span class="glyphicon glyphicon-file"></span> &nbsp; <jsp:expression>jobtitle1</jsp:expression> <br>
                                </div>
                            </div> <br>

                        <jsp:scriptlet>
                                }
                            } catch (Exception e) {
                                try {
                                    con.rollback();
                                } catch (Exception ee) {
                                    ee.printStackTrace();
                                }
                                out.print(e);
                            } finally {
                                try {
                                    con.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                        </jsp:scriptlet>

                    </div>
                </div><br><br>

                <div class="row"  style="border: 1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">

                    <div class="col-md-12">
                        <h4> RESUME DETAILS </h4>
                        <p style="color: blue;">Upload your resume-Let Employers find you</p>
                        <div class="row  display_job_div" style="box-shadow: 0px 0px 2px gray; border-radius: 3px;margin-left: 2px;margin-right: 2px;">
                            <div class="col-md-12">
                                <a href="uploadresume.jsp"> <span class="glyphicon glyphicon-plus" style="margin-left: 2px;"></span> Upload Resume </a>
                                <jsp:scriptlet>
                                String file_name = null;
                                try {
                                    Connection con = DbConnection.getConnect();
                                    PreparedStatement ps = con.prepareStatement("select * from resumes where email=?");
                                    ps.setString(1, email);
                                    ResultSet rs = ps.executeQuery();
                                    if (rs.next()) {
                                        file_name = rs.getString("path");
                                </jsp:scriptlet>
                                &nbsp;&nbsp;&nbsp;&nbsp;<a href="DownloadResume?fn=<jsp:expression>file_name</jsp:expression>" class="btn btn-success"> Download Resume </a>
                                <jsp:scriptlet>
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                                </jsp:scriptlet>
                            </div>
                        </div>
                        <div class="row  display_job_div" style="box-shadow: 0px 0px 2px gray; border-radius: 3px;margin-left: 2px;margin-right: 2px;">
                            <div class="col-md-12">
                                <a href="resumebuilderdetails.jsp"> <span class="glyphicon glyphicon-pencil"></span> Resume Builder </a>
                                <jsp:scriptlet>
                                      File f = new File(PathDetails.RESUME_BUILDER_PATH + email + ".pdf");
                                      

                                      if (f.exists()) {
                                </jsp:scriptlet>
                                &nbsp;&nbsp;&nbsp;&nbsp;<a href="DownloadResumeBuilder?fn=<jsp:expression>email + ".pdf"</jsp:expression>" class="btn btn-success"> Download Resume </a>
                                <jsp:scriptlet>
                                }
                                </jsp:scriptlet>
                            </div>
                        </div>
                    </div>

                </div><br><br>

                
            </div>
            <div class="col-md-2"></div>
        </div>


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
