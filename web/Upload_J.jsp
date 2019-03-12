<%-- 
    Document   : Upload_J
    Created on : Sep 21, 2014, 10:56:59 AM
    Author     : Mahesh
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        ArrayList list = new ArrayList();
        String paramname=null,name=null,resumename=null;int f = 0;File file1 = null;
        ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Documents\\");
        MultipartRequest multi = new MultipartRequest(request, dirName,	40 * 1024 * 1024); // 10MB
			//out.println("cp20");
			Enumeration params = multi.getParameterNames();
                        while (params.hasMoreElements())
			{
				paramname = (String) params.nextElement();

				if(paramname.equalsIgnoreCase("name"))
				{
					name=multi.getParameter(paramname);
				}
                         }
                        out.println("name");

                        Enumeration files = multi.getFileNames();
	//out.println("cp12");
	while (files.hasMoreElements())
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}

		if(paramname != null)
		{
			f = 1;
			resumename = multi.getFilesystemName(paramname);
			out.println("cp1");
			String fPath = context.getRealPath("\\Documents\\"+resumename);
			out.println("cp2");
			file1 = new File(fPath);
			out.println("cp3");
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}
	}
        %>
    </body>
</html>
