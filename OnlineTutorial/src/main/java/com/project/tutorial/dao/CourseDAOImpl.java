package com.project.tutorial.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.project.tutorial.model.Course;

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
		return null;
	}

	public void removeCourse(Course c) {
		// TODO Auto-generated method stub
		
	}

}
