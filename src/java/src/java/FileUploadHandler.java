package src.java;


import java.sql.Statement;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet to handle File upload request from Client
 * @author Javin Paul
 */
public class FileUploadHandler extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private  String UPLOAD_DIRECTORY = "main";
        private  String UPLOAD_DIRECTORY1 = "sub";
        private  String Splitted_file;
        Connection Con=null;
    Statement stmt=null;
    Statement stmt1=null;
    ResultSet rs=null;

  String name=null;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      ServletContext context=getServletContext();
      PrintWriter out = response.getWriter();
     
      
    //  UPLOAD_DIRECTORY=context.getInitParameter("file-upload");
        //process only if its multipart content
      
      File file1 = new File(context.getRealPath("/") +"/"+UPLOAD_DIRECTORY );
	if (!file1.exists()) {
		if (file1.mkdir()) {
			System.out.println("Directory is created!");
		} else {
			System.out.println("Failed to create directory!");
		}
	}
         File file2 = new File(context.getRealPath("/") +"/"+UPLOAD_DIRECTORY1 );
	if (!file2.exists()) {
		if (file2.mkdir()) {
			System.out.println("Directory is created!");
		} else {
			System.out.println("Failed to create directory!");
		}
	}
      
      
        if(ServletFileUpload.isMultipartContent(request)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
              
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                         name = new File(item.getName()).getName();
                        item.write( new File(context.getRealPath("/") +"/"+UPLOAD_DIRECTORY + File.separator + name));
                                          Splitted_file=context.getRealPath("/").replace("\\","/")+UPLOAD_DIRECTORY + "/" + name;
                    }
                }
                for(FileItem item1 : multiparts){
                    if(!item1.isFormField()){
                        String name = new File(item1.getName()).getName();
                        item1.write( new File(context.getRealPath("/")+"/"+UPLOAD_DIRECTORY1 + File.separator + name));
                      
                    }

                }
                     String url="jdbc:mysql://localhost:3306/consistency";
    
        Class.forName("com.mysql.jdbc.Driver");
        Con = DriverManager.getConnection(url,"root","admin");
      //  stmt = Con.createStatement();
         stmt1 = Con.createStatement();

     //   String query = "INSERT INTO file VALUES('"+name+"','"+ty+"')";
     //   stmt.executeUpdate(query);
        String Query="insert into filedetails values('"+name+"',0)";
        stmt1.executeUpdate(Query);
        System.out.println("Success");
     response.sendRedirect("result.jsp");
        
    
                
                 HttpSession session=request.getSession();
                 session.setAttribute("mahi", name);
                request.setAttribute("message", "File Uploaded");
                out.println("<h3>Share the File To your friends.....</h3>");
               }catch (Exception ex) {
               request.setAttribute("message", "File Upload Failed due to " + ex);
            }          
         
        }else{
            request.setAttribute("message",
                                 "Sorry this Servlet only handles file upload request");
        }
    
        request.getRequestDispatcher("/result.jsp").forward(request, response);
     
    }
  
}