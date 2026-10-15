<%-- 
    Document   : EditProductTables
    Created on : 05-Nov-2024, 12:16:41 pm
    Author     : Pranav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.lang.Object.*" %>

<% 
    HttpSession httpSession = request.getSession();
    String guid=(String)httpSession.getAttribute("currentuser");
    
    ResultSet rs=null;
    Connection conn=null;
    Statement s1=null;
    PreparedStatement ps1 = null;
    String query1="select * from inventory where sid='"+ guid +"'";
    //String query2="select * from product where pid=?";
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase?useSSL=false&allowPublicKeyRetrieval=true", "root", "kashyap");
        
    }
    catch(Exception ex){
        out.println(ex.getMessage());
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/AddProduct.css">
   

        <style>
            table {
          width: 100%;
          border-collapse: collapse;
            border: 1px solid black;
        }
        th {
                border: 1px solid black;
          padding: 15px;
          text-align: left;
          background-color: #0ca1a6;
          color: white;
        }

        tr,td{
                border: 1px solid black;
          padding: 15px;
          text-align: left;
        }
        </style>

    </head>
    <body>
        <div class="main">
	<div class="topbar1"></div>
	<div class="topbar2">
		<div class="container1">
			<div class="logout-btn">
				<a href="Logout.jsp">Logout</a>
			</div>
		</div>
	</div>
	<div class="header">
		<div class="container2">
			<div class="navbar">
				<a href="SellerHomepage.jsp">HOME</a>
				<a href="AddProduct.html">ADD</a>
                                <a href="EditProductTables.jsp">EDIT PRODUCT</a>
				<a href="AddInventory.jsp">RESTOCK</a>
				<a href="SellerOrders.jsp">ORDERS</a>
			</div>
		</div>
	</div>
</div>
<div class="active">
	<div class="filler"></div>
            <h2>All Products List</h2>
           <%
               try{

                s1 = conn.createStatement();
                rs = s1.executeQuery(query1);

                out.println("<table> "
                        + "<tr>"
                        + "<th>pid</th>"
                        + "<th>pname</th>"
                        + "<th>manufacturer</th>"
                        + "<th>Edit</th>"                        
                        + "<th>Delete</th>"
                        + "</tr>");
                while (rs.next()) {     
                        out.println("<tr>"
                        + "<td> "+ rs.getString("pid")
                        + "<td> "+ rs.getString("pname")
                        + "<td> "+ rs.getString("sid")
                        + "<td> <a href='EditProduct.jsp?pid="+rs.getString("pid")+"'>Edit</a>"                        
                        + "<td> <a href='DeleteProduct.jsp?pid="+rs.getString("pid")+"'>Delete</a>"
                        + "</tr> ");
                    }
                

               }
               catch(Exception ex){
                    out.println(ex.getMessage());
               }

            %>
	</div>
        
    </body>
</html>
