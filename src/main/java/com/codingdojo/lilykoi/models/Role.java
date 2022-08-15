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
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="roles")
public class Role {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty
	@Size(min=2, max=30, message="Must be between 2 and 30 characters")
	private String title;
	
	@NotEmpty
	@Size(min=2, max=30, message="Must be between 2 and 30 characters")
	private String companyName;
	
	@Min(value=1)
	@Max(value=999999) 
	private int minSalary;
	
	@Min(value=1)
	@Max(value=999999) 
	private int maxSalary;
	
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	
	@OneToMany(mappedBy="role", fetch = FetchType.LAZY)
	@JsonIgnore
	private List<InterviewStage> interviewStages;
	
	public Role() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public int getMinSalary() {
		return minSalary;
	}

	public void setMinSalary(int minSalary) {
		this.minSalary = minSalary;
	}

	public int getMaxSalary() {
		return maxSalary;
	}

	public void setMaxSalary(int maxSalary) {
		this.maxSalary = maxSalary;
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
