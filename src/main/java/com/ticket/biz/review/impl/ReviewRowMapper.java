package com.ticket.biz.review.impl;


import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ticket.biz.review.ReviewVO;

public class ReviewRowMapper implements RowMapper<ReviewVO>{

	@Override
	public ReviewVO mapRow(ResultSet rs, int rowNum) throws SQLException{
	ReviewVO review = new ReviewVO();
	review.setReview_no(rs.getInt("review_no"));
	review.setExh_no(rs.getInt("exh_no"));
	review.setReview_bno(rs.getInt("review_bno"));
	review.setReview_writer(rs.getString("review_writer"));
	review.setReview_content(rs.getString("review_content"));
	
	review.setReview_reg_date(rs.getTimestamp("review_reg_date"));
	




		return review;
	}

}