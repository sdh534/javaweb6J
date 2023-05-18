package study;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException; 

public class moveiAPI_study1 { 
	
	public static void main(String[] args) throws IOException {
		
		long start = System.currentTimeMillis();
		BufferedReader rd = null;
		HttpURLConnection conn = null;
		StringBuilder sb = new StringBuilder();
		int pageCnt = 0;
		String str = "";
		
		for(int j=0; j<3; j++) { //총 12898건 -> 13000개 가져와야함 
			StringBuilder urlBuilder = new StringBuilder("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2"); /*URL*/ 
			urlBuilder.append("&" + "ServiceKey=W33FBFR1XCLECPF79NER"); /*Service Key*/ 
			urlBuilder.append("&" + "listCount=100");  
			urlBuilder.append("&" + "use="+ URLEncoder.encode("극장용", "UTF-8")); /* 극장 상영 영화만*/ 
			urlBuilder.append("&" + "releaseDts=20000101"); /* 2000년도 이후 영화만 */ 
			urlBuilder.append("&" + "ratedYn="+ URLEncoder.encode("Y", "UTF-8")); /* 심의 통과된 영화만*/
			urlBuilder.append("&" + "startCount=" + pageCnt+(j*100)); /* 페이지 1부터 */ 
			
			URL url = new URL(urlBuilder.toString());
	    conn = (HttpURLConnection) url.openConnection();
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Content-type", "application/json");
//	    System.out.println("Response code: " + conn.getResponseCode());
	    if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	        rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
	    } else {
	        rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	    }
	    String line;
	    while ((line = rd.readLine()) != null) {
	        sb.append(line);
	    }
	    
	    JSONParser parser = new JSONParser();
	    try {
	    	
				JSONObject obj = (JSONObject) parser.parse(sb.toString());
				String data = obj.get("Data").toString();
				
				JSONArray ResultArray = (JSONArray) parser.parse(data);
				JSONObject FinalObj = (JSONObject) ResultArray.get(0);
				String FinalResult = FinalObj.get("Result").toString();
				JSONArray movieArray = (JSONArray) parser.parse(FinalResult);
				
				for(int i=0; i<movieArray.size(); i++) {
					JSONObject movie = (JSONObject) movieArray.get(i);
					str += movie.get("title") + "(" + movie.get("prodYear")+")  | " + movie.get("posters")  
					+ movie.get("nation")  + "  |  "   +  movie.get("genre");
				}
				
				
				
				sb.setLength(0);
				rd.close();
				conn.disconnect();
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
    long end = System.currentTimeMillis();

		} 
	}
