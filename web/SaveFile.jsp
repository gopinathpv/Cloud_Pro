
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
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
                  <li><a href="#">User Login</a></li>
                  <li><a href="#">Admin Login</a></li>
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
        	
            <div class="header_02">File has been replaced!!!</div>
      
            

<%
        String text = new String(request.getParameter("filecontent"));
     //   int loc = (new String(text)).indexOf('\n');
   //     while(loc > 0){
  //          text.replace(loc, loc+1, "<BR>");
   //         loc = (new String(text)).indexOf('\n');
    //   }
        String user=(String)session.getAttribute("username");
       out.println("File has been replaced");
    ServletContext context=getServletContext();
    String path=context.getRealPath("uploadedFiles");
    File file = new File(path+"\\"+user+"\\"+session.getAttribute("editfile"));

			// if file doesnt exists, then create it
			if (!file.exists()) {
				file.createNewFile();
			}

			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(text);
			bw.close();

                        String p=getServletContext().getRealPath("uploadedFiles");
                        Connection con=Database.databasecon.getconnection();
    Statement s1=con.createStatement();
    String Path_File=p+"\\"+session.getAttribute("username")+"\\"+session.getAttribute("file");
    String destFold=null;
    String q="select username from newuser where mailid='"+session.getAttribute("email")+"'";
   ResultSet rs1=s1.executeQuery(q);
    if(rs1.next())
        {
        destFold=rs1.getString(1);
        }
    String dest_path_file=path+"\\"+destFold+"\\"+session.getAttribute("file");
    s1.close();
 FileUtils.copyFile(new File(Path_File), new File(dest_path_file));

                        String url="jdbc:mysql://localhost:3306/consistency";
        Class.forName("com.mysql.jdbc.Driver");
       Connection Con = DriverManager.getConnection(url,"root","admin");
      //  stmt = Con.createStatement();
      Statement   stmt2 = Con.createStatement();
                        String query="update filedetails set id=0 where FileName='"+session.getAttribute("editfile")+"'";
                      stmt2.executeUpdate(query);
		//	System.out.println("Done");


%>
            
            
            
            
            
            
            
            
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










       