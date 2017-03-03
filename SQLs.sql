create database tutorial;

use tutorial;


select * from courses;



desc courses;

use tutorial;

#drop table course;

select * from courses;

#create table Courses script
CREATE TABLE `Courses` (
  `course_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `course_name` varchar(20) NOT NULL DEFAULT '',
   PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;