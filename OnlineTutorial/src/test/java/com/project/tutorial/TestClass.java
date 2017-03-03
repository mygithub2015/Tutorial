package com.project.tutorial;

import com.project.tutorial.model.Course;
import com.project.tutorial.service.CourseService;
import com.project.tutorial.service.CourseServiceImpl;

public class TestClass {
	
	public static void main(String[] args) {
		
		Course c = new Course();
		
		c.setCourseName("Physics");
		
		System.out.println("Adding a course");
		
		CourseService service = new CourseServiceImpl();
		service.addCourse(c);
		
		System.out.println("List of courses");
		
		for(Course o : service.getListOfCourses()){
			
			System.out.println(o);
			
			
		}
	}

}
