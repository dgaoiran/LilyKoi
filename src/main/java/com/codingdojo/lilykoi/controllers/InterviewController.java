package com.codingdojo.lilykoi.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.lilykoi.models.InterviewStage;
import com.codingdojo.lilykoi.models.Role;
import com.codingdojo.lilykoi.services.InterviewService;
import com.codingdojo.lilykoi.services.RoleService;
import com.codingdojo.lilykoi.services.UserService;


@Controller
public class InterviewController {
	
	@Autowired
	private RoleService roleServ;
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private InterviewService interServ;
	
	
	//renders addStage.jsp
	@GetMapping("/lilykoi/viewRole/{id}/addStage") 
	public String addStage(@ModelAttribute("newStage") InterviewStage interviewStage, Model model, @PathVariable("id") Long id, HttpSession session) {
		// you can call on userId in the jsp
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
	 
		 //pulls by role 
		 Role role = roleServ.findById(id); 
		 model.addAttribute("role", role);		 
	 
		 //pulls by user 
		 Long userId = (Long) session.getAttribute("userId");
		 model.addAttribute("loggedInUser", userServ.findById(userId));
		 
		 return "addStage.jsp";
	}
	
	@PostMapping("/lilykoi/createStage/{id}")
	public String createStage(@Valid @ModelAttribute("newStage") InterviewStage interviewStage, @PathVariable("id") Long id, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println(interviewStage.getInterviewDate());
			System.out.println(result.getModel());
			return "addStage.jsp";
		}
		interServ.createIntStage(interviewStage);
		// redirect to db for now, but route to view.jsp later
		return "redirect:/lilykoi/viewRole/{id}";
	}
	
	//renders the edit.jsp by stage ID
	@GetMapping("lilykoi/editStage/{id}")
	public String editStage(@ModelAttribute("editStage") InterviewStage interviewStage, @PathVariable("id") Long id, HttpSession session, Model model) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/logout";
    	}
		InterviewStage stage = interServ.findById(id);
		model.addAttribute("thisStage", stage);
		
    	Date currentDate = stage.getInterviewDate();
		/* System.out.println(currentDate); */
    	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		String strDate = dateFormat.format(currentDate);
		model.addAttribute("scheduledDate", strDate);

		return "edit.jsp";
	}
	
	//Put annotation for updating info
	@PutMapping("/lilykoi/editStage/{id}/{roleId}")
	public String updateStage(@PathVariable("roleId") Long roleId, @Valid @ModelAttribute("editStage") InterviewStage interviewStage, BindingResult result) {
		if(result.hasErrors()) {
    		return "edit.jsp";
    	}

		interServ.updateIntStage(interviewStage);
		return "redirect:/lilykoi/viewRole/{roleId}";
	}	
	
	//this route deletes an interview stage
	@DeleteMapping(value="/destroyStage/{id}")
	public String delete(@PathVariable("id") Long id) {
		interServ.deleteIntStage(id);
		return "redirect:/lilykoi/dashboard";
	}
}
