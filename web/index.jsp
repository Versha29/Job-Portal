<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.vshu.connection.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="CheckCookie"></jsp:include>
<jsp:scriptlet>
    String email = (String) session.getAttribute("session_email");
    String cemail = (String) session.getAttribute("session_cemail");
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Home (Job Portal Website)</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <script src="jquery3.5/jquery.js"></script>
        <script src="jquery3.5/slidercycle.js"></script>
       
         <script>
            $(document).ready(function(){
//                $("#slider_img_div").cycle();


//                  $('#slider_img_div').cycle({
//                  fx:    'zoom',
//                  sync:  false,
//                  delay: -2000});
//
//                  $('#slider_img_div').cycle({
//                  fx:    'shuffle',
//                  sync:  false,
//                  delay: -2000});
              
//                  $('#slider_img_div').cycle({
//                  fx:    'scrollUp,wipe,zoom',
//                  sync:  false,
//                  delay: -2000});

//                    $('#slider_img_div').cycle({
//                     fx:     'shuffle',
//                     easing: 'easeOutBack',
//                    delay:  -4000
//                    });
                    
                    $('#slider_img_div').cycle({
                    fx:      'turnDown',
                    delay:   -4000
                    });

//                      $('#up').cycle({
//                      fx:    'curtainX',
//                      sync:  false,
//                      delay: -2000
//                      });

//                        $('#right').cycle({
//                            fx:      'scrollRight',
//                            next:   '#right',
//                            timeout:  0,
//                            easing:  'easeInOutBack'
//                        });

}); 
   
        </script>
        <style>
            #slider_main_div
            {
                height: 500px;
                width: 100%;
            }
            #slider_img_div
            {
                height: 500px;
                width: 100%;
                background-color: #ffffff;
                overflow: hidden;
                float: left;
                margin-left: 15px;
            }
            .img_src{
                
                padding: 3px;
                background-color: #ffffff;
            }
        </style>
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

            <div  class="row" id="slider_main_div" class="header_position">
                 <div class="row" style="border:1px solid black;" id="slider_img_div">
                     <img src="images/wp4435514-vacancies-wallpapers.jpg" name="slide" width="100%" height="500px"alt="slider img" class="img_src" />
                     <img src="images/wp4435477-vacancies-wallpapers.jpg" name="slide" width="100%" height="500px" alt="slider img" class="img_src"/>
                     <img src="images/wp4435476-vacancies-wallpapers (1).jpg" name="slide" width="100%" height="500px" alt="slider img" class="img_src"/>
                     <img src="images/wallpaperflare.com_wallpaper.jpg" name="slide" width="100%" height="500px" alt="slider img" class="img_src"/>
               
                 </div>
            </div>
               
                
                <!-- ================= Search job division starts===================== -->
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10 ">
                        <h1 style="text-align: center;color: #000099;font-family: serif"> FIND A JOB YOU LIKE...!!!</h1>
                        <form action="searchjobsresults.jsp" method="post">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                           <input type="text" name="technology1" placeholder="Technology" class="textfield_design"/>&nbsp;&nbsp;&nbsp;
                            <input type="text" name="location1" placeholder="Location" class="textfield_design"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                            <input type="submit"value="Search" class="btn btn-primary"/>
                        </form>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- ================= Search job division ends===================== -->

                <div class="row">
                    <div class="col-md-2">
                        
                    </div>
                    <div class="col-md-8" style="margin-top: 10px;" >
                        <div class="row">
                        <jsp:scriptlet>
                            String id, job_profile, company, experience, description, date1, time1; 
                            try {
                                Connection con = DbConnection.getConnect();

                                PreparedStatement ps = con.prepareStatement("select * from jobs");
                                ResultSet rs = ps.executeQuery();
                                while (rs.next()) {
                                    id = rs.getString("id");
                                    job_profile = rs.getString("job_profile");
                                    company = rs.getString("company");
                                    experience = rs.getString("experience");
                                    description = rs.getString("description");
                                    date1 = rs.getString("date1");
                                    time1 = rs.getString("time1");
                        </jsp:scriptlet>
                        <div class="col-md-12 display_job_div  shadow p-3 mb-5 bg-white rounded">

                            <b><jsp:expression>job_profile</jsp:expression></b><span style="font-size: 10px;color: #9f9d9d; float: right"> (<jsp:expression>date1</jsp:expression> & <jsp:expression>time1</jsp:expression>)</span><br>
                            <span class="glyphicon glyphicon-home"></span><span style="color: #9f9d9d"> Company : </span><jsp:expression>company</jsp:expression></span><br>
                            <span class="glyphicon glyphicon-book"></span><span style="color: #9f9d9d"> Experience : </span><jsp:expression>experience</jsp:expression></span><br>
                            <span class="glyphicon glyphicon-file"></span><span style="color: #9f9d9d"> Job Description : </span><jsp:expression>description</jsp:expression></span><br>
                            <br><a href="jobdescription.jsp?jid=<jsp:expression>id</jsp:expression>" class="btn btn-primary" > See Full Details </a><br><br>
                            </div>

                        <jsp:scriptlet>
                                     }
                                 } catch (Exception e) {
                                     e.printStackTrace();
                                 }
                        </jsp:scriptlet>


                    </div>
                </div>
                <div class="col-md-2">
                   
                </div>

            </div>

            <jsp:include page="footer.jsp"></jsp:include>
        
       
    </body>
</html>