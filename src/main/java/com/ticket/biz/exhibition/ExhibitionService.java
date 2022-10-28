package com.ticket.biz.exhibition;

import java.util.List;


public interface ExhibitionService {
	// CRUD 기능의 메소드 구현
			// 전시 등록
			void insertExhibition(ExhibitionVO vo);

			// 전시 수정
			void updateExhibition(ExhibitionVO vo);

			// 전시 삭제
			void deleteExhibition(ExhibitionVO vo);

			// 전시 상세 조회
			ExhibitionVO getExhibition(ExhibitionVO vo);

			// 전시 목록 조회
			List<ExhibitionVO> getExhibitionList(ExhibitionVO vo);

			// 전시 목록 개수 조회
			int totalExhibitionListCnt(ExhibitionVO vo);

			// 유저 전시 목록 조회
			List<ExhibitionVO> getUserExhibitionList(ExhibitionVO vo);

			// 유저 전시 목록 개수 조회
			int totalUSerExhibitionListCnt(ExhibitionVO vo);

	}