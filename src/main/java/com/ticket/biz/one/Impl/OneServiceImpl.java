package com.ticket.biz.one.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticket.biz.one.OneService;
import com.ticket.biz.one.OneVO;

@Service("oneService")
public class OneServiceImpl implements OneService{

	@Autowired
	private OneDAOMybatis oneDAO;

	@Override
	public void insertOne(OneVO vo) {
		oneDAO.insertOne(vo);
	}

	@Override
	public void deleteOne(OneVO vo) {
		oneDAO.deleteOne(vo);
	}

	@Override
	public void updateOne(OneVO vo) {
		oneDAO.updateOne(vo);
	}

	@Override
	public OneVO getOne(OneVO vo) {
		return oneDAO.getOne(vo);
	}

	@Override
	public List<OneVO> getOneList(OneVO vo) {
		return oneDAO.getOneList(vo);
	}

	@Override
	public int totalOneListCnt(OneVO vo) {
		return oneDAO.totalOneListCnt(vo);
	}
	
	@Override
	public void doAnswer(OneVO vo) {
		oneDAO.doAnswer(vo);
	}
}
