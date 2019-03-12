

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.sql.StatementEvent"%>
<%@page import="Database.databasecon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


      

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
                  <li><a href="userlogin.jsp" class="last">Logout</a></li>
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
        	
            <div class="header_02">File Upload by the User!!!</div>
            
      <h2>The uploaded file content in the editor</h2>
        <form action="SaveFile.jsp" method="post">
        <textarea cols="80" rows="30" name="filecontent">
        <%
        String fileName=request.getParameter("filetoedit");
        String url="jdbc:mysql://localhost:3306/consistency";
        Class.forName("com.mysql.jdbc.Driver");
       Connection Con = DriverManager.getConnection(url,"root","admin");
      //  stmt = Con.createStatement();
      Statement   stmt2 = Con.createStatement();
      
   //   ResultSet rs=stmt1.executeQuery(query);

        ServletContext sc=getServletContext();
        String path=sc.getRealPath("uploadedFiles");
        Connection con=databasecon.getconnection();
        Statement stmt=con.createStatement();
        String Query="select * from filedetails where filename='"+fileName+"'";
        String filename=null;int id=0;
        ResultSet rs=stmt.executeQuery(Query);
        while(rs.next())
            {
            filename=rs.getString("filename");
            id=rs.getInt("id");
            }
        String user=(String)session.getAttribute("username");
        session.setAttribute("editfile", fileName);
       BufferedReader br=new BufferedReader(new FileReader(path+"\\"+user+"\\"+fileName)) ;
       String s;

    //   int flag=0;
       if(id==0)
           {
           while((s=br.readLine())!=null)
             {
               out.println(s);
               
             }
           Statement stmt1=con.createStatement();
               String query="update filedetails set id=1 where FileName='"+fileName+"'";
               stmt1.executeUpdate(query);
          }else
           {
           out.println("File has been edited by Some in the Cloud..Please wait until they Close...");
           }
        %>
</textarea>
<input type="submit" value="Save" />
        </form>
            
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










       