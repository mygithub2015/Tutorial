package com.project.tutorial.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.tutorial.model.Course;
import com.project.tutorial.service.CourseService;

@Controller

public class SelectCourseController  {
	
	private CourseService courseService;
	
	

	@Autowired(required = true)
	@Qualifier(value = "courseService")
	public void setCourseService(CourseService service) {
		this.courseService = service;
	}
	
	@RequestMapping(value = "/getQuestionsAsPerCourse", method = RequestMethod.GET)
	public String getTheQuestionsByCourse(@RequestParam("courseId") Integer courseId, @ModelAttribute("course") Course course, BindingResult result, RedirectAttributes redirectAttributes) {

	
		System.out.println("getQuestionsAsPerCourse");
		//ModelAndView mav = new ModelAndView();
		System.out.println("courseId: "+courseId);
		Course c = this.courseService.getCourseById(courseId);
		System.out.println(c);
		//mav.addObject("queAnsList", this.courseService.getListOfQnsAnsByCourseId(courseId));
		//mav.setViewName("redirect:/showQuestionsAnswers");
		
		redirectAttributes.addFlashAttribute("queAnsList",  this.courseService.getListOfQnsAnsByCourseId(courseId));
		
		return "redirect:/showQuestionsAnswers";
		
		
	}
	@RequestMapping(value = "/selectCourse", method = RequestMethod.GET)
	public ModelAndView selectCourse(){
		
		ModelAndView mav = new ModelAndView();
		/*mav.addObject("courseList", this.courseService.getListOfCourses());*/
		mav.addObject("course", new Course());
		mav.setViewName("SelectCourse");
		return mav;
	}
	

}
