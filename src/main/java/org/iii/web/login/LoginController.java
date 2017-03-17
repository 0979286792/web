package org.iii.web.login;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	@Resource(name = "LoginService")
	LoginService loginService;

	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {

		
		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!!!");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			List allCrabinfo = loginService.getallCrabinfo();
			model.addObject("allCrabinfo", allCrabinfo);
			for (GrantedAuthority authority : userDetail.getAuthorities()) {
	            if (authority.getAuthority().equals("ROLE_ADMIN"))
	            {
	    			List alluserinfo = loginService.getallUserinfo();
	    			model.addObject("alluserinfo", alluserinfo);
	            }
	            else
	            {
	            	String username = userDetail.getUsername();
	    			String useremail = loginService.getUserEmail(username);
	    			model.addObject("useremail", useremail);
	            }
	        }
		}

		model.setViewName("hello");
		return model;

	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView deletePage(HttpServletRequest request,
			HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView();
		
		String username = (String) request.getParameter("check_radio");
		loginService.deleteUser(username);
		
		System.out.println("delete "+username);
		
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!!!");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			for (GrantedAuthority authority : userDetail.getAuthorities()) {
	            if (authority.getAuthority().equals("ROLE_ADMIN"))
	            {
	    			List alluserinfo = loginService.getallUserinfo();
	    			model.addObject("alluserinfo", alluserinfo);
	            }
	        }
			
		}
		
		model.setViewName("hello");
		
		return model;

	}
	
	@RequestMapping(value = "/deletecrab", method = RequestMethod.POST)
	public ModelAndView deletecrabPage(HttpServletRequest request,
			HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView();
		
		String crabname = (String) request.getParameter("check_radio");
		loginService.deletecrab(crabname);
		
		System.out.println("delete "+crabname);
		
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!!!");
		
		List allCrabinfo = loginService.getallCrabinfo();
		model.addObject("allCrabinfo", allCrabinfo);
		
		/*Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			for (GrantedAuthority authority : userDetail.getAuthorities()) {
	            if (authority.getAuthority().equals("ROLE_ADMIN"))
	            {
	    			List alluserinfo = loginService.getallUserinfo();
	    			model.addObject("alluserinfo", alluserinfo);
	            }
	        }
			
		}*/
		
		model.setViewName("hello");
		
		return model;

	}

	@RequestMapping(value = "/helloworld2", method = RequestMethod.GET)
	public ModelAndView helloworldPage() {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("helloworld3");
		
		return model;
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView commonPage(HttpServletRequest request,
			HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView();

		model.setViewName("insert");
		
		return model;

	}
	
	@RequestMapping(value = "/insertcrab", method = RequestMethod.POST)
	public ModelAndView crabPage(HttpServletRequest request,
			HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView();

		model.setViewName("index");
		
		return model;
		
	}
	
	@RequestMapping(value = "/insertpage", method = RequestMethod.POST)
	public ModelAndView insertPage(HttpServletRequest request,
			HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView();
		
		String username = (String) request.getParameter("username");
		String password = (String) request.getParameter("password");
		String email = (String) request.getParameter("email");
		loginService.insertUser(username,password,email,"1");
		System.out.println("insert a user");
		
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!!!");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			for (GrantedAuthority authority : userDetail.getAuthorities()) {
	            if (authority.getAuthority().equals("ROLE_ADMIN"))
	            {
	    			List alluserinfo = loginService.getallUserinfo();
	    			model.addObject("alluserinfo", alluserinfo);
	            }
	        }
		}
		
		model.setViewName("hello");
		
		return model;

	}

	private String saveDirectory = "C:/Users/phant/git/spring3example/src/main/webapp/resources/pic/";
	@RequestMapping(value = "/insertcrabpage",method = RequestMethod.POST)
    public ModelAndView handleFileUpload(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("uploadname") MultipartFile fileUpload) throws Exception {
		
		ModelAndView model = new ModelAndView();
		
		
		
		String crabname = (String) request.getParameter("crabname");
		String crabsubject = (String) request.getParameter("crabsubject");
		String crabfeature = (String) request.getParameter("crabfeature");
		String crabhabits = (String) request.getParameter("crabhabits");
		String crablocation = (String) request.getParameter("crablocation");
		String crabpicture = fileUpload.getOriginalFilename();
		loginService.insertCrab(crabname,crabsubject,crabfeature,crabhabits,crablocation,crabpicture);
		System.out.println(crabfeature+crabhabits+crablocation);
		
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!!!");
		
		List allCrabinfo = loginService.getallCrabinfo();
		model.addObject("allCrabinfo", allCrabinfo);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			for (GrantedAuthority authority : userDetail.getAuthorities()) {
	            if (authority.getAuthority().equals("ROLE_ADMIN"))
	            {
	    			List alluserinfo = loginService.getallUserinfo();
	    			model.addObject("alluserinfo", alluserinfo);
	            }
	        }
		}
		
		byte[] bytes = fileUpload.getBytes();
        File localFile = new File(saveDirectory+fileUpload.getOriginalFilename()); //path=¸ô®|+ÀÉ¦W
        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(localFile));
        stream.write(bytes);
        stream.close();
		
		model.setViewName("hello");
		
		return model;

	}
	
	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This page is for ROLE_ADMIN only!!");

		model.setViewName("admin");
		
		return model;

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}

		model.setViewName("login");
		return model;

	}
	
	//for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();
		
		//check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
		
			model.addObject("username", userDetail.getUsername());
			
		}
		
		model.setViewName("403");
		return model;

	}

}