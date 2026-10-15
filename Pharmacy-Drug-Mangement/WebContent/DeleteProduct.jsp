<%-- 
    Document   : DeleteProduct
    Created on : 06-Nov-2024, 11:23:46 am
    Author     : Pranav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.lang.Object.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Product</title>
        <link rel="stylesheet" href="css/AddProduct.css">
        <script>alert('Product is Deleted Successfully !');</script>


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
        <form action="EditProductTables.jsp" method="post">
            <div class="bigcard2" style="position: absolute;left: 43%;top: 50%;">
                <input type="submit" value="Go back">
            </div>

        </form>
    </body>

    <%
        Connection conn = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;

        ResultSet rs = null;
        String query1 = "Delete from product where pid = ?";
        String query2 = "Delete from inventory where pid = ?";
        String pid = request.getParameter("pid");
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase?useSSL=false&allowPublicKeyRetrieval=true", "root", "kashyap");
            ps1 = conn.prepareStatement(query1);
            ps1.setString(1, pid);
            int r1 = ps1.executeUpdate();
            ps2 = conn.prepareStatement(query2);
            ps2.setString(1, pid);
            int r2 = ps2.executeUpdate();
            if (r1 == 1 && r2 == 1) {
                out.println("<script>alert('Product is Deleted Successfully !');</script>");
            }
            

        } catch (Exception ex) {
            out.println(ex.getMessage());
        }
    %>

</html>
