package com.codingdojo.lilykoi.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginUser {

	@NotEmpty(message="Must not be blank")
	@Email(message="Please enter a valid email!")
	private String email;
	
    @NotEmpty(message="Must not be blank!")
    @Size(min=8, max=128, message="Password must be between 8 and 128 characters")
    private String password;

	public LoginUser() {
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
    
}
