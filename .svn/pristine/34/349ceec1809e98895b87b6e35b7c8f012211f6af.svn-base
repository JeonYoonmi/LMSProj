package kr.ac.lms.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.WeatherMapper;
import kr.ac.lms.service.WeatherService;
import kr.ac.lms.vo.WeatherVO;

@Service
public class WeatherServiceImpl implements WeatherService {
	
	@Autowired
	WeatherMapper weatherMapper;

	//오늘 날씨 정보 가져오기
	@Override
	public WeatherVO getWeather(Map<String, Object> map) {
		return this.weatherMapper.getWeather(map);
	}

	//날씨 정보 저장하기
	@Override
	public int updateWeather(WeatherVO weatherVO) {
		return this.weatherMapper.updateWeather(weatherVO);
	}
}
