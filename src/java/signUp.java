/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author SKS
 */
@WebServlet(urlPatterns = {"/signUp"})
public class signUp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet signUp</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet signUp at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        PrintWriter out = response.getWriter();
        
        String firstName,lastName,email,phoneNumber,password;
        firstName = request.getParameter("First_name");
        lastName = request.getParameter("Last_name");
        phoneNumber = request.getParameter("Phone_number");
        email = request.getParameter("Email");
        password = request.getParameter("Password");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/green_mart", "root", "");
            PreparedStatement pst=con.prepareStatement("Insert into user_info(first_name,last_name,phone_no,email,password)values(?,?,?,?,?)");
            pst.setString(1,firstName);
            pst.setString(2, lastName);
            pst.setString(3,phoneNumber);
            pst.setString(4, email);
            pst.setString(5, password);
            pst.executeUpdate();
            try {
                String from = "kalanisathyangi@gmail.com";
                String pass = "wnbl pvkj gkfk roan";
                Properties properties = new Properties();
                properties.put("mail.smtp.auth", "true");
                properties.put("mail.smtp.starttls.enable", "true");
                properties.put("mail.smtp.host", "smtp.gmail.com");
                properties.put("mail.smtp.port", "587");
                Session session = Session.getInstance(properties, new Authenticator() {
                    protected PasswordAuthentication getPassAuthentication() {
                        return new PasswordAuthentication(from, pass);
                    }
                });
                Transport transport = session.getTransport("smtp");
                transport.connect("smtp.gmail.com", 587, from, pass);
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(from));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                message.setSubject("Registerded Successfully!");
                message.setText("Welcome our Green mart");
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
            } catch (Exception e) {
                out.print(e);
            }
            response.sendRedirect("grocery.jsp");
        }
        catch(Exception e){
            out.print(e);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
