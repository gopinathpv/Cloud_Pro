package src.java;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Murali1
 */
public class NewUser extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ServletContext sc=getServletContext();
        HttpSession session=request.getSession();
        try {
              String user=request.getParameter("user");
            String pass=request.getParameter("pass");
          //  String rpass=request.getParameter("rpass");
            String mid=request.getParameter("mid");
            String mno=request.getParameter("mno");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/consistency","root","admin");
            Statement st=con.createStatement();
      //  String Query="insert into newuser values('"+user+"','"+pass+"','"+mid+"','"+mno+"')";
            String key="poornima";
             String query1="INSERT INTO newuser VALUES(AES_ENCRYPT('"+user+"','"+key+"'),AES_ENCRYPT('"+pass+"','"+key+"'),AES_ENCRYPT('"+mid+"','"+key+"'),AES_ENCRYPT('"+mno+"','"+key+"'))";
          //  st.executeUpdate("insert into newuser(username,password,mailid,mnumber) values('"+user+"','"+pass+"','"+mid+"','"+mno+"')");
        st.executeUpdate(query1);
            String su="YOUR DETAILS ADDED SUCESSFULLY";
             String dir=sc.getRealPath("/")+"uploadedFiles\\";
               String dirwithusername=dir+user;

                       	File file = new File(dirwithusername);
	if (!file.exists()) {
		if (file.mkdir()) {
			System.out.println("Directory is created!");
		} else {
			System.out.println("Failed to create directory!");
		}

            response.sendRedirect("newuser.jsp?msg="+su);
            
            }
        }
        catch(Exception e)
        {
    System.out.println(e);
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
