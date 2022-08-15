package com.codingdojo.lilykoi.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.lilykoi.models.LoginUser;
import com.codingdojo.lilykoi.models.User;
import com.codingdojo.lilykoi.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;

	public User register(User newUser, BindingResult result) {
		// TODO Auto-generated method stub
		//verify if email exists in db, reject if true
    	Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
    	if(potentialUser.isPresent()) {
    		result.rejectValue("email", "Matches", "An account with that email already exists!");
    	}
    	
    	//verify if passwords match 
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    	    result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
    	}
    	// reject if false
    	if(result.hasErrors()) {
    		return null;
    	}

    	// use bycrypt to has pw, save user/pw to db
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashed);
    	return userRepo.save(newUser);
	}
	
    public User findById(Long id) {
    	Optional<User> potentialUser = userRepo.findById(id);
    	if(potentialUser.isPresent()) {
    		return potentialUser.get();
    	}
    	return null;
    }
    

  //this function works with the controller for "/login"
    public User login(LoginUser newLoginObject, BindingResult result) {
        // TO-DO: Additional validations!
    	Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());
    	//verify if USER exists in db, reject if false (not in db)
    	if(!potentialUser.isPresent()) {
    		result.rejectValue("email", "matches", "User not found!");
    		return null;
    	}
    	
    	// if the user exists, retrieve from db and assign to var
    	User user = potentialUser.get();
    	
    	//verify bcrypt password
    	if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
    		result.rejectValue("password", "Matches", "Invalid Password!");
    	}
    	//return null if errors exist
    	if(result.hasErrors()) {
    		return null;
    	}
    	    	
        //otherwise return user to be called in the (controller)
    	return user;
    }  
}
