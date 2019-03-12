
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Consistancy As A Service</title>
<meta name="keywords" content="free templates, website templates, CSS, XHTML" />
<meta name="description" content="Simple Gray - Professional free XHTML/CSS template provided by templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>

<script type="text/javascript" src="js/jquery-1.4.2.min.js" ></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript">
             window.history.forward();
            function noBack()
            {
                this.window.history.forward();
                //window.history.back();
            }
            function validate()
            {
                var a=document.getElementById("user").value;
                var b=document.getElementById("pass").value;
                if(a==null || a== "" || b==null || b==" ")
                    {
                        alert("Please enter username/password");
                        return false;
                    }
                else if(a=="admin" && b=="admin")
                    {
                       window.location = "newuser.jsp";
                    }
            }
        </script>

</head>
<body>
<div id="templatemo_header_wrapper">
<!--  Free Web Templates by TemplateMo.com  -->
  <div id="templatemo_header">
    
   	<div id="site_logo"></div>
        
		<div id="templatemo_menu">
      		<div id="templatemo_menu_left"></div>
            <ul>
                  <li><a href="#" class="current">Home</a></li>
                  <li><a href="#">Services</a></li>
                  <li><a href="userlogin.jsp">User Login</a></li>
                  <li><a href="adminlogin.jsp">Admin Login</a></li>
                  <li><a href="index.html" class="last">Logout</a></li>
            </ul>    	
		</div> <!-- end of menu -->
    
    </div>  <!-- end of header -->
</div> <!-- end of header wrapper -->

<div id="templatemo_banner_wrapper">
	<div id="templatemo_banner">
    
    	<div id="templatemo_banner_image">
        	<div id="templatemo_banner_image_wrapper">
            	<img src="images/templatemo_image_01.jpg" alt="image 1" />
            </div>
        </div>
        
        <div id="templatemo_banner_content">
        	<div class="header_01">Consistency as a Service</div>
            
        </div>	
    
    	<div class="cleaner"></div>
    </div> <!-- end of banner -->
</div> <!-- end of banner wrapper -->

<div id="templatemo_content_wrapper">
	<div id="templatemo_content">
    
    	<div id="column_w530">
        	
            <div class="header_02">New User Registration!!!</div>        
          <%String msg=request.getParameter("msg");
                                         if(msg!=null)
    {
                                             out.println(msg);
    }%>

    
                     <form  action="NewUser" method="post">
                         <table>
                             <tr><td>User Name:</td><td><input type="text" name="user" /></td></tr>
                             <tr><td>Password:</td><td><input type="password" name="pass" /></td></tr>
                             <tr><td>Mail Id:</td><td><input type="email" name="mid" /></td></tr>
                             <tr><td>Mobile Number:</td><td><input type="text" name="mno" /><br><br></td></tr>
                             <tr><td></td><td><input type="submit" value="Submit" /></td></tr>
                        </table>

</form><br/>
                      <% String su=request.getParameter("msg");
                      if(su!=null)
    {
                          out.println(su);
    }%>
   
      </section>
            
        </div>
        
        <div id="column_w300">
        
        	<div class="header_03">Latest News</div>
            
            <div class="column_w300_section_01">
            	<div class="news_image_wrapper">
                	<img src="images/templatemo_image_02.jpg" alt="image" />
                </div>
                
                <div class="news_content">
                	<div class="news_date">OCT 29, 2048</div>
                    <div class="header_04"><a href="#">Lorem ipsum dolor sit</a></div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a justo dolor.</p>
				</div>
                                
                <div class="cleaner"></div>
            </div>
            
            <div class="column_w300_section_01 even_color">
            	<div class="news_image_wrapper">
                	<img src="images/templatemo_image_03.jpg" alt="image" />
                </div>
                
                <div class="news_content">
                	<div class="news_date">OCT 28, 2048</div>
                    <div class="header_04"><a href="#">Nam dictum pellentesque</a></div>
                    <p>Nam ultricies cursus enim, non aliquet orci lacinia ac. Etiam lobortis adipiscing.</p>
				</div>
                                
                <div class="cleaner"></div>
            </div>
            
            <div class="column_w300_section_01">
            	<div class="news_image_wrapper">
                	<img src="images/templatemo_image_04.jpg" alt="image" />
                </div>
                
                <div class="news_content">
                	<div class="news_date">OCT 27, 2048</div>
                    <div class="header_04"><a href="#">Donec faucibus tortor</a></div>
                    <p>Aliquam porttitor nibh in erat porttitor in accumsan dui pulvinar.</p>
				</div>
                                
                <div class="cleaner"></div>
            </div>
            
            <div class="cleaner"></div>
        </div>
    
    	<div class="cleaner"></div>
    </div> <!-- end of content wrapper -->
</div> <!-- end of content wrapper -->

<div id="templatemo_footer_wrapper">

	<div id="templatemo_footer">
    	
        <div class="section_w180">
        	
        </div>
        
        <div class="section_w180">
        	
        </div>
                
        <div class="section_w180">
        	
        </div>
        
        <div class="section_w180">
	       
        </div>
        
        <div class="section_w180">
			
        </div>
        
        <div class="margin_bottom_20"></div>
       
        <div class="cleaner"></div>
    </div> <!-- end of footer -->
    <!--  Free CSS Templates by TemplateMo.com  -->
</div> <!-- end of footer -->
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div></body>
</html>
