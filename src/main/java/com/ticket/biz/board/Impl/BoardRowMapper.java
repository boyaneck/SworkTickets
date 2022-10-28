package com.ticket.biz.board.Impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ticket.biz.board.BoardVO;

public class BoardRowMapper implements RowMapper<BoardVO>{

	@Override
	public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException{
	BoardVO board = new BoardVO();
	board.setNoti_no(rs.getInt("noti_no"));
	board.setNoti_writer(rs.getString("noti_writer"));
	board.setNoti_content(rs.getString("noti_content"));
	board.setNoti_date(rs.getDate("noti_date"));
	board.setNoti_category(rs.getString("noti_category"));
	board.setNoti_modify(rs.getDate("noti_modify"));
	board.setNoti_secret(rs.getBoolean("noti_secret"));
	
		return board;
	}
	
	

	
	
}
