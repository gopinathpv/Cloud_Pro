<%-- 
    Document   : upload
    Created on : Jan 10, 2015, 7:19:03 PM
    Author     : user
--%>
 <%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.*"%>
            <%@page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>  
<%  
 Connection Con=null;
    Statement stmt=null;
    Statement stmt1=null;
    ResultSet rs=null;
    
ServletContext context=getServletContext();
String path=context.getRealPath("main");


MultipartRequest m = new MultipartRequest(request, path);

//String name=m.getParameter("fname");
//String ty=m.getParameter("type");
System.out.println(path);
  
   
    try
            {
         String url="jdbc:mysql://localhost:3306/consistency";
        Class.forName("com.mysql.jdbc.Driver");
        Con = DriverManager.getConnection(url,"root","admin");
      //  stmt = Con.createStatement();
         stmt1 = Con.createStatement();
        
     //   String query = "INSERT INTO file VALUES('"+name+"','"+ty+"')";
     //   stmt.executeUpdate(query);
        String Query="insert into filedetails values('"+path+"',0)";
        stmt1.executeUpdate(Query);
        System.out.println("Success");
     response.sendRedirect("result.jsp");
        }
    catch(Exception e)
            {
        out.println("unable to connect DB"+e);
        }
%>












