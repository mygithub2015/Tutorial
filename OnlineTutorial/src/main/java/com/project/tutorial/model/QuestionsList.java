package com.project.tutorial.model;

import java.util.List;

public class QuestionsList {
	
	List<QuestionsAnswers> listOfQnsAns;

	public List<QuestionsAnswers> getListOfQnsAns() {
		return listOfQnsAns;
	}

	public void setListOfQnsAns(List<QuestionsAnswers> listOfQnsAns) {
		this.listOfQnsAns = listOfQnsAns;
	}

	@Override
	public String toString() {
		return "QuestionsList [listOfQnsAns=" + listOfQnsAns + "]";
	}
	
	
	

}
