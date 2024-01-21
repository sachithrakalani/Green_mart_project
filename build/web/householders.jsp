<%-- 
    Document   : Householders.jsp
    Created on : Dec 30, 2023, 9:31:56 PM
    Author     : user
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>House Holders Page</title>
        <link rel="stylesheet" href="Green-mart.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-Avb2QiuDEEvB4bZJYdft2mNjVShBftLdPG8FJ0V7irTLQ8Uo0qcPxh4Plq7G5tGm0rU+1SPhVotteLpBERwTkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    </head>
    <body>
        <section id="header" style="background-color: #E3E6F3; width:100%;height:80px;">
            <a href="#"><img src="images/common/logo1.jpg" id="logo"  style ="float: left;width: 100px;height: 70px; padding:10px 20px"alt=""/></a>
            <div>
                <div id="navbar"> 
                    <ul>
                        <li ><a href="index.jsp">Home</a></li>
                        <li ><a href="index.jsp">Grocery</a></li>
                        <li><a href="vegetables.jsp">Vegetables/Fruits</a>
                        <li><a href="meat.jsp">Meat</a></li>
                        <li><a href="householders.jsp" class="active">Householder Items</a></li>
                        <li><a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i></i></a></li>
                        <li><a href="signUp.jsp"><i class="fa fa-user-circle" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
                
            </div>
        </section>
        
        <div id="page-header">
            <h2>Welcome</h2>
            <p>Save more with coupons & up to 70% off!</p>
        </div>
        
        <div class="items-view" style='padding:40px 80px;'>
            <%
                try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/green_mart", "root", "");
                        Statement st = con.createStatement();
                        String str = "select  householder_id, householder_name,  householder_prices, householder_image_path from householder_details where householder_category = 1";
//                        out.println(str);
                        ResultSet rs = st.executeQuery(str);
                        while (rs.next()) {
                            String itemName = rs.getString("householder_name");
                            int itemPrice = rs.getInt("householder_prices");
                            String imagePath = rs.getString("householder_image_path");
                            String itemId = rs.getString("householder_id");
                            //out.println(itemId);
                            //out.println(imagePath+"<br>");
                            //String itemDescription = rs.getString("Iteam_description");
                            out.println("<section id='product1' class='section-p1' >");
                            out.println("<div class='pro-container'>");
                            out.println("<div class='pro'>");
                            out.println("<img src=" + imagePath + " alt=''id='img' style='width: 150px; height: 175px;' <a href='#' onclick=\"" + "redirectToItemDetails('" + itemId + "')" + "\"alt=''></a>");
                            out.println("<div class='des'>");
//                            out.println("<span>adidas</span>");
                            out.println("<div class='star'>");
//                            out.println("<i class='fa fa-star'></i>");
//                            out.println("<i class='fa fa-star'></i>");
//                            out.println("<i class='fa fa-star'></i>");
//                            out.println("<i class='fa fa-star'></i>");
//                            out.println("<i class='fa fa-star'></i>");
                            out.println("</div>");
                            //onclick='redirectToItemDetails(1)'
                            //onclick='redirectToItemDetails('+itemId+')'
                            out.println(itemName + "</a> <br>");
                            out.println("LKR: " + itemPrice + ".00 <br>");
                            out.println("</div>");
                            out.println("<a href='#'><i class='fa fa-shopping-cart cart'></i></a>");
                            out.println("<html></div></div></section></html>");
                        }
                        con.close();
                    } catch (Exception e) {
                    }
            %>
        </div> 
        
        <footer class="section-p1">
            <div class="col">
                <img src="images/common/logo1.jpg" class="logo"alt="" style ="width: 50px;height: 50px">
                <h4>Contact</h4><br>
                <p><strong>Address:</strong></p>
                <p><strong>Phone:</strong></p>
                <p><strong>Hours:</strong>10.00 - 18.00,Mon - Sat</p>
            </div>   
            
                
            <div class="col">
                <h4>About us</h4>
                <a href="#">About us</a>
                <a href="#">Delivery Information</a>
                <a href="#">Privacy & policy</a>
                <a href="#">Terms & Conditions</a>
                <a href="#">Contact Us</a>
            </div>

            <div class="col">
                <h4>My Account</h4>
                <a href="#">Sign In</a>
                <a href="#">View Cart</a>
                <a href="#">My wishlist</a>
                <a href="#">Track My Order</a>
                <a href="#">Help</a>
            </div>

            <div class="copyright">
                <p>E Commerces App - 2023</p>
            </div>
        </footer> 
        
        <script>
            function redirectToItemDetails(itemId) {
                window.location.href = 'singleproducthouseholder.jsp?id=' + itemId;
            }
        </script>
    </body>
</html>
