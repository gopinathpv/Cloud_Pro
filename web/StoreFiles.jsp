<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.OutputStream"%>
<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <center>
<table border="2">
        <tr>
        <td>
        <h1>Your files has been uploaded </h1>
        </td>
        </tr>
        
   <%
   Connection Con=null;
    Statement stmt=null;
    Statement stmt1=null;
    ResultSet rs=null;
 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
 if (!isMultipart) {
 } else {
           FileItemFactory factory = new DiskFileItemFactory();
           ServletFileUpload upload = new ServletFileUpload(factory);
           List items = null;
           try {
                   items = upload.parseRequest(request);
           } catch (FileUploadException e) {
                   e.printStackTrace();
           }
           Iterator itr = items.iterator();
           while (itr.hasNext()) {
           FileItem item = (FileItem) itr.next();
           if (item.isFormField()) {
           } else {
               String dir=config.getServletContext().getRealPath("/")+"uploadedFiles/";
               String dirwithusername=dir+(String)session.getAttribute("username");
                   try {
                       	File file = new File(dirwithusername);
	if (!file.exists()) {
		if (file.mkdir()) {
			System.out.println("Directory is created!");
		} else {
			System.out.println("Failed to create directory!");
		}
	}
                           String itemName = item.getName();
                           File savedFile = new File(dirwithusername+"/"+itemName);
                           item.write(savedFile);
                           session.setAttribute("file", itemName);
                         String url="jdbc:mysql://localhost:3306/consistency";
        Class.forName("com.mysql.jdbc.Driver");
        Con = DriverManager.getConnection(url,"root","admin");
      //  stmt = Con.createStatement();
         stmt1 = Con.createStatement();

     //   String query = "INSERT INTO file VALUES('"+name+"','"+ty+"')";
     //   stmt.executeUpdate(query);
        String Query="insert into filedetails values('"+itemName+"',0)";
        stmt1.executeUpdate(Query);
        System.out.println("Success");
     response.sendRedirect("result.jsp");
                           %>
<tr>
            <td>
                <img src="uploadedFiles/<%=itemName%>" width="500" height="500" alt="mahesh"/>
            </td>
       
                           
                           <%
  // use this file object to create img tag's in your jsp
}

                                          //       out.println("<tr><td><b>Your file has been saved at the loaction:</b></td></tr><tr><td><b>"+config.getServletContext().getRealPath("/")+"uploadedFiles"+"\\"+itemName+"</td></tr>");
                    catch (Exception e) {
                           e.printStackTrace();
                   }
           }
           }

   }
   %>
    </table>
   </center>
    <br /><br/>
            <center>  <a href="Admin.jsp">Back</a></center>