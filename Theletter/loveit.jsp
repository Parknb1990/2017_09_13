<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("euc-kr");

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection (
			"jdbc:mysql://localhost:3306/theletter",
			"root", "asdf"
			);
	String idx = request.getParameter("idx");
    
	try {	
	    Statement stmt = conn.createStatement();
		String sql = "SELECT LOVE FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql); 
		System.out.println(sql);
	    
	    
	    if(rs.next()){
	         int love = rs.getInt(1);
	         love++;

	 	sql = "UPDATE board SET LOVE=" + love + " where NUM=" +idx;
	    stmt.executeUpdate(sql);
	    rs.close();
	    stmt.close();
	    conn.close();
	       } 
	   }catch(SQLException e) {
	}
%>
<script language=javascript>
   self.window.alert("선호하였음");
   location.href="list.jsp"; 

</script>
