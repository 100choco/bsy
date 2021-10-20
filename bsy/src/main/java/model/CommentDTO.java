package model;

public class CommentDTO {

	
	private int commentNum;
	private String commentWriter;
	private String commentContent;
	private String commentRegDate;
	private int boardNum;
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	
	public String getCommentWriter() {
		return commentWriter;
	}
	
	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}
	
	public String getCommentContent() {
		return commentContent;
	}
	
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	
	public String getCommentRegDate() {
		return commentRegDate;
	}
	
	public void setCommentRegDate(String commentRegDate) {
		this.commentRegDate = commentRegDate;
	}
	
	public int getBoardNum() {
		return boardNum;
	}
	
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	
	@Override
	public String toString() {
		return "CommentDTO [commentNum=" + commentNum + ", commentWriter=" + commentWriter + ", commentContent="
				+ commentContent + ", commentRegDate=" + commentRegDate + ", boardNum=" + boardNum + "]";
	}
	
}
