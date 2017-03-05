package com.project.tutorial.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.tutorial.model.Course;
import com.project.tutorial.model.QuestionsAnswers;
import com.project.tutorial.service.CourseService;

@Controller
public class DispatcherController {
	
	
	private CourseService courseService;
	
	public  DispatcherController() {
		// TODO Auto-generated constructor stub
	
		System.out.println("in controller");
	}
	
	@Autowired(required=true)
	@Qualifier(value="courseService")
	public void setCourseService(CourseService service){	
		this.courseService = service;
	}
	
	@RequestMapping(value = "/courses", method = RequestMethod.GET)
	public String listCourses(Model model) {
		
		System.out.println("in listCourses");
		model.addAttribute("course", new Course());
		model.addAttribute("listCourses", this.courseService.getListOfCourses());
		return "Test";
	}
	
	@RequestMapping(value = "/course/add", method = RequestMethod.POST)
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
		
		return "redirect:/courses";
		
	}
	
	@RequestMapping(value = "/questionsAnswers", method = RequestMethod.GET)
	public String addQuestionsAnswers(Model model){
		
		System.out.println("in questionsAnswers page");
		
		model.addAttribute("questionsAnswers", new QuestionsAnswers());
		List<QuestionsAnswers> listOfQnsAns =  this.courseService.getListOfQnsAns();
		model.addAttribute("listOfQnsAns",listOfQnsAns);
		System.out.println(listOfQnsAns);
		
		return "QuestionsAnswers";
	}
	
	@RequestMapping(value = "/add/questionsAnswers", method = RequestMethod.POST)
	public String addQuestionsAnswers(@ModelAttribute("questionsAnswers") QuestionsAnswers qa, Model model){
		
	/*	int courseId = qa.getCourseId();
		
		Course c = this.courseService.getCourseById(courseId);
		
		qa.setCourse(c);
		*/
		
		List<QuestionsAnswers> listOfQnsAns =  this.courseService.getListOfQnsAns();
		model.addAttribute("listOfQnsAns",listOfQnsAns);
		System.out.println("In DispatcherController.addQuestionsAnswers method");
		System.out.println(listOfQnsAns);
		this.courseService.addQuestionsAnswers(qa);
		
		return "QuestionsAnswers";
		
	}
	
	

}
