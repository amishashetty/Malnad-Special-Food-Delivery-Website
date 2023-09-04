<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@ include file="customertabs.html" %>
<link rel="stylesheet" href="mystyles.css" type="text/css" />
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	background-color: #DADADA;
}
.style1 {
	color: #FF0000;
	font-weight: bold;
}
body,td,th {
	color: #000033;
	font-weight: bold;
}

-->
</style></head>

<body>
<%@ include file="db.jsp"  %>

<div align="center">
  <p>Shoping View </p>
  <p>&nbsp;</p>
</div>

<form action="" method="get">
  <div align="center">Enter product name 
    <input name="pname" type="text" size="50">
  <input name="Search" type="submit" value="Search for product" />
  </div>
</form><br />
<br />

<form action="" method="get">
  <div align="center">Select Category
    <select name="pcat">
	<% rst=stmt.executeQuery("select category from product  ");
while(rst.next()){
 %>
      <option><%= rst.getString(1) %></option>
	  <% } %>
    </select>
	
    <input name="Searchcat" type="submit" value="Search on Category" />
  </div>
</form>
<br />

<% 
if(request.getParameter("Search")!=null && request.getParameter("pname")!=null){
String pname=request.getParameter("pname");
//out.print("pname is:"+pname);
if(pname==""){
out.print("no match found");

}else{
rst=stmt.executeQuery("select productname,productprice,image,description,productid from product where   productname like '%"+pname+"%'  ");
while(rst.next()){

 %>
 
<div class="responsive">
  <div class="gallery">
    <a target="_blank" href="img_5terre.jpg">
      <img src="<%=rst.getString(3) %>" alt="Cinque Terre" width="600" height="400">
    </a>
  
	
	 
	 
	  <div class="desc"> 
	    <p><%=rst.getString(1) %><br />
	  price:<%=rst.getString(2) %><br />
    
	 Descriotion: <%=rst.getString(4) %><br />
	   <a href="buy.jsp?p=<%= rst.getString(1) %>" >Buy</a>    </p>
	    <p><a href="cart.jsp?p=<%= rst.getString(1)%> & q=<%= rst.getString(2)%> & r=<%= rst.getString(3)%>" >Add to cart</a></p>
    </div>
		  
  </div>
</div>





<%
}
}
}

%>



<% 
if(request.getParameter("Searchcat")!=null ){
String pcat=request.getParameter("pcat");
//out.print("pname is:"+pname);
if(pcat==""){
out.print("no match found");

}else{
rst=stmt.executeQuery("select productname,productprice,image,description,productid from product where   category like '%"+pcat+"%'  ");
while(rst.next()){

 %>
 
<div class="responsive">
  <div class="gallery">
    <a target="_blank" href="img_5terre.jpg">
      <img src="<%=rst.getString(3) %>" alt="Cinque Terre" width="600" height="400">
    </a>
  
	
	 
	 
	  <div class="desc"> 
	    <p><%=rst.getString(1) %><br />
	  price:<%=rst.getString(2) %><br />
    
	 Descriotion: <%=rst.getString(4) %><br />
	   <a href="buy.jsp?p=<%= rst.getString(1) %>" >Buy</a>    </p>
	    <p><a href="buy.jsp?p=<%= rst.getString(1) %>" >Add to cart</a> </p>
    </div>
		  
  </div>
</div>





<%
}
}
}
%>


<% 
if(request.getParameter("Search")==null && request.getParameter("Searchcat")==null){
String pname=request.getParameter("pname");
//out.print("pname is:"+pname);
if(pname==""){
out.print("no match found");

}else{
rst=stmt.executeQuery("select productname,productprice,image,description,productid from product  ");
while(rst.next()){

 %>
 
<div class="responsive">
  <div class="gallery">
    <a target="_blank" href="img_5terre.jpg">
      <img src="<%=rst.getString(3) %>" alt="Cinque Terre" width="600" height="400">
    </a>
  
	
	 
	 
	  <div class="desc"> 
	    <p><%=rst.getString(1) %><br />
	  price:<%=rst.getString(2) %><br />
    
	 Descriotion: <%=rst.getString(4) %><br />
	   <a href="buy.jsp?p=<%= rst.getString(1) %>" >Buy</a>    </p>
	    <p><a href="cart.jsp?p=<%= rst.getString(1)%>&q=<%= rst.getString(2)%>&r=<%= rst.getString(3)%>" >Add to cart</a></p>
    </div>
		  
  </div>
</div>





<%
}
}
}

%>


</body>
</html>
