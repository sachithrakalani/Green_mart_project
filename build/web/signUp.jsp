<%-- 
    Document   : signUp.jsp
    Created on : Dec 18, 2023, 11:49:51 AM
    Author     : SKS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up Page</title>
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
                        <li ><a  href="grocery.jsp">Grocery</a></li>
                        <li><a class="active" href="vegetables.jsp">Vegetables/Fruits</a>
                        <li><a href="meat.jsp">Meat</a></li>
                        <li><a href="householders.jsp" >Householder items</a></li>
                        <li><a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i></i></a></li>
                        <li><a href="signUp.jsp"><i class="fa fa-user-circle" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
                
            </div>
        </section>
        
        <div class="contaniner">
            <center>
                <div class="form-box" style="padding-top:100px;">
                    <div class="wrapper">
                        <h1>Sign Up</h1>
                        <form action="signUp" method="post">
                            <input type="text" placeholder="First Name" name="First_name">
                            <input type="text" placeholder="Last Name" name="Last_name">
                            <input type="text" placeholder="Phone number" name="Phone_number">
                            <input type="email" placeholder="Email" name="Email">
                            <input type="password" placeholder="Password" name="Password">
<!--                            <div class="terms">
                                <input type="checkbox" class="chech-box"><span id="spn01"> I agree to the terms & conditions</span>
                                <input type="checkbox" id="checkbox" style="padding-left:10px;">I agree to these I agree to these  
                                <lable for="checkbox">I agree to these <a href="#"> I agree to these </a></lable>
                            </div>-->
                            <button type="submit" onclick="save()">Sign Up</button>
                            <div class="member">
                                Already member?<a href="signIn.jsp">Login Here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </center>
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
            function save(){
                alert('Registered Successfully');
            }
        </script>
    </body>
</html>
