<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.lang.Object.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Edit Product</title>
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
        <%!
            String pid;
            String pname;
            String manufacturer;
            String madate;
            String exdate;
            String price;

        %>
        <%
            HttpSession httpSession = request.getSession();
            String guid = (String) httpSession.getAttribute("currentuser");

            ResultSet rs = null;
            Connection conn = null;
            Statement s1 = null;
            PreparedStatement ps1 = null;
    //        String query1="select * from product ";
            String query2 = "select * from product where pid=?";
            String pid_option = request.getParameter("pid");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase?useSSL=false&allowPublicKeyRetrieval=true", "root", "kashyap");
                ps1 = conn.prepareStatement(query2);
                ps1.setString(1, pid_option);
                rs = ps1.executeQuery();
                rs.next();
                pid = rs.getString("pid");
                pname = rs.getString("pname");
                manufacturer = rs.getString("manufacturer");
                madate = rs.getString("mfg");
                exdate = rs.getString("exp");
                price = rs.getString("price");
            } catch (Exception ex) {
    //            out.println(ex.getMessage());
            }
        %>
        <div class="active">
            <div class="filler"></div>
            <h2>Edit product</h2>            
            <h2>Product ID : <%= pid %></h2>

            <form action="UpdateProductLogic.jsp" method="post">
                <div class="bigcard">
                    <div class="bigcard1">
                        <h3>Enter Product Name</h3><input type='text' name='prname' value="<%=pname%>" required>
                        <input type='text' name='prid' value="<%=pid%>" hidden="">
                        <h3>Enter Manufacturer Name</h3><input type='text' name='mfname' value="<%=manufacturer%>" required>
                        <h3>Enter Manufacture Date</h3><input type="text" name="mdate" value="<%=madate%>" placeholder="YYYY-MM-DD" onkeypress="return event.charCode >= 48 && event.charCode <= 57 || event.charCode == 45" required>
                        <h3>Enter Expiry Date</h3><input type="text" name="edate" value="<%=exdate%>" placeholder="YYYY-MM-DD" onkeypress="return ((event.charCode >= 48 && event.charCode <= 57) || event.charCode == 45)" required>
                    </div>
                    <div class="bigcard2">
                        <!--<h3>Quantity</h3><input type="text" name="quantity" onkeypress="return event.charCode>= 48 && event.charCode<= 57" required>-->
                        <h3>Price</h3><input type="text" name="price" value="<%=price%>" onkeypress="return event.charCode >= 48 && event.charCode <= 57" required>
                        <p></p>
                        <input type="submit" value="Update">
                    </div>
                </div>
            </form>
        </div>
        
    </body>
</html>