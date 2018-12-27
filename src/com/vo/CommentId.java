package com.vo;

/**
 * CommentId entity. @author MyEclipse Persistence Tools
 */

public class CommentId implements java.io.Serializable {

	// Fields

	private Order order;
	private User user;

	// Constructors

	/** default constructor */
	public CommentId() {
	}

	/** full constructor */
	public CommentId(Order order, User user) {
		this.order = order;
		this.user = user;
	}

	// Property accessors

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CommentId))
			return false;
		CommentId castOther = (CommentId) other;

		return ((this.getOrder() == castOther.getOrder()) || (this.getOrder() != null
				&& castOther.getOrder() != null && this.getOrder().equals(
				castOther.getOrder())))
				&& ((this.getUser() == castOther.getUser()) || (this.getUser() != null
						&& castOther.getUser() != null && this.getUser()
						.equals(castOther.getUser())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getOrder() == null ? 0 : this.getOrder().hashCode());
		result = 37 * result
				+ (getUser() == null ? 0 : this.getUser().hashCode());
		return result;
	}

}