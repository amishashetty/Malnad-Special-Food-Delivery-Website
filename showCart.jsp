<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	background-color: #DADADA;
	background-image: url(images/t1.jpg);
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

<div align="center">Restorent View </div>

<%
String cat =request.getParameter("p");
rst=stmt.executeQuery("select productname,productprice,image,description,productid from product where storephone='"+session.getAttribute("rid")+"' and category='"+cat+"'  ");
while(rst.next()){

 %>

<table width="530" border="1" align="center">
  <tr>
    <td width="85"><img src="<%=rst.getString(3) %>" width="346" height="161" /></td>
    <td width="375" rowspan="2"><p><%=rst.getString(4) %></p>
	
      <form id="form1" name="form1" method="post" action="">
	  <input name="pname" type="hidden" value="<%=rst.getString(1) %>" />
        <p>Rating out of 5
          <select name="rate">
              <option>0</option>
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
          </select><input type="submit" name="rating" value="ok" />
        </p>
      </form>
      <p>&nbsp;</p>
    <p>&nbsp;</p></td>
  </tr>
  <tr>
    <td><div align="center">
	<form action="" method="post">
      <p ><%=rst.getString(1) %><br /><%=rst.getString(2) %></p>
	  <input name="pname" type="hidden" value="<%=rst.getString(1) %>" />
	    <input name="price" type="hidden" value="<%=rst.getString(2) %>" />
      <p >Quantity
        <input type="text" name="qty" value="1" />
        <br />
          <!--<a href="buy.jsp?p=<%= rst.getString(1) %>" >Order this </a> -->
          <input type="submit" name="order" value="Order this" />
          <br />
      </p>
	  </form>
    </div> </td>
  </tr>
</table>
<%
}



%>

<% 
if(request.getParameter("rating")!=null){

try{
String pname=request.getParameter("pname");
int rate=Integer.parseInt(request.getParameter("rate"));
int x=stmt.executeUpdate("insert into rating values( '"+pname+"',"+rate+" ) ");
if(x!=0){
%>
<script>alert("rating is done successfully");</script>

<%

}
}catch(Exception e){
%>
<script>alert("error is :"+<%= e %>);</script>

<%
}
}

 %>

<% 
if(request.getParameter("order")!=null){

try{
String pname=request.getParameter("pname");
int rate=Integer.parseInt(request.getParameter("price"));
int qty=Integer.parseInt(request.getParameter("qty"));
int totalcost=rate*qty;
String total=Integer.toString(totalcost);
String cid=(String)session.getAttribute("cid");
int x=stmt.executeUpdate("insert into orders(productname,productprice,quantity,totalcost,customerid,status,storephone,payment) values( '"+pname+"',"+request.getParameter("price")+",'"+request.getParameter("qty")+"', '"+total+"', '"+cid+"','ordered','"+session.getAttribute("rid")+"','pending' ) ");
if(x!=0){
%>
<script>alert("order is done successfully");</script>

<%

}
}catch(Exception e){
%>
<script>alert("error is :"+<%= e %>);</script>

<%
}
}

 %>



</body>
</html>
