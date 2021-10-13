package model;

public class BoardDTO {
	private int num;
	private String title;
	private String content;
	private String boardWriter;
	private String boardWriterPassword;
	private String regDate;
	private String views;
	
	
	
	

	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(int num, String title, String content, String boardWriter, String regDate, String views) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.boardWriter = boardWriter;
		this.regDate = regDate;
		this.views = views;
	}

	public String getViews() {
		return views;
	}

	public void setViews(String views) {
		this.views = views;
	}

	public int getNum() {
		return num;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getBoardWriter() {
		return boardWriter;
	}
	
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	
	public String getBoardWriterPassword() {
		return boardWriterPassword;
	}
	
	public void setBoardWriterPassword(String boardWriterPassword) {
		this.boardWriterPassword = boardWriterPassword;
	}
	
	public String getRegDate() {
		return regDate;
	}
	
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", title=" + title + ", content=" + content + ", boardWriter=" + boardWriter
				+ ", boardWriterPassword=" + boardWriterPassword + ", regDate=" + regDate + ", views=" + views + "]";
	}
	
	
	
	
}
