package com.traveller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.traveller.Db.DBConnection;
import com.traveller.pojo.User;

public class UserDao {

	public boolean addUser(User uadd) {
		boolean b = false;
		String sql = "insert into addUser(fname,lname,email,contact,password) values (?,?,?,?,?)";
		try {
			Connection con = DBConnection.getConnect();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, uadd.getFname());
			ps.setString(2, uadd.getLname());
			ps.setString(3, uadd.getEmail());
			ps.setString(4, uadd.getContact());
			ps.setString(5, uadd.getPassword());
			ps.executeUpdate();
			b = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return b;

	}

	public User uinfo(String email, String password) {
		User u = null;
		String sql = "select * from addUser where email=? and password=?";
		try {
			Connection con = DBConnection.getConnect();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setFname(rs.getString(2));
				u.setLname(rs.getString(3));
				u.setEmail(rs.getString(4));
				u.setContact(rs.getString(5));
				u.setPassword(rs.getString(6));
				u.setProfile(rs.getString(7));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return u;

	}

	public boolean updateUser(User u) {
		boolean b = false;
		String sql = "update adduser set fname=? , lname=? , email=? ,contact=? , password=? , profile=?  where id=? ";
		try {
			Connection con = DBConnection.getConnect();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, u.getFname());
			ps.setString(2, u.getLname());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getContact());
			ps.setString(5, u.getPassword());
			ps.setString(6, u.getProfile());
			ps.setInt(7, u.getId());

			ps.executeUpdate();
			b = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return b;

	}

	public User uInfoForPost(int uId) {
		User u = null;
		String sql = "select * from addUser where id=?";
		try {
			Connection con = DBConnection.getConnect();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, uId);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setFname(rs.getString(2));
				u.setLname(rs.getString(3));
				u.setEmail(rs.getString(4));
				u.setContact(rs.getString(5));
				u.setPassword(rs.getString(6));
				u.setProfile(rs.getString(7));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return u;

	}

}
