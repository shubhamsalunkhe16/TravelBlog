package com.traveller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.traveller.Db.DBConnection;
import com.traveller.pojo.Posts;

public class PostDao {

	public boolean addPost(Posts p) {
		boolean b = false;
		String sql = "insert into posts(pTitle,pDesc,pPic,catId,uId,pLocation) values (?,?,?,?,?,?)";
		try {
			Connection con = DBConnection.getConnect();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, p.getpTitle());
			ps.setString(2, p.getpDesc());
			ps.setString(3, p.getpPic());
			ps.setInt(4, p.getCatId());
			ps.setInt(5, p.getuId());
			ps.setString(6, p.getpLocation());
			ps.executeUpdate();
			b = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return b;

	}

	public ArrayList<Posts> getAllPosts() {
		ArrayList<Posts> allPosts = null;
		try {
			Connection con = DBConnection.getConnect();
			String sql = "select * from posts order by pid desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			allPosts = new ArrayList<Posts>();
			while (rs.next()) {
				Posts p = new Posts(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5),
						rs.getInt(6), rs.getInt(7), rs.getString(8));

				allPosts.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return allPosts;
	}

	public ArrayList<Posts> getPostsByCat(int catId) {
		ArrayList<Posts> PostsByCat = null;
		try {
			Connection con = DBConnection.getConnect();
			String sql = "select * from posts where catId=? order by pid desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, catId);
			ResultSet rs = ps.executeQuery();
			PostsByCat = new ArrayList<Posts>();
			while (rs.next()) {
				Posts p = new Posts(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5),
						rs.getInt(6), rs.getInt(7), rs.getString(8));

				PostsByCat.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return PostsByCat;
	}

	public ArrayList<Posts> getPostsForGallary() {
		ArrayList<Posts> PostsForGallary = null;
		try {
			Connection con = DBConnection.getConnect();
			String sql = "select * from posts order by pid desc LIMIT 6 ;";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			PostsForGallary = new ArrayList<Posts>();
			while (rs.next()) {
				Posts p = new Posts(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5),
						rs.getInt(6), rs.getInt(7), rs.getString(8));

				PostsForGallary.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return PostsForGallary;
	}

	public Posts getPostsByPid(int pId) {
		Posts p = null;
		try {
			Connection con = DBConnection.getConnect();
			String sql = "select * from posts where pId=? order by pid desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, pId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new Posts(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5),
						rs.getInt(6), rs.getInt(7), rs.getString(8));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return p;
	}

	public ArrayList<Posts> getPostsByUId(int uId) {
		ArrayList<Posts> PostsByUId = null;
		try {
			Connection con = DBConnection.getConnect();
			String sql = "select * from posts where uId=? order by pid desc ;";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, uId);
			ResultSet rs = ps.executeQuery();
			PostsByUId = new ArrayList<Posts>();
			while (rs.next()) {
				Posts p = new Posts(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5),
						rs.getInt(6), rs.getInt(7), rs.getString(8));

				PostsByUId.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return PostsByUId;
	}

	public boolean updatePost(Posts p) {
		boolean b = false;
		String sql = "update posts set pTitle=? , pDesc=? , catId=? ,pLocation=?   where pId=? ";
		try {
			Connection con = DBConnection.getConnect();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, p.getpTitle());
			ps.setString(2, p.getpDesc());
			ps.setInt(3, p.getCatId());
			ps.setString(4, p.getpLocation());
			ps.setInt(5, p.getPid());
			ps.executeUpdate();
			b = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return b;

	}

	public boolean deletePost(int pid) {
		boolean b = false;
		String sql = "delete from Posts  where pId=? ";
		try {
			Connection con = DBConnection.getConnect();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, pid);
			ps.executeUpdate();
			b = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return b;

	}

}
