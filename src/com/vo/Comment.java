package com.vo;

import java.util.Date;

/**
 * Comment entity. @author MyEclipse Persistence Tools
 */

public class Comment implements java.io.Serializable {

	// Fields

	private CommentId id;
	private String comment;
	private Date commentdate;
	private String sellerreplay;

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** minimal constructor */
	public Comment(CommentId id) {
		this.id = id;
	}

	/** full constructor */
	public Comment(CommentId id, String comment, Date commentdate,
			String sellerreplay) {
		this.id = id;
		this.comment = comment;
		this.commentdate = commentdate;
		this.sellerreplay = sellerreplay;
	}

	// Property accessors

	public CommentId getId() {
		return this.id;
	}

	public void setId(CommentId id) {
		this.id = id;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getCommentdate() {
		return this.commentdate;
	}

	public void setCommentdate(Date commentdate) {
		this.commentdate = commentdate;
	}

	public String getSellerreplay() {
		return this.sellerreplay;
	}

	public void setSellerreplay(String sellerreplay) {
		this.sellerreplay = sellerreplay;
	}

}