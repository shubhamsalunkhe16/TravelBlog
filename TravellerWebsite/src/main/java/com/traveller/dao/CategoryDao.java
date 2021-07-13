package com.traveller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.traveller.Db.DBConnection;
import com.traveller.pojo.Categories;

public class CategoryDao {

	public ArrayList<Categories> getCategories() {
		ArrayList<Categories> list = null;
		try {
			Connection con = DBConnection.getConnect();
			String sql = "select * from categories";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			list = new ArrayList<Categories>();
			while (rs.next()) {
				Categories c = new Categories(rs.getInt(1), rs.getString(2), rs.getString(3));
				
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

}
