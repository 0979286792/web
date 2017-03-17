package org.iii.web.login;

import java.util.List;

import javax.inject.Inject;

import org.iii.web.login.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
//import javax.inject.Inject;
import org.springframework.stereotype.Service;

@Service("LoginService")
public class LoginService {
	
	@Inject
	private LoginRepository loginRepository;
	
	public String getUserName(String username) {
		
		try{
			String accountName = loginRepository.selectUser(username);
			return accountName;
			
		}
		catch(Exception e){
			System.out.print(e);
			return "error from LoginService";
		}
		
	}
	
	public String getUserEmail(String username) {
		
		try{
			String email = loginRepository.selectEmail(username);
			return email;
			
		}
		catch(Exception e){
			System.out.print(e);
			return "error from LoginService";
		}
		
	}

	public List getallUserinfo() {

			List alluserinfo = loginRepository.selectallUsers();
			return alluserinfo;
		
	}
	
	public List getallCrabinfo() {

		List allCrabinfo = loginRepository.selectallCrab();
		return allCrabinfo;
	
}
	
	public int insertUser(String username, String password, String email, String enabled) {

		int updateCount = loginRepository.insertUser(username, password, email, enabled);
		return updateCount;
	
	}
	
	public int insertCrab(String crabname, String crabsubject, String crabfeature, String crabhabits, String crablocation, String crabpicture) {

		int updateCount = loginRepository.insertCrab(crabname, crabsubject, crabfeature, crabhabits, crablocation,crabpicture);
		return updateCount;
	
	}
	
	public void deleteUser(String username) {

		loginRepository.deleteUser(username);
	
	}
	public void deletecrab(String crabname) {

		loginRepository.deletecrab(crabname);
	
	}
	
}
