package com.ticket.biz.pay.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ticket.biz.pay.PayVO;

public class PayRowMapper implements RowMapper<PayVO> {


	@Override
	public PayVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		PayVO pay = new PayVO();
		pay.setBuyer(rs.getString("buyer"));
		pay.setBuyer_email(rs.getString("buyer_email"));
		pay.setBuyer_tel(rs.getString("buyer_tel"));
		pay.setExh_title(rs.getString("exh_title"));
		pay.setMb_id(rs.getString("mb_id"));
		pay.setP_date(rs.getString("p_date"));
		pay.setP_id(rs.getString("p_id"));
		pay.setP_mer(rs.getString("p_mer"));

		return pay;
	}

}
