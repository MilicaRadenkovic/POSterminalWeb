<%@page import="javax.swing.JButton"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Articles</title>
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<style>
	#btn{
		width:120px;
		height:120px;
	}
</style>
</head>
<body>
	
			<label>Choose country:</label>
			<select name="CountryArticles" class="form-control" style="width:150px;">
				<option value="-1">Select country</option>
				<%
				Connection con=null;
				Statement stmt=null;
				try{
					String query="select naziv from drzava";
					Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
					con=DriverManager.getConnection("jdbc:derby://127.0.0.1:1527//home/milica/Downloads/db-derby-10.12.1.1-bin/bin/terminal");
					stmt=con.createStatement();
					ResultSet rs=stmt.executeQuery(query);
					while(rs.next()){
						%> 
							<option value="<%=rs.getString("naziv") %>"><%=rs.getString("naziv") %></option>
						<%
					}
				}catch(Exception ex){
					ex.printStackTrace();
				}
				finally{
					
						if(stmt!=null)
						stmt.close();
						if(con!=null) con.close();
				}
				%>
			</select>
				<br>
				<label>Qtty:</label> <input id="inp" type="text" class="form-input"><br><br>
				<%
				int br=0;
				ArrayList<JButton> buttonList = new ArrayList<JButton>();
				try{
					String query="select * from artikli";
					Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
					con=DriverManager.getConnection("jdbc:derby://127.0.0.1:1527//home/milica/Downloads/db-derby-10.12.1.1-bin/bin/terminal");
					stmt=con.createStatement();
					ResultSet rs=stmt.executeQuery(query);
					%>
						<div class="button-container">
					<%					
					while(rs.next()){
							br++;
							%>
								<button type="submit" id="btn" name="bt" value="<%=rs.getString("cena")%>"><%=rs.getString("naziv")%></button>
								<%
																	
							if(br>=5){ %></div><br><div class="button-container"><%
								br=0;
							}
						}
					
					%></div>
								
					<%				
				}catch(Exception ex){
					ex.printStackTrace();
				}
				finally{
					
						if(stmt!=null)
						stmt.close();
						if(con!=null) con.close();
				}
				%>

				<button type="submit" class="btn btn-default" value="SUBMIT" style="width:70px, height:70px">SUBMIT<br></button>
				<br><button type="reset" class="btn btn-default" value="RESET" style="width:70px, height:70px">RESET</button>
				<script type="text/javascript">
								var rez=0;
								$("body").on("click",".button-container button", function(){
									$(this).prop("disabled",true);
							            $("#inp").focus();
							            
							           var text=$(this).text();
							           var value=$(this).val();
							           var inp=$("#inp").val();
							           text.submit();
							           
							           rez=rez+(value*inp);
							          // value.submit();
							           //inp.submit();
							           
								});
								$("body").on("click",".btn btn-default", function(){
									$('body').append(rez);
							           
								});
								$("#inp").focus();
								</script>
			
</body>
</html>