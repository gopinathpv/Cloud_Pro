<%@page import="Database.databasecon"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<html>
<head>
</head>
<body>
<%
Thread.sleep(100);
ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Documents\\");
		String paramname=null;
		String name=null,key=null,limit=null,des=null,resumename=null,acc=null;
		String skey=null;
                String unm=session.getAttribute("email2").toString();
                String dmn=session.getAttribute("group_id").toString();
                int dmn1=Integer.parseInt(dmn);
                int unmL=unm.length();
                String unmLs=String.valueOf(unmL);
                Random rm=new Random();
                int rid= rm.nextInt((unmL));
                 String rids=String.valueOf(rid);
                System.out.println("Random ID - I "+rid);
                int rid1=rm.nextInt(unmL);
                 String rid1s=String.valueOf(rid1);
                System.out.println("Random ID - I "+rid1);
                int kp1=dmn1+unmL+rid+rid1;
                String kp11=String.valueOf(kp1);
                String kkpy=kp11+dmn;
                
		  File file1 = null;
			
		
		try {
                    
			out.println("cp10");
			MultipartRequest multi = new MultipartRequest(request, dirName,	40 * 1024 * 1024); // 10MB
			out.println("cp20");
			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				
				if(paramname.equalsIgnoreCase("name"))
				{
					name=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("key"))
				{
					key=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("limit"))
				{
					limit=multi.getParameter(paramname);
				}
				
				if(paramname.equalsIgnoreCase("des"))
				{
					des=multi.getParameter(paramname);
				}
                                if(paramname.equalsIgnoreCase("filtp"))
				{
					acc=multi.getParameter(paramname);
				}
				
				}
			int group_id=(Integer) session.getAttribute("group_id");
			int f = 0;
			
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
        String[] nm=name.split("(?!^)");
        
        int nml=nm.length;
        int nmr1=rm.nextInt(nml);
        int nmr2=rm.nextInt(nml);
        String nma=nm[nmr1];
        String nmb=nm[nmr2];
        String finky=nmb+kkpy+nma;
        System.out.println("Final Key is : "+finky);
        
	        FileInputStream fs1 = null;
            
			Connection con=databasecon.getconnection(); 

			PreparedStatement ps=con.prepareStatement("INSERT INTO filestore VALUES(?, AES_ENCRYPT(?, 'key'),?,?,?,?,?,?,?)");
			//INSERT INTO user_aes VALUES (AES_ENCRYPT('?','pass'),?,? );
			//INSERT INTO filestore(pass, email, resumename)VALUES(AES_ENCRYPT('"File123"','pass'),'mani@gmail.com','blob');
       	
       			ps.setString(1,name);
       			ps.setString(2,key);
				ps.setString(3,limit);
				ps.setString(4,des);
				ps.setString(5,resumename);
				ps.setString(6,"offline");
				ps.setInt(7,group_id);
                                ps.setString(8,acc);
                                ps.setString(9,finky);
                                
                                
				
       if(f == 0)
			ps.setObject(5,null);
		else if(f == 1)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(5,fs1,fs1.available());
		}	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("fileupload.jsp?message=success");
			}
			else
			{
				response.sendRedirect("fileupload.jsp?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
	
 %>
</body>
</html>