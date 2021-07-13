package com.traveller.pojo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.traveller.Db.DBConnection;

public class ContactDao {

	public boolean contactUs(Contact c) {
		boolean b = false;
		String sql = "insert into contact(conName,conEmail,conSubject,conMessage) values (?,?,?,?)";
		try {
			Connection con = DBConnection.getConnect();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, c.getContName());
			ps.setString(2, c.getContEmail());
			ps.setString(3, c.getContSubject());
			ps.setString(4, c.getContMessage());
			ps.executeUpdate();
			b = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return b;

	}

}
