package com.codingdojo.lilykoi.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.lilykoi.models.Role;
import com.codingdojo.lilykoi.repositories.RoleRepository;


@Service
public class RoleService {
	
	@Autowired
	private RoleRepository roleRepo;
	
	public Role findById(Long id) {
		Optional<Role> optionalRole = roleRepo.findById(id);
		if(optionalRole.isPresent()) {
			return optionalRole.get();
		}
		return null;
	}
	
	public Role createRole(Role role) {
		return roleRepo.save(role);
	}
	
	public Role updateRole(Role role) {
		return roleRepo.save(role);
	}
	
	public List<Role> allRoles() {
		return roleRepo.findAll();
	}
	
	public void deleteRole(Long id) {
		Optional<Role> optionalRole = roleRepo.findById(id);
		if(optionalRole.isPresent()) {
			roleRepo.deleteById(id);
		}
	}
	
	
}