package com.ticket.biz.exhibition.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticket.biz.exhibition.ExhibitionService;
import com.ticket.biz.exhibition.ExhibitionVO;

@Service("exhibitionService")
public class ExhibitionServiceImpl implements ExhibitionService {

	@Autowired
	private ExhibitionDAO exhibitionDAO;

	@Override
	public void insertExhibition(ExhibitionVO vo) {
		exhibitionDAO.insertExhibition(vo);
	}

	@Override
	public void updateExhibition(ExhibitionVO vo) {
		exhibitionDAO.updateExhibition(vo);
	}

	@Override
	public void deleteExhibition(ExhibitionVO vo) {
		exhibitionDAO.deleteExhibition(vo);
	}

	@Override
	public ExhibitionVO getExhibition(ExhibitionVO vo) {
		return exhibitionDAO.getExhibition(vo);
	}

	@Override
	public List<ExhibitionVO> getExhibitionList(ExhibitionVO vo) {
		return exhibitionDAO.getExhibitionList(vo);
	}

	@Override
	public int totalExhibitionListCnt(ExhibitionVO vo) {
		return exhibitionDAO.totalExhibitionListCnt(vo);
	}

	@Override
	public List<ExhibitionVO> getUserExhibitionList(ExhibitionVO vo) {
		return exhibitionDAO.getUserExhibitionList(vo);
	}

	@Override
	public int totalUSerExhibitionListCnt(ExhibitionVO vo) {
		return exhibitionDAO.totalUserExhibitionListCnt(vo);
	}

}
