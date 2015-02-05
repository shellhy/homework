package homework;

public class article {
	public static final int PAGE_SIZE = 3;
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getUpload() {
		return upload;
	}
	public void setUpload(String upload) {
		this.upload= upload;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	private String name;
	private String author;
	private String upload;
	private String context;
	

}
