
package com.codingdojo.lilykoi.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.lilykoi.models.InterviewStage;


@Repository
public interface InterviewRepository extends CrudRepository<InterviewStage, Long> {
	List<InterviewStage> findAll();
	Optional<InterviewStage> findById(Long id);
}
