

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class POS_terminalServlet01
 */
@WebServlet("/POS_terminalServlet01")
public class POS_terminalServlet01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String DRIVER="org.apache.derby.jdbc.ClientDriver";
     public static final String JDBC_URL="jdbc:derby://127.0.0.1:1527//home/milica/Downloads/db-derby-10.12.1.1-bin/lib/firstdb"; 
    public static final String SQL="select * from FIRSTTABLE";
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=null;
		PreparedStatement ps=null;
		response.setContentType("text/html");
		PrintWriter printWriter=response.getWriter();
		printWriter.println("<html>");
		printWriter.println("<head><title>POS_terminal</title></head>");
		printWriter.println("<body><table width=30%>");
		printWriter.println("<tr>");
		try{
		Class.forName(DRIVER);
		con=DriverManager.getConnection(JDBC_URL);
		ps=con.prepareStatement(SQL);
		ResultSet rs=ps.executeQuery();
		ResultSetMetaData rsm=rs.getMetaData();
		int columnCount=rsm.getColumnCount();
		for(int x=1;x<=columnCount;x++){
			printWriter.println("<td bgcolor=lightblue>"+rsm.getColumnName(x)+"</td>");
		}
		printWriter.println("</tr>");
		while(rs.next()){
			printWriter.println("<tr>");
			for(int x=1;x<=columnCount;x++){
				printWriter.println("<td bgcolor=lightblue>"+rsm.getColumnName(x)+"</td>");
			}
			printWriter.println("</tr>");
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
		printWriter.println("</body></table></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
