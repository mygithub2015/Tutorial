package com.project.tutorial.service;

import java.util.List;

import com.project.tutorial.model.Course;
import com.project.tutorial.model.QuestionsAnswers;

public interface CourseService {
	
	void addCourse(Course c);
	
	List<Course> getListOfCourses();
	
	void updateCourse(Course C);
	
	Course getCourseById(int courseId);
	
	void removeCourse(Course c);
	
	void addQuestionsAnswers(QuestionsAnswers qa);
	
	List<QuestionsAnswers> getListOfQnsAns();
	
	//get the list of questions and answers based on the courseId
	List<QuestionsAnswers> getListOfQnsAnsByCourseId(int courseId);

}
