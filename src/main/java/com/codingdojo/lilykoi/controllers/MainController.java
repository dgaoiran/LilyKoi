package com.codingdojo.lilykoi.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


import com.codingdojo.lilykoi.models.LoginUser;
import com.codingdojo.lilykoi.models.Role;
import com.codingdojo.lilykoi.models.User;
import com.codingdojo.lilykoi.services.InterviewService;
import com.codingdojo.lilykoi.services.RoleService;
import com.codingdojo.lilykoi.services.UserService;


@Controller
public class MainController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private RoleService roleServ;
	
	@Autowired
	private InterviewService interServ;

	@GetMapping("/")
	public String index() {
		return "redirect:/lilykoi";
	}
	
	//login and registration page
	@GetMapping("/lilykoi")
	public String welcome(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "welcome.jsp";
	}
	
	//process data to register new user
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
		User user = userServ.register(newUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "welcome.jsp";
		}
		//getId() is from the model - getter
		session.setAttribute("userId", user.getId());
		return "redirect:/lilykoi/dashboard";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
		User user = userServ.login(newLogin, result);
		
    	// return to login if no userId is found
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "welcome.jsp";
        }
        
        session.setAttribute("userId", user.getId());
        return "redirect:/lilykoi/dashboard";
		
	}
	//routes user to their dashboard
	@GetMapping("/lilykoi/dashboard")
	public String dashboard(HttpSession session, Model model) {
		// verify if userId exists in session
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/logout";
    	}
    	//Store their ID from the DB in session, 
        // in other words, log them in.
    	Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("loggedInUser", userServ.findById(userId));
    	
		Role role = roleServ.findById(userId); 
		model.addAttribute("role", role);
		model.addAttribute("roles", roleServ.allRoles());
		 
		model.addAttribute("interviews", interServ.allStages());	 
		
		 

		 //also needs to retrieve roles since we will display that on the dashboard
		 model.addAttribute("roles", roleServ.allRoles());
		 return "dashboard.jsp";
	}
	
	//route to clear session
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	 
		// Set userId to null and redirect to login/register page
		session.setAttribute("userId", null);
	    return "redirect:/";
	}
	
}
