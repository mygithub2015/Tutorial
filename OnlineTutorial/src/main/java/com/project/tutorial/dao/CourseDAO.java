package com.project.tutorial.dao;

import java.util.List;

import com.project.tutorial.model.Course;

public interface CourseDAO {
	
	 void addCourse(Course c);
	
	List<Course> getCourses();
	
	void updateCourse(Course c);
	
	Course getCourseById(int courseId);
	
	void removeCourse(Course c);
	
	

}
