package com.project.tutorial.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.project.tutorial.model.AnswerList;
import com.project.tutorial.model.QuestionsAnswers;
import com.project.tutorial.model.QuestionsList;
import com.project.tutorial.model.UserAnswer;
import com.project.tutorial.service.CourseService;

@Controller
public class QuestionsAnswersController {

	private CourseService courseService;

	public QuestionsAnswersController() {
		System.out.println("In QuestionsAnswersController constructor...");
	}

	@Autowired(required = true)
	@Qualifier(value = "courseService")
	public void setCourseService(CourseService service) {
		this.courseService = service;
	}

	@RequestMapping(value = "/showQuestionsAnswers", method = RequestMethod.GET)
	public ModelAndView showQuestionsAnswers( HttpServletRequest request) {

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

		List<QuestionsAnswers> listOfQnsAns = this.courseService.getListOfQnsAns();
		
		/*AnswerList answerList  = (AnswerList) ((Model) model).asMap().get("answerList");*/
		
		//AnswerList answerList = null;
		
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		List<UserAnswer> listOfUserAnswers = null;
		if (flashMap != null) {
		//if(answerList == null)
		// answerList = new AnswerList();
			
			listOfUserAnswers = (List<UserAnswer>) flashMap.get("listOfUserAnswers");
		}

		questionsList.setListOfQnsAns(listOfQnsAns);

		model.addObject("questionList", questionsList);

		//model.addObject("answerList", answerList);
		
		//model.addObject("listOfUserAnswers", answerList.getUserAnswer());
		model.addObject("listOfUserAnswers", listOfUserAnswers);
		System.out.println("showQuestionsAnswers -  GET");
		//System.out.println(listOfUserAnswers);


		System.out.println(questionsList);

		model.setViewName("QuestionsAnswers");

		return model;

	}

	@RequestMapping(value = "/showQuestionsAnswers", method = RequestMethod.POST)
	public String showQuestionsAnswers(@ModelAttribute("answerList") AnswerList answerList,RedirectAttributes redirectAttributes) {

		for (UserAnswer userAnswer : answerList.getUserAnswer()) {

			System.out.println(userAnswer);
		}

		//request.setAttribute("ansList", answerList);
		/*ModelAndView model = new ModelAndView();
		model.addObject("questionList", questionList);
		model.addObject("answerList", answerList);

		return model;
		model.addObject("listOfUserAnswers", answerList.getUserAnswer());
		model.setViewName("showAnswers");
		
		new RedirectView("showAnswers")*/
		
		//ModelAndView model = new ModelAndView(new RedirectView("showQuestionsAnswers"));
		//model.addObject("answerList", answerList);
		//model.addObject("listOfUserAnswers", answerList.getUserAnswer());
		
		//redirectAttributes.addFlashAttribute("answerList", answerList);
		redirectAttributes.addFlashAttribute("listOfUserAnswers", answerList.getUserAnswer());
        return "redirect:/showQuestionsAnswers";
        
		//return "redirect:showQuestionsAnswers";
		
		//return model;

	}
	
	
	
	/*@RequestMapping(value = "/showAnswers", method = RequestMethod.GET)
	public String showAnswers(@RequestParam(value = "listOfUserAnswers", required = false) List<UserAnswer> listOfUserAnswers) {

		
		System.out.println("In showAnswers");
		System.out.println("listOfUserAnswers:"+listOfUserAnswers);
		
		
		return "ShowAnswers";

	}
*/
}
