

<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="Database.databasecon"%>
<%@page import="java.io.File"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page  import="src.java.ConnectionFactory" %>


 

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
                  <li><a href="#">Admin Login</a></li>
                  <li><a href="#" class="last">Contact</a></li>
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
        	
            <div class="header_02">File Shared Successfully !!!!!</div>
           
           
    <%
  
Connection con=databasecon.getconnection();
Statement select=con.createStatement();
String user_name="";
String file_name="";

String s="select id from file_details where owner='"+user_name+"' and filename='"+file_name+"'";
ResultSet rs=select.executeQuery(s);
int id=0;
if(rs.next())
       {
    id=rs.getInt(1);
}
Statement insertStatement=con.createStatement();
String uname[]=request.getParameterValues("shared_user");
for(String email:uname)
       {
    if(email!="")
        {
        session.setAttribute("email", email);
        String key="poornima";
String q="SELECT AES_DECRYPT(username,'"+key+"') username FROM newuser WHERE AES_DECRYPT(mailid,'"+key+"')='"+email+"';";
String p=getServletContext().getRealPath("uploadedFiles");
    Statement s1=con.createStatement();
    String Path_File=p+"\\"+session.getAttribute("username")+"\\"+session.getAttribute("file");
    String destFold=null;
   ResultSet rs1=s1.executeQuery(q);
   String username=(String)session.getAttribute("username");
    if(rs1.next())
        {
        destFold=rs1.getString(1);
        }
    String dest_path_file=p+"\\"+destFold+"\\"+session.getAttribute("file");
    s1.close();
 FileUtils.copyFile(new File(Path_File), new File(dest_path_file));
    
    if(!email.equals(""))
        {
String insertquery="insert into shared(FileName,EmailId) values('"+session.getAttribute("file")+"','"+email+"')";
insertStatement.addBatch(insertquery);
}
 }
}
insertStatement.executeBatch();
out.println("<center><strong>File Shared Successfully !!<br/><br/>");
//response.sendRedirect("view.jsp");
 ServletContext context=getServletContext();
       String folder=context.getRealPath("\\uploadedFiles");
            File file=new File(folder+"\\"+session.getAttribute("username"));
            File[] listfiles=file.listFiles();
            out.println("The Files Available in the cloud to edit are as follows:<br/><strong>");
            for(File fname:listfiles)
                {
                out.println(fname.getName());
                out.println(",");
                }
            out.println("<br/></center>");
%>
<br/>
<form action="view.jsp" method="post"><center>
  Filename to Edit :  <input type="text" name="filetoedit"/><br/><br/>
  <input type="submit" value="Edit File"/></center>
</form>
<%
//String filename=request.getParameter("filetoedit");
Connection con1=databasecon.getconnection();
        Statement stmt=con.createStatement();
        Statement stmt2=con.createStatement();

      //  String fname=(String)session.getAttribute("mahi");
        String Query="insert into filedetails values('"+session.getAttribute("mahi")+"',0)";
        stmt.executeUpdate(Query);

%>
<br/>
<center><a href="login.jsp">Logout</a></center>
        </div>
        
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
           