package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

// db created Job_portal and 2 table job and user;
public class DBConnect {
private static Connection conn;
public static Connection getConn() {
	try {
		if(conn==null){
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal", "root", "Vivoy83@");
//			PreparedStatement ps = conn.prepareStatement("select * from user")
			
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return conn;
}
}
