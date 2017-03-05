package com.project.tutorial.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.project.tutorial.model.Course;
import com.project.tutorial.model.QuestionsAnswers;

public class CourseDAOImpl implements CourseDAO{
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	public List<Course> getCourses() {
		// TODO Auto-generated method stub
		
		Session session = this.sessionFactory.getCurrentSession();
		
		List<Course> listOfCourses = session.createQuery("from Course").list();
		
		System.out.println("listOfCourses: "+listOfCourses);
		
		return listOfCourses;
	}

	public void addCourse(Course c) {
		
		System.out.println(c);
		
		Session session = this.sessionFactory.getCurrentSession();
		
		//session.save(c);
		session.persist(c);

		
	}

	public void updateCourse(Course c) {
		
		System.out.println("In DAO to update the course");
		
		Session session = this.sessionFactory.getCurrentSession();
		
		session.update(c);
		
	}

	public Course getCourseById(int courseId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Course c = (Course) session.get(Course.class, courseId);
		return c;
	}

	public void removeCourse(Course c) {
		// TODO Auto-generated method stub
		
	}

	public void addQuestionsAnswers(QuestionsAnswers qa) throws HibernateException{
		
		try{
			System.out.println("In CourseDaoImpl.addQuestionsAnswers, qa as "+qa);
			
			Session session = this.sessionFactory.getCurrentSession();
			
			session.persist(qa);
		}catch(HibernateException he){
			System.out.println("some exception data didnot get saved");
			he.printStackTrace();
		}
		
	}

	public List<QuestionsAnswers> getListOfQnsAns() {
		// TODO Auto-generated method stub
		List<QuestionsAnswers> listOfQnsAns = null;
		try{
			System.out.println("In CourseDaoImpl.getListOfQnsAns");
			
			Session session = this.sessionFactory.getCurrentSession();
			
			listOfQnsAns = session.createQuery("from QuestionsAnswers").list();
			
			System.out.println("listOfQnsAns: "+listOfQnsAns);
			
			return listOfQnsAns;
			
			
		}catch(HibernateException he){
			System.out.println("some exception data didnot get saved");
			he.printStackTrace();
		}
		return listOfQnsAns;
		
	}

}
