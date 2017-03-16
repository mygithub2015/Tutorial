package com.project.tutorial.model;

import java.util.List;

public class AnswerList {
	
	private List<UserAnswer> userAnswer;

	public List<UserAnswer> getUserAnswer() {
		return userAnswer;
	}

	public void setUserAnswer(List<UserAnswer> userAnswer) {
		this.userAnswer = userAnswer;
	}

	@Override
	public String toString() {
		return "AnswerList [userAnswer=" + userAnswer + "]";
	}

	

}
