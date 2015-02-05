package homework;

public class peopleBean {
	public static final int PAGE_SIZE = 2;
	private int id;
	private String name;
	private String password;
	private String email;
	private String degree;
	private String pushInfo;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getPushInfo() {
		return pushInfo;
	}
	public void setPushInfo(String pushInfo) {
		this.pushInfo = pushInfo;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	

}
