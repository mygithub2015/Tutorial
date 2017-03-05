package com.project.tutorial.model;

public class QuestionsAnswers {

	// fields

	private int questionId;

	//private Course course;
	
	private int courseId;

	private String question;

	private String optionA;

	private String optionB;

	private String optionC;

	private String optionD;

	private String answer;

	private String explanations;

	private String relatedLinks;

	// getters and setters

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public String getQuestion() {
		return question;
	}

	/*public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}
*/
	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	
	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getOptionA() {
		return optionA;
	}

	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}

	public String getOptionB() {
		return optionB;
	}

	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}

	public String getOptionC() {
		return optionC;
	}

	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}

	public String getOptionD() {
		return optionD;
	}

	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}

	public String getExplanations() {
		return explanations;
	}

	public void setExplanations(String explanations) {
		this.explanations = explanations;
	}

	public String getRelatedLinks() {
		return relatedLinks;
	}

	public void setRelatedLinks(String relatedLinks) {
		this.relatedLinks = relatedLinks;
	}
	
	@Override
	public String toString() {
		return "QuestionsAnswers [questionId=" + questionId + ", courseId=" + courseId
				+ ", question=" + question + ", optionA=" + optionA + ", optionB=" + optionB + ", optionC=" + optionC
				+ ", optionD=" + optionD + ", answer=" + answer + ", explanations=" + explanations + ", relatedLinks="
				+ relatedLinks + "]";
	}


}
