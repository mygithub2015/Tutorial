package com.project.tutorial.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.project.tutorial.dao.CourseDAO;
import com.project.tutorial.model.Course;



public class CourseServiceImpl implements CourseService{
	
	private CourseDAO courseDao;
	
	
	@Transactional
	public void setCourseDAO(CourseDAO dao){
		
		this.courseDao = dao;
	}

	@Transactional
	public void addCourse(Course c) {
		
		courseDao.addCourse(c);
		
	}

	@Transactional
	public List<Course> getListOfCourses() {

		return courseDao.getCourses();
	}

	public void updateCourse(Course C) {
		// TODO Auto-generated method stub
		
		System.out.println("going to update the course, currently in Service");
		
	}

	public Course getCourseById(int courseId) {
		// TODO Auto-generated method stub
		return null;
	}

	public void removeCourse(Course c) {
		// TODO Auto-generated method stub
		
	}

}
