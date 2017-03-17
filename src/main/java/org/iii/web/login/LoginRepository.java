package org.iii.web.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;






import javax.inject.Inject;
//import javax.inject.Inject;
import javax.sql.DataSource;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("LoginRepository")
@Transactional
public class LoginRepository {

	private JdbcTemplate jdbcTemplate;

	@Inject	
	public void init(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List selectallUsers() {
		String sql = "SELECT * FROM users";
		List<Map<String, Object>> list = this.jdbcTemplate.queryForList(sql);
		HashMap<Integer,String> topicMap = new HashMap<Integer,String>();			
		return list;

	}
	
	public List selectallCrab() {
		String sql = "SELECT * FROM crab";
		List<Map<String, Object>> list = this.jdbcTemplate.queryForList(sql);
		HashMap<Integer,String> topicMap = new HashMap<Integer,String>();			
		return list;

	}
	
	public String selectUser(String username){
		String sql = "SELECT username FROM users WHERE username =?" ; 
		String accountName = this.jdbcTemplate.queryForObject(sql,String.class,username); 
		return accountName ; 

	}
	
	public String selectCrab(String crabname){
		String sql = "SELECT crab_Name FROM crab WHERE crab_Name =?" ; 
		String accountName = this.jdbcTemplate.queryForObject(sql,String.class,crabname); 
		return accountName ; 

	}
	
	public Map<String, Object> selectUserall(String username){
		String sql = "SELECT * FROM users WHERE username =?" ; 
		Map<String, Object> map = this.jdbcTemplate.queryForMap(sql);		
		return map ; 

	}
	
	public String selectEmail(String username){
		String sql = "SELECT email FROM users WHERE username =?" ; 
		String email = this.jdbcTemplate.queryForObject(sql,String.class,username); 
		return email; 

	}
	
	public int insertUser(String username, String password, String email, String enabled)
	{ 
		String sql = "INSERT INTO users(username,password,email,enabled) VALUE(?,md5(?),?,?) ";
		int updateCount = jdbcTemplate.update(sql,
				new Object[] { username, password, email, enabled });
		return updateCount;

	}
	
	public int insertCrab(String crabname, String crabsubject, String crabfeature, String crabhabits, String crablocation, String crabpicture)
	{ 
		String sql = "INSERT INTO crab(animal_ID,crab_Name,crab_Subject,crab_Feature,crab_Habits,crab_GPSLocation,crab_Picture) VALUE(?,?,?,?,?,?,?) ";
		int updateCount = jdbcTemplate.update(sql,
				new Object[] {101, crabname,crabsubject,crabfeature,crabhabits, crablocation,crabpicture});
		return updateCount;

	}
	
	public void deleteUser(String username){
		String sql = "DELETE FROM users WHERE username =?" ; 
		this.jdbcTemplate.update(sql,username);	

	}
	
	public void deletecrab(String crabname){
		String sql = "DELETE FROM crab WHERE crab_ID =?" ; 
		this.jdbcTemplate.update(sql,crabname);	

	}
}
