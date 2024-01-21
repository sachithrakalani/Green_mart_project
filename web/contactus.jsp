<%-- 
    Document   : contactus.jsp
    Created on : Jan 21, 2024, 8:29:14 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
        <link rel="stylesheet" href="Green-mart.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-Avb2QiuDEEvB4bZJYdft2mNjVShBftLdPG8FJ0V7irTLQ8Uo0qcPxh4Plq7G5tGm0rU+1SPhVotteLpBERwTkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script
            type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"
        ></script>
        <script type="text/javascript">
            (function () {
                emailjs.init("xhdDgIchzYpUIXZgz");
            })();
        </script>
    </head>  
    <body>
        <section id="header" style="background-color: #E3E6F3; width:100%;height:80px;">
            <a href="#"><img src="images/common/logo1.jpg" id="logo"  style ="float: left;width: 100px;height: 70px; padding:10px 20px"alt=""/></a>
            <div>
                <div id="navbar"> 
                    <ul>
                        <li ><a class="active" href="index.jsp">Home</a></li>
                        <li ><a href="grocery.jsp">Grocery</a></li>
                        <li><a href="vegetables.jsp">Vegetables/Fruits</a></li>
                        <li><a href="meat.jsp">Meat</a></li>
                        <li><a href="householders.jsp">Householder Items</a>
                        <li><a href="contactus.jsp">Contact Us</a>
                        <li><a href="cart.jsp"><i class="fa-solid fa-cart-shopping"></i></i></a></li>
                        <li><a href="signUp.jsp"><i class="fa fa-user-circle" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
                
            </div>
        </section>
        <div class="container border mt-3 bg-light">
            <div class="row">
<!--                <div class="col-md-6 p-5 bg-primary text-white">
                    <h1>Hi there!</h1>
                    <h4>
                        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo,
                    </h4>
                </div>-->
                <div class="col-md-6 border-left py-3">
                    <h1>Feedback here</h1>
                    <div class="form-group">
                        <h5 for="name">Name</h5>
                        <input
                            type="text"
                            class="form-control"
                            id="name"
                            placeholder="Enter name"
                            />
                    </div>
                    <div class="form-group">
                        <h5 for="email">Email</h5>
                        <input
                            type="email"
                            class="form-control"
                            id="email"
                            placeholder="Enter email"
                            />
                    </div>
                    <div class="form-group">
                        <h5 for="message">Message</h5>
                        <textarea class="form-control" id="message" rows="3"></textarea>
                    </div>
                    <button class="btn btn-primary" onclick="sendMail()">Submit</button>
                </div>
            </div>
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
            function sendMail() {
                var params = {
                    name: document.getElementById("name").value,
                    email: document.getElementById("email").value,
                    message: document.getElementById("message").value,
                };

                const serviceID = "service_eiy922p";
                const templateID = "template_igprmrw";

                emailjs.send(serviceID, templateID, params)
                        .then(res => {
                            document.getElementById("name").value = "";
                            document.getElementById("email").value = "";
                            document.getElementById("message").value = "";
                            console.log(res);
                            alert("Your message sent successfully!!")

                        })
                        .catch(err => console.log(err));

            }
        </script>
    </body>


</html>
