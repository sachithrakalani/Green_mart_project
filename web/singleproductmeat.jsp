<%-- 
    Document   : singleproductmeat.jsp
    Created on : Dec 31, 2023, 9:33:37 PM
    Author     : user
--%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                        <li ><a  class="active"href="grocery.jsp">Grocery</a></li>

                        <!--                            <div class="sub-menu-1">
                                                        <ul>
                                                            <li class="hover-me"><a href="womenclothes1.jsp">Women</a><i class="fa fa-angle-right"></i>
                                                                <div class="sub-menu-2">
                                                                    <ul>
                                                                        <li><a href="womenclothesfrock.jsp">Frocks</a></li>
                                                                        <li><a href="womenclothestshirt.jsp">T-shirts</a></li>
                                                                        <li><a href="womenclothesblouse.jsp">Blouse</a></li>
                                                                        <li><a href="womenclothessaree.jsp">Saree</a></li>
                                                                        <li><a href="womenclothesdenims.jsp">Denims</a></li>
                                                                    </ul>  
                                                                    
                                                                </div>
                                                            </li>
                                                            <li class="hover-me"><a href="#">Men</a><i class="fa fa-angle-right"></i>
                                                                <div class="sub-menu-2">
                                                                    <ul>
                                                                        <li><a href="mentshirt.jsp">T-shirts</a></li>
                                                                        <li><a href="mendenims.jsp">Denims</a></li>
                                                                     </ul>  
                                                                </div>
                                                            </li>
                                                            <li class="hover-me"><a href="kidsclothes.jsp">Kids</a>
                                                        </ul>
                                                    </div>-->
                        </li>
                        <li><a href="vegetables.jsp">Vegetables/Fruits</a>
                            <!--                            <div class="sub-menu-1">
                                                            <ul>
                                                                <li class="hover-me"><a href="womenshoes.jsp">Women</a>
                                                                </li>
                                                                <li class="hover-me"><a href="#">Men</a>
                                                                </li>
                                                            </ul>
                                                        <div>-->
                            <!--</li>-->

                        <li><a href="meat.jsp">Meat</a></li>
                        <li><a href="householders.jsp" >Householder items</a></li>
                        <li><a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i></i></a></li>
                        <li><a href="signUp.jsp"><i class="fa fa-user-circle" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
        </section>


        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/green_mart", "root", "");
                Statement st = con.createStatement();
                String itemId = request.getParameter("id");
                String str = "select meat_id, meat_name, meat_prices,meat_des, meat_image_path from meat_details where meat_id = '" + itemId + "' ";
                ResultSet rs = st.executeQuery(str);
                while (rs.next()) {
                    String itemName = rs.getString("meat_name");
                    int itemPrice = rs.getInt("meat_prices");
                    String imagePath = rs.getString("meat_image_path");
                    String itemDescription = rs.getString("meat_des");
                    out.println("<section id='prodetails' class='section-p1'>");
                    out.println("<div class='single-pro-image'>");
                    out.println("<img src=" + imagePath + " id=''style='width:80%; padding:40px 120px'><br><br>");
                    out.println("</div>");
                    out.println("<div class='single-pro-details'>");
                    out.println("<h3>" + itemName + "</h3> <br><br>");
                    out.println("<h2> LKR: " + itemPrice + ".00 </h2> <br><br>");
                    out.println("<p>" + itemDescription + " </p> <br><br>");
                    out.println("<input type='number' value='1' id='num'> ");
                    //out.println("<button id='normal' onclick='addToCart(" + itemName + ","+ itemPrice + ")'>Add To Cart</button> <br><br>");
                    //String buttonScript = "addToCart('" + itemName + "','" + itemPrice + "')";
                    //out.println("<button id='normal' onclick='" + buttonScript + "'>Add To Cart</button>");
                    out.println("<button id='normal' onclick=\"" + "addToCart('" + itemName + "','" + itemPrice + "','" + imagePath + "')" + "\">Add To Cart</button>");

                    out.println("</div>");
                    out.println("</section>");
                }
                con.close();
            } catch (Exception e) {
            }

        %>

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
            function addToCart(itemName, itemPrice, imagePath) {

                var value = document.getElementById("num").value;
                console.log(value);
                var existingItems = localStorage.getItem('items');

                var itemsArray = existingItems ? JSON.parse(existingItems) : [];

                var newItem = {
                    name: itemName,
                    prices: itemPrice,
                    image: imagePath,
                    qty: value
                };
                itemsArray.push(newItem);

                var updatedItems = JSON.stringify(itemsArray);

                localStorage.setItem('items', updatedItems);

                console.log(updatedItems);
            }
        </script>
    </body>
</html>
