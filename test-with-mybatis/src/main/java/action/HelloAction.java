package action;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;


import com.opensymphony.xwork2.ActionSupport;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Student;


public class HelloAction extends ActionSupport {
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String execute() throws SQLException, IOException {
		InputStream inputStream = Resources.getResourceAsStream("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();
		
		Student student = new Student();
		student.setName("Thien");
		student.setBranch("Q1");
		student.setEmail("Kaka@gmail.com");
		student.setPercentage(100);
		student.setPhone(123);
		session.insert("Student.insertStudent", student);
		
		session.commit();
		
		session.close();
		this.name = "Thien";
		return "success";
	}
}
