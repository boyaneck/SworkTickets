package com.ticket.biz.exhibition.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ticket.biz.exhibition.ExhibitionVO;

public class ExhibitionRowMapper implements RowMapper<ExhibitionVO>{

	@Override
	public ExhibitionVO mapRow(ResultSet rs, int rowNum) throws SQLException {

		ExhibitionVO exhibition = new ExhibitionVO();
		exhibition.setExh_no(rs.getInt("exh_no"));
		exhibition.setExh_title(rs.getString("exh_title"));
		exhibition.setExh_price(rs.getInt("exh_price"));
		exhibition.setExh_st_date(rs.getDate("exh_st_date"));
		exhibition.setExh_end_date(rs.getDate("exh_end_date"));
		exhibition.setExh_rge_date(rs.getDate("exh_rge_date"));
		exhibition.setExh_mdf_date(rs.getDate("exh_mdf_date"));
		exhibition.setExh_location(rs.getString("exh_location"));
		exhibition.setExh_hall(rs.getString("exh_hall"));
		exhibition.setExh_content(rs.getString("exh_content"));
		exhibition.setExh_img(rs.getString("exh_img"));
		exhibition.setExh_planner(rs.getString("exh_planner"));
		exhibition.setExh_time(rs.getString("exh_time"));
		exhibition.setExh_rating(rs.getString("exh_rating"));
		exhibition.setExh_artist(rs.getString("exh_artist"));
		exhibition.setExh_place_x(rs.getFloat("exh_place_x"));
		exhibition.setExh_place_y(rs.getFloat("exh_place_y"));
		exhibition.setExh_local_name(rs.getString("exh_local_name"));

		return exhibition;
	}
}
