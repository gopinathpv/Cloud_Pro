<!DOCTYPE html>
<html lang="en">
<head>
<title>Consistency As a Service</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
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
<style>
    .main
    {
        width: 1000px;
        height: 250px;
}
    .align
    {
        float:left;
        width: 300px;
        height: 250px;
}
</style>

</head>
<body id="page2" onload="noBack();" onpageshow="if (event.persisted) noBack();" background="images/mif1UDg.jpg">
<!-- START PAGE SOURCE -->

<center>
   
      <div class="main">
                    
        <div class="align"> 
          <h2><span>User</span> Login </h2>
        <form action="Login" method="post">
	      
	      
	      <p>USER NAME:
	        <input type="text"  name="user"/><br><br>
	        PASS WORD: <input type="password"  name="pass"/><br><br>
	        <input type="submit" value="Login"/>
          </p>
		  </form>
        
          <%String msg=request.getParameter("msg");
                                         if(msg!=null)
    {
                                             out.println(msg);
    }%>
<!--    <a href="newuser.jsp">New User</a></div>-->
    <div class="align">  <h2><span>Admin</span> Login </h2>
                      <form>
					 USER NAME: <input type="text" id="user" name="user"/><br><br>
					 PASS WORD: <input type="password" id="pass" name="pass"/><br><br>
                                         <input type="button" value="Login" onclick="validate();" />
					 </form>
                    </div></div>
      </section></center>
      <aside>
        
    
  
</body>
</html>