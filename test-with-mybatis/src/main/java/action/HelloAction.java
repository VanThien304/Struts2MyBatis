package action;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;


import java.util.HashMap;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import model.Student;

public class HelloAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	private String branch;
	private int percentage;
	private int phone;
	private String email;
	private String message;
	private ArrayList<Student> students;

	private Student student;

	private Map<String, String> username = new HashMap<>();

	public String loginAction() {

		username.put("name", "email");
		username.put("admin", "admin123");
		username.put("Blue", "thien.phanvan9846@gmail.com");
		return "success";
	}

	@Override
	public void validate() {

		super.validate();
		if (getName().length() == 0) {
			addFieldError("name", "Name is required!");

		}
		if (getEmail().length() == 0) {
			addFieldError("email", getText("Email is required!"));
		}
	}

	public String execute() throws SQLException, IOException {
		InputStream inputStream = Resources.getResourceAsStream("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession session = sqlSessionFactory.openSession();

		student = new Student(name, branch, percentage, phone, email);
		session.insert("Student.insertStudent", student);

		session.commit();
		session.close();

		return "success";
	}

	public String getAllStudent() throws SQLException, IOException {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sqlSessionFactory.openSession();

		// select contact all contacts
		students = (ArrayList) session.selectList("Student.getAll");

		System.out.println("Records Read Successfully ");
		session.commit();
		session.close();
		return "success";
	}

	public String getStudentById() throws SQLException, IOException {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sqlSessionFactory.openSession();

		// select a particular student by id
		student = session.selectOne("Student.getById", id);

		// Print the student details
		System.out.println(student.getId());
		System.out.println(student.getName());
		System.out.println(student.getBranch());
		System.out.println(student.getPercentage());
		System.out.println(student.getEmail());
		System.out.println(student.getPhone());

		session.commit();
		session.close();
		return "success";
	}

	public String loginNameAndEmail() throws SQLException, IOException {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sqlSessionFactory.openSession();

//		 Print the student details
		student = session.selectOne("Student.getLogin", loginAction());

		System.out.println(student.getName());
		System.out.println(student.getEmail());

		session.commit();
		session.close();

		return "success";

	}

	public String updateStudentById() throws SQLException, IOException {
		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession session = sqlSessionFactory.openSession();

		// select a particular student using id
		student = session.selectOne("Student.getById", 1);
		System.out.println("Current details of the student are");
		System.out.println(student.toString());

		// Set new values to the mail and phone number of the student
		student.setName(name);
		student.setBranch(branch);
		student.setPercentage(percentage);
		student.setEmail(email);
		student.setPhone(phone);

		// Update the student record
		session.update("Student.update", student);
		System.out.println("Record updated successfully");
		session.commit();
		session.close();

		// verifying the record
		Student std = session.selectOne("Student.getById", 1);
		System.out.println("Details of the student after update operation");
		System.out.println(std.toString());
		session.commit();
		session.close();
		return "success";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public int getPercentage() {
		return percentage;
	}

	public void setPercentage(int percentage) {
		this.percentage = percentage;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public ArrayList<Student> getStudents() {
		return students;
	}

	public void setStudents(ArrayList<Student> students) {
		this.students = students;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, String> getUsername() {
		return username;
	}

	public void setUsername(Map<String, String> username) {
		this.username = username;
	}

}
