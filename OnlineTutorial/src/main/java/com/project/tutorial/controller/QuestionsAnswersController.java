package com.project.tutorial.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.support.RequestContextUtils;

import com.project.tutorial.model.AnswerList;
import com.project.tutorial.model.Course;
import com.project.tutorial.model.QuestionsAnswers;
import com.project.tutorial.model.QuestionsList;
import com.project.tutorial.model.UserAnswer;
import com.project.tutorial.service.CourseService;

@Controller
public class QuestionsAnswersController {

	private CourseService courseService;
	private Integer courseId;

	public QuestionsAnswersController() {
		System.out.println("In QuestionsAnswersController constructor...");
	}

	@Autowired(required = true)
	@Qualifier(value = "courseService")
	public void setCourseService(CourseService service) {
		this.courseService = service;
	}
	
	@RequestMapping(value = "/showQuestionsAnswers", method = RequestMethod.GET)
	public ModelAndView showQuestionsAnswers(HttpServletRequest request) {

		/*
		 * int courseId = qa.getCourseId();
		 * 
		 * Course c = this.courseService.getCourseById(courseId);
		 * 
		 * qa.setCourse(c);
		 */
		ModelAndView model = new ModelAndView();
		System.out.println("In DispatcherController.showQuestionsAnswers method");
		

		
		QuestionsList	questionsList = new QuestionsList();

		/*List<QuestionsAnswers> listOfQnsAns = this.courseService.getListOfQnsAns();*/
		
		/*AnswerList answerList  = (AnswerList) ((Model) model).asMap().get("answerList");*/
		
		//AnswerList answerList = null;
		
		
		
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		List<UserAnswer> listOfUserAnswers = null;
		List<QuestionsAnswers> listOfQueAns = null;
		
		Integer passedCourseId = null;
		if (flashMap != null) {
		//if(answerList == null)
		// answerList = new AnswerList();
			
			listOfUserAnswers = (List<UserAnswer>) flashMap.get("listOfUserAnswers");
			passedCourseId = (Integer) flashMap.get("courseId");
			
			
		}
		if(this.courseId == null || (passedCourseId != null && this.courseId.intValue() != passedCourseId.intValue() )){
			System.out.println("updating the course id with passedCourseId: "+passedCourseId);
			this.courseId = passedCourseId;
		}
		listOfQueAns = this.courseService.getListOfQnsAnsByCourseId(this.courseId);
		questionsList.setListOfQnsAns(listOfQueAns);

		model.addObject("questionList", questionsList);
		
		System.out.println("questionList: "+questionsList);

		//model.addObject("answerList", answerList);
		
		//model.addObject("listOfUserAnswers", answerList.getUserAnswer());
		model.addObject("listOfQueAns", listOfQueAns);
		model.addObject("listOfUserAnswers", listOfUserAnswers);
		System.out.println("showQuestionsAnswers -  GET");
		//System.out.println(listOfUserAnswers);
		model.addObject("listCourses", this.courseService.getListOfCourses());

		System.out.println(questionsList);

		model.setViewName("QuestionsAnswers");

		return model;

	}

	@RequestMapping(value = "/showQuestionsAnswers", method = RequestMethod.POST)
	public String showQuestionsAnswers(@ModelAttribute("questionList") QuestionsList questionList, @ModelAttribute("answerList") AnswerList answerList,RedirectAttributes redirectAttributes) {

		for (UserAnswer userAnswer : answerList.getUserAnswer()) {

			System.out.println(userAnswer);
		}

	
		redirectAttributes.addFlashAttribute("listOfUserAnswers", answerList.getUserAnswer());
		
        return "redirect:/showQuestionsAnswers";
        
		

	}
	
	
}
