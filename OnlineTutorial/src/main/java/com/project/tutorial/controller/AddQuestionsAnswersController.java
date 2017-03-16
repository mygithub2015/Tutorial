
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
public class AddQuestionsAnswersController {
	
	
	private CourseService courseService;
	
	public  AddQuestionsAnswersController() {
		// TODO Auto-generated constructor stub
	
		System.out.println("AddQuestionsAnswers controller");
	}
	
	@Autowired(required=true)
	@Qualifier(value="courseService")
	public void setCourseService(CourseService service){	
		this.courseService = service;
	}
	
	@RequestMapping(value = "/AddQuestionsAnswers", method = RequestMethod.GET)
	public ModelAndView addQuestionsAnswers(){
		
		System.out.println("in questionsAnswers page");
		ModelAndView model = new ModelAndView();
		
		model.addObject("questionsAnswers", new QuestionsAnswers());
		List<QuestionsAnswers> listOfQnsAns =  this.courseService.getListOfQnsAns();
		model.addObject("listOfQnsAns",listOfQnsAns);
		System.out.println(listOfQnsAns);
		model.setViewName("AddQuestionsAnswers");
		return model;
	}
	
	@RequestMapping(value = "/AddQuestionsAnswers", method = RequestMethod.POST)
	public ModelAndView addQuestionsAnswers(@ModelAttribute("questionsAnswers") QuestionsAnswers questionsAnswers){
		
	/*	int courseId = qa.getCourseId();
		
		Course c = this.courseService.getCourseById(courseId);
		
		qa.setCourse(c);
		*/
		ModelAndView model = new ModelAndView();
		System.out.println("In DispatcherController.addQuestionsAnswers method");
		
		this.courseService.addQuestionsAnswers(questionsAnswers);
		List<QuestionsAnswers> listOfQnsAns =  this.courseService.getListOfQnsAns();
		model.addObject("listOfQnsAns",listOfQnsAns);
		
		System.out.println(listOfQnsAns);
		model.setViewName("QuestionsAnswers");
		return model;
		
	}
	

	
	

}
