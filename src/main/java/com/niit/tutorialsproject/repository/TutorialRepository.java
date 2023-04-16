/*
 * Author Name : Saravanan P
 * Date : 16/04/2023
 * Created with : IntelliJ IDEA Community Edition
 */
package com.niit.tutorialsproject.repository;

/**
 * @author Saravanan.1.P
 * @Date 16/04/2023
 */
import java.util.List;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.niit.tutorialsproject.model.Tutorial;

public interface TutorialRepository extends MongoRepository<Tutorial, String> {
    List<Tutorial> findByTitleContaining(String title);
    List<Tutorial> findByPublished(boolean published);
}
