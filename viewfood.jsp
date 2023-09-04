<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@ include file="admintabs.html" %>
<title>Untitled Document</title>
<style type="text/css">
<!--
.style3 {color: #FFFF00; font-weight: bold; }
-->
</style>
</head>

<body>
<p align="center">
  <%@ include file="db.jsp" %> 
  All items </p>
<table width="1017" border="1" align="center">
  <tr bgcolor="#999999">
  <td width="193"><strong>Select </strong></td>
    <td width="193"><strong>category </strong></td>
    <td width="142"><strong>productname</strong></td>
    <td width="128"><strong>productprice</strong></td>
    
    <td width="94"><strong>quantity</strong></td>
    <td width="141"><strong>image</strong></td>
    <td width="148"><strong>description</strong></td>
	<td width="193"><strong>discount</strong></td>
    <td width="142"><strong>productid</strong></td>
    <td width="128"><strong>storephone</strong></td>
    
    <td width="94"><strong>gst</strong></td>
  </tr>
  
  <% 
  
  rst=stmt.executeQuery("select * from product");
  while(rst.next()){
  
   %>
   <form action="" method="post">
 
  <tr bgcolor="#003399">
    <td><input name="checkbox" type="checkbox" value="<%= rst.getString(8) %>" /></td>
    <td><span class="style3">
      <input type="text" name="s1" value="<%= rst.getString(1) %>" />
    </span></td>
    <td><span class="style3">
      <input type="text" name="s2" value="<%= rst.getString(2) %>" />
    </span></td>
    <td><span class="style3">
      <input type="text" name="s3" value="<%= rst.getString(3) %>" />
    </span></td>
    <td><span class="style3">
      <input type="text" name="s4" value="<%= rst.getString(4) %>" />
    </span></td>
    <td><span class="style3"><img src="<%= rst.getString(5) %>" height="100" width="100" /></span></td>
    <td><span class="style3"><%= rst.getString(6) %>
      <input type="text" name="s5" value="<%= rst.getString(5) %>" />
    </span></td>
	 <td><span class="style3"><%= rst.getString(7) %>
	   <input type="text" name="s6" value="<%= rst.getString(6) %>" />
	 </span></td>
    <td><span class="style3"><%= rst.getString(8) %>
      <input type="text" name="s7" value="<%= rst.getString(7) %>" />
    </span></td>
    <td><span class="style3"><%= rst.getString(9) %></span><span class="style3">
      <input type="text" name="s8" value="<%= rst.getString(8) %>" />
    </span></td>
    <td><span class="style3">
      <input type="text" name="s9" value="<%= rst.getString(9) %>" />
    </span></td>
  </tr>
 
  
  <% } %>
</table>
 <div align="center">
  <input name="Submit" type="submit" />
   <input name="cancel" type="submit" id="cancel" value="Cancel Selection" />
   </form>
</div>
 

<% 
if(request.getParameter("Submit")!=null){
String s1=request.getParameter("s1");
String s2=request.getParameter("s2");
String s3=request.getParameter("s3");
String s4=request.getParameter("s4");
String s5=request.getParameter("s5");
String s6=request.getParameter("s6");
String s7=request.getParameter("s7");
String s8=request.getParameter("s8");
String s9=request.getParameter("s9");
try{
String cid=(String)session.getAttribute("cid");

String[] email;
email = request.getParameterValues("checkbox");
   if (email != null) 
   {
    int x=stmt.executeUpdate("insert into orders (category,productname,productprice,quantity,description,discount,productid,storephone,gst,customerid,status) values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','"+s8+"','"+s9+"','"+s9+"','ordered') ");
		  for (int i = 0; i < email.length; i++) 
		  {
         out.println ("<b>"+email[i]+"<b>");
		// int x=stmt.executeUpdate("insert into orders (category,productname,productprice,quantity,description,discount,productid,storephone,gst,customerid,status) values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','"+s8+"','"+s9+"','"+s9+"','ordered') ");
		
      		}
	  }
	 %>
	 <script>
	 alert("ordered successfull");
	 window.open("viewfood.jsp","_self");
	 </script>
	 
	 <%
}catch(Exception e){
out.print(e);
}

}
 %>






<% 
if(request.getParameter("cancel")!=null){
String[] email;
email = request.getParameterValues("checkbox");
   if (email != null) 
   {
      for (int i = 0; i < email.length; i++) 
      {
         out.println ("<b>"+email[i]+"<b>");
		 int x=stmt.executeUpdate("Update register set result='not Selected' where email='"+email[i]+"' ");
			
      	}
	}  
	response.sendRedirect("viewResumes.jsp"); 
}
 %>
</body>
</html>
