
<%@page import="com.vshu.connection.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="CheckCookie"></jsp:include>
<jsp:declaration>
    Connection con=null;
     String jobprofile="",company="",experience="",jd="",salary="",openings="",timevenue=""; 
     String loc="",pname="", pprofile="",pphone="";       

</jsp:declaration>
<jsp:scriptlet>
   String cname=(String)session.getAttribute("session_cname"); 
    String clogo = (String) session.getAttribute("session_clogo"); 
    String cemail=(String) session.getAttribute("session_cemail");
</jsp:scriptlet>
<jsp:scriptlet>
    String name = (String) session.getAttribute("session_name");
    String id=request.getParameter("id");  
    
       System.out.println(id);
    try 
    {
        con=DbConnection.getConnect();
        con.setAutoCommit(false); 
       PreparedStatement ps1 = con.prepareStatement("select job_profile,company,experience ,description,salary ,no_of_openings, time_venue, job_location, c_person_name, c_person_profile,c_phone_no from jobs where id=?");  
             
       ps1.setString(1, id);  
            ResultSet rs=ps1.executeQuery();
            while(rs.next())
            {
                jobprofile=rs.getString("job_profile");
                company=rs.getString("company");
                experience=rs.getString("experience");
                jd=rs.getString("description");   
                salary=rs.getString("salary");
                openings=rs.getString("no_of_openings");
                timevenue=rs.getString("time_venue");  
                loc=rs.getString("job_location"); 
                pname=rs.getString("c_person_name");
                pprofile=rs.getString("c_person_profile");
                pphone=rs.getString("c_phone_no");
                        
            }
                
    }catch(Exception e)
                            {
                                try{
                                        con.rollback();
                                    }catch(Exception ee)
                                    {
                                        ee.printStackTrace();
                                    }
                                    out.print(e);
                            }
                            finally
                            {
                                try
                                {
                                    con.close();
                                }
                                catch(Exception e)
                                {
                                    e.printStackTrace();
                                }
                            }
</jsp:scriptlet>
<%--<jsp:scriptlet>
    if (name == null || name.equals("")) {
        response.sendRedirect("login.jsp");
    }
</jsp:scriptlet>--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update jobs- Smart Programming</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        
        <script>
            function submitFunction(val)
            {
                if(val==='update')
                {
                    document.editjobform.action="EditJobDetails";
                    document.editjobform.submit();
                }
                if(val==='delete')
                {
                    document.editjobform.action="DeleteJobDetails";
                    document.editjobform.submit();
                }
            } 
        </script>
                    
    </head>
    <body>
        <jsp:include page="companyprofileheader.jsp"></jsp:include>
        <jsp:include page="menubar.jsp"></jsp:include>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="row" style="border:1px solid gray; box-shadow: 0px 0px 2px gray; border-radius: 3px">
                        <div class="col-md-2">
                            <img src="company-logo/<jsp:expression>clogo</jsp:expression>" height="120" width="120" style="border: 1px solid black;border-radius: 50%"/>
                    </div>
                        <div class="col-md-10">
                            <h3>Edit Job Details</h3><br>
                            <b> <jsp:expression>cname</jsp:expression></b> (<jsp:expression> session.getAttribute("session_cemail")</jsp:expression>)<br><br>

                           <form name="editjobform" method="post">
                                <input type="hidden" value="<jsp:expression>id</jsp:expression>" name="id1"/> 
                            Job Profile: <br><input type="text" value="<jsp:expression>jobprofile</jsp:expression>" placeholder="Eg. Java Developer" name="jobprofile1" class="textfield_design"/><br><br>
                                Company : <br><input type="text" value="<jsp:expression>company</jsp:expression>" readonly="" name="company1" class="textfield_design"/><br><br>
                            Experience : <br><input type="text" value="<jsp:expression>experience</jsp:expression>" name="experience1"placeholder="Eg.0-5 years" class="textfield_design"/><br><br>
                            Job Description : <br><textarea  name="jd1"placeholder="Requirements"class="textarea_deisgn"><jsp:expression>jd</jsp:expression></textarea><br><br>
                            
                                Salary : <br><input type="text" value="<jsp:expression>salary</jsp:expression>" name="salary1" placeholder="Eg. 300000-500000 PA" class="textfield_design" /><br><br>
                            No.of Openings : <br><input type="text"value="<jsp:expression>openings</jsp:expression>"  placeholder="Eg. 100" name="openings1" class="textfield_design"/><br><br>
                            Time-Venue : <br><input type="text" value="<jsp:expression>timevenue</jsp:expression>"name="timevenue1" placeholder="Eg. 1st Jan, 2022-JH Hotel" class="textfield_design" /><br><br>
                            Job Location : <br><input type="text" value="<jsp:expression>loc</jsp:expression>" name="loc1" placeholder="Eg. Chandigarh" class="textfield_design" /><br><br>
                            Person Name : <br><input type="text" value="<jsp:expression>pname</jsp:expression>" name="pname1" placeholder="Eg. Nikhil" class="textfield_design" /><br><br>
                            Person Profile : <br><input type="text" value="<jsp:expression>pprofile</jsp:expression>" placeholder="Eg. HR" name="pprofile1" class="textfield_design"/><br><br>
                            Phone No. : <br><input type="text"value="<jsp:expression>pphone</jsp:expression>"  name="pphone1" placeholder="Eg. 9999999999" class="textfield_design" /><br><br>
                            
                             <input type="submit" value="Update Job" class="btn btn-primary" onclick="submitFunction('update')"/>
                            <input type="submit" value="Delete Job" class="btn btn-primary"  onclick="submitFunction('delete')"/>
                            
                        </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>
            </div>


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
