package kr.ac.lms.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.lms.service.WeatherService;
import kr.ac.lms.vo.WeatherVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/weather")
@Controller
public class WeatherController {
	
	@Autowired
	WeatherService weatherService;
	
	@GetMapping("/sample")
	public String sample() {
		
		return "weather/sample";
	}
	
	@ResponseBody
	@PostMapping("/getWeather")
	public WeatherVO getWeather(@RequestBody Map<String, Object> map) {
		
		//log.info("가져올 날씨의 날짜 및 시간 정보 :  " + map);
		
		WeatherVO weather = this.weatherService.getWeather(map);
		
		if(weather==null) {
			weather = new WeatherVO();
			weather.setWtCd(1);
			weather.setWtDt(99999999);
			weather.setWtTm("00");
		}else {
			//log.info(weather.toString());
		}
		
		return weather;
	}
	
	@ResponseBody
	@GetMapping("/updateWeather")
	public WeatherVO updateWeather() throws IOException, ParseException {
		
		WeatherVO weatherVO = new WeatherVO();
		Map<String, Object> map = new HashMap<String, Object>();
		
		//날짜 정하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
		
		Date date = new Date();
		String today = sdf.format(date);
		String hour = new SimpleDateFormat("hh", Locale.KOREA).format(date); //09
		//log.info("0이 포함된 hour : " + hour);
		int hourNum = Integer.valueOf(hour, 10); //9
		//log.info("10진수 int로 변환한 hour : " + hourNum);
		int minute = Integer.parseInt(new SimpleDateFormat("mm", Locale.KOREA).format(date));
		
		if(30 <= minute  || minute < 60) {
			hourNum += 1;
			//log.info("10진수 int로 변환한 hour + 1 : " + hourNum);
		}
		hour = String.format("%02d", hourNum);
		//log.info("숫자를 2자리, 공백은 0으로 채우기 : " + hour);
		map.put("wtDt", today);
		map.put("wtTm", hour + "00");
		//log.info("가공한 map : " + map);
		
		//어제 날짜 정하기 (기상청에 어제 밤 11시 정보를 불러오므로)
		date = new Date(date.getTime() + (1000*60*60*24*-1));
		String yesterday = sdf.format(date);
		
		//기상청에서 날씨 정보 JSON으로 불러오기
		String serviceKey = "v%2FPaRr%2FEAhd8%2FJejWlpi%2BFD1OZkZ4N0gT6CqoMYJ3sP86Sbr2G5n5%2BfaIwX1VF08OULTnyqGbaZUPJYNfDdJbg%3D%3D";
		String nx = "36";	//위도
		String ny = "127";	//경도
		String baseDate = yesterday;	//조회하고 싶은 날짜
		String baseTime = "2300";	//조회하고 싶은 시간
		String numOfRows = "291"; //length
        	
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(baseDate, "UTF-8")); /*21년 6월 28일발표*/
        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(baseTime, "UTF-8")); /*05시 발표*/
        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); /*예보지점의 X 좌표값*/
        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); /*예보지점의 Y 좌표값*/
        
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        rd.close();
        conn.disconnect();
        String result = sb.toString();
        System.out.println(result);
 		
        if(result != null) {
        	
        	//JSON을 parsing해서 DB에 넣기
        	//result.response.body.items.item
        	JSONParser parser = new JSONParser();
        	JSONObject obj = (JSONObject)parser.parse(result);
        	obj = (JSONObject)obj.get("response");
        	obj = (JSONObject)obj.get("body");
        	obj = (JSONObject)obj.get("items");
        	
        	//items로부터 item list를 받아야 하므로 JSONArray
        	JSONArray item = (JSONArray)obj.get("item");
        	JSONObject weather;
        	
        	String category;
        	String day;
        	String time = "0000";
        	WeatherVO wtVO = new WeatherVO();
        	
        	for(int i = 0; i < item.size(); i++) {
        		weather = (JSONObject)item.get(i);
        		category = (String)weather.get("category");
        		Object fcstDate = weather.get("fcstDate");
        		String fcstTime = (String)weather.get("fcstTime");
        		Object fcstValue = weather.get("fcstValue");
        		
        		if(!time.equals(fcstTime.toString())) { //시간이 바뀔 경우
        			log.info(wtVO.toString());
        			this.weatherService.updateWeather(wtVO);
        			
        			time = fcstTime; //시간값을 다시 넣어주고
        			wtVO = new WeatherVO(); //WeatherVO를 재생성
        		}
        		
        		wtVO.setWtDt(Integer.parseInt((String)fcstDate)); //20220927
        		wtVO.setWtTm(fcstTime); //0900
        		if(category.equals("POP")) { //강수확률
        			wtVO.setWtPop(Double.parseDouble((String)fcstValue));
        		}else if(category.equals("PTY")) { //강수형태
        			wtVO.setWtPty(Integer.parseInt((String)fcstValue));
        		}else if(category.equals("REH")) { //습도
        			wtVO.setWtReh(Double.parseDouble((String)fcstValue));
        		}else if(category.equals("SKY")) { //하늘상태
        			wtVO.setWtSky(Integer.parseInt((String)fcstValue));
        		}else if(category.equals("VEC")) { //풍향
        			wtVO.setWtVec(Integer.parseInt((String)fcstValue));
        		}else if(category.equals("WSD")) { //풍속
        			wtVO.setWtWsd(Double.parseDouble((String)fcstValue));
        		}else if(category.equals("PCP")) { //1시간 강수량
        			wtVO.setWtPcp((String)fcstValue);
        		}else if(category.equals("SNO")) { //1시간 신적설
        			wtVO.setWtSno((String)fcstValue);
        		}else if(category.equals("TMP")) { //3시간 기온
        			wtVO.setWtTmp(Double.parseDouble((String)fcstValue));
        		}
        	}
        	
        	//현재 시간에 맞는 WeatherVO를 보내주기
        	weatherVO = this.weatherService.getWeather(map);
        	
        }else {//result가 null인 경우
        	//log.info("기상청 데이터 안 온 경우");
        	
        	weatherVO.setWtCd(1);
        	weatherVO.setWtDt(99999999);
        	weatherVO.setWtTm("00");
        }
 		
 		return weatherVO;
	}
}