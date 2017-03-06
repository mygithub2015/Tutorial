package com.project.tutorial.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.tutorial.model.Course;
import com.project.tutorial.model.QuestionsAnswers;
import com.project.tutorial.service.CourseService;

@Controller
public class AddCourseController {
	
	
	private CourseService courseService;
	
	public  AddCourseController() {
		// TODO Auto-generated constructor stub
	
		System.out.println("in controller");
	}
	
	@Autowired(required=true)
	@Qualifier(value="courseService")
	public void setCourseService(CourseService service){	
		this.courseService = service;
	}
	
	@RequestMapping(value = {"addCourse"}, method = RequestMethod.GET)
	public ModelAndView listCourses() {
		ModelAndView model = new ModelAndView();
		System.out.println("in listCourses");
		model.addObject("course", new Course());
		model.addObject("listCourses", this.courseService.getListOfCourses());
		model.setViewName("AddCourse");
		return model;
	}
	
	@RequestMapping(value = "addCourse", method = RequestMethod.POST)
	public String addCourse(@ModelAttribute("course") Course c){
		
		List<Course> listOfCourses = this.courseService.getListOfCourses();
		
		if(!listOfCourses.contains(c)){
			
		System.out.println("in controller addCourse with Course as "+c);
		this.courseService.addCourse(c);
		 
		}
		else{
			
			System.out.println("Course exist update it!");
			
			this.courseService.updateCourse(c);
		}
		
		return "redirect:addCourse";
		
	}

}
