package com.codingdojo.lilykoi.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.lilykoi.models.Role;
import com.codingdojo.lilykoi.models.User;
import com.codingdojo.lilykoi.services.RoleService;
import com.codingdojo.lilykoi.services.UserService;

@Controller
public class RoleController {
	@Autowired
	private UserService userServ;

	@Autowired
	private RoleService roleServ;


	// renders newRole.jsp
	@GetMapping("/lilykoi/newRole")
	public String newRole(@ModelAttribute("newRole") Role role, Model model, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		User user = userServ.findById((Long) session.getAttribute("userId"));
		model.addAttribute("user", user);
		return "newRole.jsp";
	}

	// processes new role
	@PostMapping("/lilykoi/createRole")
	public String createRole(@Valid @ModelAttribute("newRole") Role role, BindingResult result) {
		if (result.hasErrors()) {
			return "newRole.jsp";
		}
		roleServ.createRole(role);
		// redirect to db for now, but route to view.jsp when available
		return "redirect:/lilykoi/dashboard";
	}

	// routes to viewRole.jsp
	@GetMapping("/lilykoi/viewRole/{id}")
	public String viewRole(@PathVariable("id") Long id, HttpSession session, Model model) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		/*
		 * InterviewStage thisStage = interServ.; model.addAttribute("thisStage",
		 * thisStage);
		 */
		// pulls by role
		Role role = roleServ.findById(id);
		model.addAttribute("role", role);

		// pulls by user
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("loggedInUser", userServ.findById(userId));

		return "viewRole.jsp";
	}
}
