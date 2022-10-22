package kr.ac.lms.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.ReservationMapper;
import kr.ac.lms.service.ReservationService;
import kr.ac.lms.vo.FacilityVO;
import kr.ac.lms.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationMapper reservationMapper;
	

	@Override
	public List<FacilityVO> facility() {
		return reservationMapper.facility();
	}

	@Override
	public int insert(ReservationVO vo) {
		return reservationMapper.insert(vo);
	}

	@Override
	public List<ReservationVO> list(String facCd) {
		return reservationMapper.list(facCd);
	}

	@Override
	public int delete(ReservationVO vo) {
		return reservationMapper.delete(vo);
	}

	@Override
	public int modify(HashMap<String, Object> map) {
		return reservationMapper.modify(map);
	}

	@Override
	public List<HashMap<String,Object>> history(ReservationVO vo) {
		return reservationMapper.history(vo);
	}


}
