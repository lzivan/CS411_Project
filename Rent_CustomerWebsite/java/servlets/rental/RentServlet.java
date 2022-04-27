package servlets.rental;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/RentServlet")
public class RentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection; 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("Name");
		String address = request.getParameter("Address");
		Long phone = Long.parseLong(request.getParameter("Phone"));
		String vehicleID = request.getParameter("Id");
		String pickUp = request.getParameter("date");
		String due = request.getParameter("due");
		
		System.out.println("------USER INPUT-------");
		System.out.println(name);
		System.out.println(address);
		System.out.println(phone);
		System.out.println(vehicleID);
		System.out.println(pickUp);
		System.out.println(due);
		System.out.println("---------END----------");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/best_rent", "root", "bao1tian2");
			Statement statement = connection.createStatement();
			
			LocalDate dateBefore = LocalDate.parse(pickUp);
			LocalDate dateAfter = LocalDate.parse(due);
			//calculating number of days in between
			int noOfDaysBetween = (int) ChronoUnit.DAYS.between(dateBefore, dateAfter);
			System.out.println("Days Between: " + noOfDaysBetween);
			ResultSet car_price_result = statement.executeQuery("select price from vehicle where vehicle_num = '"+vehicleID+"'");
			car_price_result.next();
			System.out.println("Car Price: " + car_price_result.getInt(1));
			int totalPrice = car_price_result.getInt(1) * noOfDaysBetween;
			System.out.println("Total Price: " + totalPrice);
			
			
			statement.executeUpdate("insert into customer (name, credits, address, mobile) values ('"+name+"', '5', '"+address+"', '"+phone+"')");
			
			ResultSet customer_result = statement.executeQuery("select id from customer where name = '"+name+"'");
			customer_result.next();
			int customer_id = customer_result.getInt(1);
			System.out.println("Customer ID: " + customer_id);
			
			statement.executeUpdate("insert into rental (car_id, cust_id, fee, date, due) values ('"+vehicleID+"', '"+customer_id+"', '"+totalPrice+"', '"+pickUp+"', '"+due+"')");
			PrintWriter out = response.getWriter();
			out.print("<meta http-equiv = 'refresh' content = '5; url = index.jsp' />");
			out.print("<H1 style='text-align:center'>Rental request submitted.</H1>");
			out.print("<H2 style='text-align:center'> Our team will contact you soon.</H2>");
			out.print("<H3 style='text-align:center'> You will be redirected to homepage in 5 seconds...</H3>");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	public void destory() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

