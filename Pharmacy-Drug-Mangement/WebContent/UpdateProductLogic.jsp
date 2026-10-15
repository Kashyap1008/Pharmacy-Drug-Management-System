<%-- 
    Document   : UpdateProductLogic
    Created on : 07-Nov-2024, 2:34:24 pm
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
        <title>Update logic </title>
        <link rel="stylesheet" href="css/AddProduct.css">
        
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
                        <a href="AddInventory.jsp">RESTOCK</a>
                        <a href="SellerOrders.jsp">ORDERS</a>
                    </div>
                </div>
            </div>
        </div>
        <%
            ResultSet rs = null;
            Connection conn = null;
            Statement s1 = null;

            try {
                String query1 = "SET foreign_key_checks = 0;";
                String query2_2 = "update inventory set pid='" + request.getParameter("prid") + "' ,pname='" + request.getParameter("prname") + "' WHERE pid = '" + request.getParameter("prid") + "';";
                String query3 = "update product set pid='" + request.getParameter("prid") + "' ,pname='" + request.getParameter("prname") + "',manufacturer='" + request.getParameter("mfname") + "',mfg='" + request.getParameter("mdate") + "',exp='" + request.getParameter("edate") + "',price='" + request.getParameter("price") + "' WHERE pid = '" + request.getParameter("prid") + "';";
                String query4 = "SET foreign_key_checks = 1;";

                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase?useSSL=false&allowPublicKeyRetrieval=true", "root", "kashyap");
                s1 = conn.createStatement();

                s1.addBatch(query1);
                s1.addBatch(query2_2);
                s1.addBatch(query3);
                s1.addBatch(query4);

                int result[] = s1.executeBatch();
//                for (int i = 0; i < result.length; i++) {
//                    if (result[i] == 0) {
//                        out.println("Query is done 1");
//                    } 
//                    else if (result[i] == 0) {
//                        out.println("Query is done 2");
//                    }
//                    else if (result[i] == 0) {
//                        out.println("Query is done 3");
//                    }
//                    else if (result[i] == 0) {
//                        out.println("Query is done 4");
//                    }
//                    else {
//                        out.println("data is not updated");
//
//                    }
//                }
                out.println("<script> alert('Update Successfully!');alert('Go to Home'); </script>");

            } catch (Exception ex) {
                out.println(ex.getMessage());
            }

        %>
    </body>
</html>
