package com.codingdojo.lilykoi.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="Must not be blank!")
	@Size(min=2, max=30, message="First name must be between 2 and 30 characters")
	private String firstName;
	
	@NotEmpty(message="Must not be blank!")
	@Size(min=2, max=30, message="Last name must be between 2 and 30 characters")
	private String lastName;
	
	@NotEmpty(message="Must not be blank!")
	@Email(message="Please enter a valid email")
	private String email;

	@Min(value=1, message="Enter desired salary per year")
	@Max(value=999999) 
	private int desiredSalary;
	
	@NotEmpty(message="Must not be blank!")
	@Size(min=8, max=128, message="Password must be between 8 and 128 characters")
	private String password;
	
	@Transient
	@NotEmpty(message="Must not be blank!")
	@Size(min=8, max=128, message="Confirm must be between 8 and 128 characters")
	private String confirm;
	
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
	@JsonIgnore
	private List<InterviewStage> interviewStages;
	
	public User() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public int getDesiredSalary() {
		return desiredSalary;
	}

	public void setDesiredSalary(int desiredSalary) {
		this.desiredSalary = desiredSalary;
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

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	

	public List<InterviewStage> getInterviewStages() {
		return interviewStages;
	}

	public void setInterviewStages(List<InterviewStage> interviewStages) {
		this.interviewStages = interviewStages;
	}

	@PrePersist
	 protected void onCreate(){
	     this.createdAt = new Date();
	 }
	
	 @PreUpdate
	 protected void onUpdate(){
	     this.updatedAt = new Date();
	 } 	
	
}