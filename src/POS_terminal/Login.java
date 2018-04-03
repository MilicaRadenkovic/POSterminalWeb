package POS_terminal;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class Login extends HttpServlet {
	public static final String DRIVER="org.apache.derby.jdbc.ClientDriver";
    public static final String JDBC_URL="jdbc:derby://127.0.0.1:1527//home/milica/Downloads/db-derby-10.12.1.1-bin/lib/terminal"; 
    public static final String SQL="select * from zaposleni";
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pass=request.getParameter("pass");
		String name=request.getParameter("name");
		String surname=request.getParameter("surname");
		Connection con=null;
		PreparedStatement ps=null;
		
		try{
		Class.forName(DRIVER);
		con=DriverManager.getConnection(JDBC_URL);
		ps=con.prepareStatement(SQL);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()){
			if(pass.equals(rs.getString("pin")) && 
					name.equals(rs.getString("ime")) &&
					surname.equals(rs.getString("prezime"))){
				response.sendRedirect("articles.jsp");
				return;
			}
			else {
				response.sendRedirect("employee.jsp");
				return;
			}
		}
		}catch(ClassNotFoundException ex){
			ex.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
				try {
					if(ps!=null)
					ps.close();
					if(con!=null) con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			
		}
	}

}
