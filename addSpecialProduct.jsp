<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@ include file="admintabs.html" %>
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
.style1 {
	font-size: 24px;
	font-weight: bold;
}
body,td,th {
	color: #000033;
	font-weight: bold;
}
-->
</style>


<script>
function validateCat(){
var x=document.forms["form3"]["category"].value;

if(x==""){
alert("category name  cannot be blank");
return false;
}else{
return true;
}

}


function validateAdd(){
var x=document.forms["form2"]["productname"].value;
var y=document.forms["form2"]["productprice"].value;
var z=document.forms["form2"]["quantity"].value;
var a=document.forms["form2"]["desc"].value;

if(x==""){
alert("product name  cannot be blank");
return false;
}if(y==""){
alert("Product Price  cannot be blank");
return false;
}if(z==""){
alert("Quantity  cannot be blank");
return false;
}if(a==""){
alert("Description  cannot be blank");
return false;
}else{
return true;
}

}

</script>
</head>

<body>
<%@ include file="db.jsp" %>
<div align="center">Add Special Item</div>

 


<form  method="get" action="" name="form2" id="form2">
<input name="storephone" type="hidden"  value="admin"/>
  <table width="550" border="1" align="center">
   
    <tr>
      <td width="170"><div align="right">Enter  Item Name </div></td>
      <td width="364"><input type="text" name="productname" /></td>
    </tr>
    <tr>
      <td><div align="right">Enter Item Cast </div></td>
      <td><input type="text" name="productprice" /></td>
    </tr>
	 <tr>
      <td><div align="right">Quantity</div></td>
      <td><input name="quantity" type="text" value="1"  required/>
        <select name="units">
          <option>Kg</option>
          <option>grams</option>
          <option>Lliters</option>
        </select>
       </td>
    </tr>
    <tr>
      <td><div align="right">Add produt Image </div></td>
      <td><input type="file" name="image" /></td>
    </tr>
    <tr>
      <td><div align="right">Description</div></td>
      <td><textarea name="desc" cols="50" rows="5" id="desc"></textarea></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="Add"  onclick="return validateAdd()"/>
      <input type="reset" name="Submit2" value="Reset" /></td>
    </tr>
  </table>
  <div align="center"></div>
</form>



<% 
if(request.getParameter("Submit")!=null){
try
{
String path="images/";
String category=request.getParameter("category");
String productname=request.getParameter("productname");
String productprice=request.getParameter("productprice");
String quantity=request.getParameter("quantity");
String image=path+request.getParameter("image");
String desc=request.getParameter("desc");

String storephone=request.getParameter("storephone");
String units=request.getParameter("units");

int x=stmt.executeUpdate("insert into specialproduct(productname,productprice,quantity,image,description,units) values('"+productname +"','"+productprice +"','"+quantity +"','"+image+"','"+desc+"','"+units+"')");

if(x!=0){
out.print("Special product inseted seccuessfully");
}
			
}catch(Exception e){
out.println(e);
}
}

 %>
 

</body>
</html>
