<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.vshu.connection.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<jsp:include page="CheckCookie"></jsp:include>
<jsp:declaration>
    String jobid;
</jsp:declaration>

<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
    String cemail=(String) session.getAttribute("session_cemail");
    jobid = request.getParameter("jid");
</jsp:scriptlet>

<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Job Description</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="css/style.css" />
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
                    <div class="col-md-2">
                       
                    </div>
                    <div class="col-md-8 shadow-lg p-3 mb-5 bg-white rounded spacing display_job_div"  style="background-color: #f9f8f9; margin-top: 10px">
                       

                        <jsp:scriptlet>
                            String id = "", job_profile = "", company = "", experience = "", description = "", date1 = "", time1 = "",
                                    salary = "", no_of_openings = "", job_location = "", time_venue = "", c_email = "",
                                    c_person_name = "", c_person_profile = "", c_phone_no = "";
                            try {
                                Connection con = DbConnection.getConnect();

                                PreparedStatement ps = con.prepareStatement("select * from jobs where id=?");
                                ps.setString(1, jobid);
                                ResultSet rs = ps.executeQuery();
                                if (rs.next()) {
                                    job_profile = rs.getString("job_profile");
                                    company = rs.getString("company");
                                    experience = rs.getString("experience");
                                    description = rs.getString("description");
                                    date1 = rs.getString("date1");
                                    time1 = rs.getString("time1");
                                    salary = rs.getString("salary");
                                    no_of_openings = rs.getString("no_of_openings");
                                    job_location = rs.getString("job_location");
                                    time_venue = rs.getString("time_venue");
                                    c_email = rs.getString("c_email");
                                    c_person_name = rs.getString("c_person_name");
                                    c_person_profile = rs.getString("c_person_profile");
                                    c_phone_no = rs.getString("c_phone_no");
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        </jsp:scriptlet>
                        <table class="table table-hover">
                            <tr>
                                <td></td>
                                <td></td>
                                <td><b> <jsp:expression>job_profile</jsp:expression></b> <span style="font-size: 12px; color: #9f9d9d; float: right"> (<jsp:expression>date1</jsp:expression> & <jsp:expression>time1</jsp:expression>)</span> <br></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-home"></span></td>
                                    <td><span style="color: #9f9d9d"> Company : </span></td>
                                    <td><jsp:expression>company</jsp:expression><br></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-briefcase"></span></td>
                                    <td><span style="color: #9f9d9d"> Experience : </span></td>
                                    <td><jsp:expression>experience</jsp:expression><br></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-list-alt"></span></td>
                                    <td><span style="color: #9f9d9d"> Job Description : </span></td>
                                    <td><jsp:expression>description</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-usd"></span></td>
                                    <td><span style="color: #9f9d9d"> Salary : </span></td>
                                    <td><jsp:expression>salary</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-th"></span></td>
                                    <td><span style="color: #9f9d9d">  No. Of Openings : </span></td>
                                    <td><jsp:expression>no_of_openings</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-map-marker"></span></td>
                                    <td><span style="color: #9f9d9d"> Job Location : </span></td>
                                    <td><jsp:expression>job_location</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-send"></span></td>
                                    <td><span style="color: #9f9d9d"> Time / Venue : </span></td>
                                    <td><jsp:expression>time_venue</jsp:expression></td>
                                </tr>
                                
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <th>Company Details</th>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-file"></span></td>
                                    <td><span style="color: #9f9d9d"> Company Name : </span></td>
                                    <td><jsp:expression>company</jsp:expression></td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-user"></span> </td>
                                    <td><span style="color: #9f9d9d"> Person Name : </span></td>
                                    <td><jsp:expression>c_person_name</jsp:expression> (<jsp:expression>c_person_profile</jsp:expression>)</td>
                                </tr>
                                <tr>
                                    <td><span class="glyphicon glyphicon-phone-alt"></span></td>
                                    <td><span style="color: #9f9d9d"> Phone No. : </span></td>
                                        <td><jsp:expression>c_phone_no</jsp:expression></td>
                                </tr>
                            <jsp:scriptlet>
                                if (email == null ? email == null : email.trim().equals("null")) {
                            </jsp:scriptlet>
                            <tr>
                                <td></td>
                                <td></td>
                                <td><a href="login.jsp" class="btn btn-primary" >Login to Apply</a></td>
                            </tr>

                            <jsp:scriptlet>
                            } else {
                                Connection con1 = null;
                                try {
                                    con1 = DbConnection.getConnect();
                                    PreparedStatement ps1 = con1.prepareStatement("select * from applied_jobs where email=? and jobid=?");
                                    ps1.setString(1, email);
                                    ps1.setString(2, jobid);
                                    ResultSet rs1 = ps1.executeQuery();
                                    if (rs1.next()) {
                            </jsp:scriptlet>

                            <tr>
                                <td></td>
                                <td></td>
                                <td>
                                    <span style="color: red; padding: 3px;"> Already applied to this job </span> <br> <br>
                                    <form action="DeleteMyJobApplication" method="post">
                                        <input type="hidden" value="<jsp:expression>jobid</jsp:expression>" name="jobid" />
                                            <input type="submit" value="Delete this Application" class="btn btn-danger " />
                                        </form>
                                    </td>
                                </tr>

                            <jsp:scriptlet>
                            } else {
                            </jsp:scriptlet>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>
                                    <form action="ApplyForJob" method="post">
                                        <input type="hidden" value="<jsp:expression>jobid</jsp:expression>"name="jobid"/>
                                            <input type="submit" value="Apply" class="btn btn-success"/>
                                        </form>
                                    </td>
                                </tr>     
                            <jsp:scriptlet>
                                }
                            }catch (Exception e) {
                                e.printStackTrace();
                            }
                            </jsp:scriptlet>

                            <jsp:scriptlet>
                                }
                            </jsp:scriptlet>



                        </table>

                   
                </div>
                <div class="col-md-2">
                    
                </div>
            </div>

            <jsp:include page="footer.jsp"></jsp:include>
        
    </body>
</html>