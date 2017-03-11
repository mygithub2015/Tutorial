package com.project.tutorial.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.tutorial.service.CourseService;


@Controller
public class HomePageController {
	
private CourseService courseService;
	
	public  HomePageController() {
		// TODO Auto-generated constructor stub
	
		System.out.println("in HomePageController");
	}
	
	@Autowired(required=true)
	@Qualifier(value="courseService")
	public void setCourseService(CourseService service){	
		this.courseService = service;
	}
	
	/*@RequestMapping(value="/home")
	public String loadHomePage(){
		
		System.out.println("in HomePageController.loadHomePage method");
		return "Index"; //calling Index.jsp
		
	}*/
	

}
