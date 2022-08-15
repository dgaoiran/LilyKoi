
package com.codingdojo.lilykoi.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.lilykoi.models.InterviewStage;
import com.codingdojo.lilykoi.repositories.InterviewRepository;

@Service
public class InterviewService {
	@Autowired
	private InterviewRepository interviewRepo;
	
	public InterviewStage findById(Long id) {
		Optional<InterviewStage> optionalIntStage = interviewRepo.findById(id);
		if(optionalIntStage.isPresent()) {
			return optionalIntStage.get();
		}
		return null;
	}
	
	public InterviewStage createIntStage(InterviewStage intStage) {
		return interviewRepo.save(intStage);
	}
	
	public InterviewStage updateIntStage(InterviewStage intStage) {
		return interviewRepo.save(intStage);
	}
	
	public List<InterviewStage> allStages() {
		return interviewRepo.findAll();
	}

	
	public void deleteIntStage(Long id) {
		Optional<InterviewStage> optionalIntStage = interviewRepo.findById(id);
		if(optionalIntStage.isPresent()) {
			interviewRepo.deleteById(id);
		}
	}
}
