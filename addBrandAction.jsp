<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%
    String brandName = request.getParameter("brandName");
    Connection conn = null;
    PreparedStatement psCheck = null;
    PreparedStatement psInsert = null;
    ResultSet rs = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Establish the connection
        String url = "jdbc:mysql://localhost:3306/ultras"; // Adjust the URL, database name
        String user = "root"; // Your MySQL user
        String password = ""; // Your MySQL password
        conn = DriverManager.getConnection(url, user, password);

        // Check if the brand name already exists
        String checkQuery = "SELECT COUNT(*) FROM brands WHERE brand_name = ?";
        psCheck = conn.prepareStatement(checkQuery);
        psCheck.setString(1, brandName);
        rs = psCheck.executeQuery();

        if (rs.next() && rs.getInt(1) > 0) {
            out.println("<script>alert('Brand name already exists. Please try another name.'); window.location.href='addbrand.jsp';</script>");
        } else {
            // Prepare the SQL query to insert the brand name
            String insertQuery = "INSERT INTO brands (brand_name) VALUES (?)";
            psInsert = conn.prepareStatement(insertQuery);
            psInsert.setString(1, brandName);

            // Execute the query
            int result = psInsert.executeUpdate();

            if (result > 0) {
                out.println("<script>alert('Brand added successfully!'); window.location.href='addbrand.jsp';</script>");
            } else {
                out.println("<script>alert('Failed to add brand. Please try again.'); window.location.href='addbrand.jsp';</script>");
            }
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<script>alert('An error occurred: " + e.getMessage() + "'); window.location.href='addbrand.jsp';</script>");
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (psCheck != null) {
            try {
                psCheck.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (psInsert != null) {
            try {
                psInsert.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
