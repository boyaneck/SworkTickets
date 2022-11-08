package com.ticket.biz.one.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ticket.biz.one.OneVO;

public class OneRowMapper implements RowMapper<OneVO>{

	@Override
	public OneVO mapRow(ResultSet rs, int rowNum) throws SQLException{
	OneVO one = new OneVO();
	one.setOne_no(rs.getInt("one_no"));
	one.setOne_writer(rs.getString("one_writer"));
	one.setOne_content(rs.getString("one_content"));
	one.setOne_date(rs.getDate("one_date"));
	one.setOne_category(rs.getString("one_category"));
	one.setOne_modify(rs.getDate("one_modify"));
	one.setOne_secret(rs.getBoolean("one_secret"));
	one.setOne_answer(rs.getString("one_answer"));

		return one;
	}





}
