package study;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import movie.MovieDAO;

public class moveiAPI_study2 { 
	public static void main(String[] args) throws IOException { 
		BufferedReader rd = null;
		HttpURLConnection conn = null;
		StringBuilder sb = new StringBuilder();
			
		
		StringBuilder urlBuilder = new StringBuilder("https://api.themoviedb.org/3/search/movie?"); /*URL*/ 
			urlBuilder.append("&" + "api_key=02f126871d5a9b77294ae4bfaa67e3b3"); /*Service Key*/ 
			urlBuilder.append("&" + "language=ko-KR"); /*Service Key*/ 
			urlBuilder.append("&" + "query=인터스텔라"); /* 1980년도 이후 영화만 */ 
			
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
				// {} 내에 있는 "Data"를 가져옴 
				String data = obj.get("results").toString();
				//이걸 JSON Array로 변환 [] 
				JSONArray ResultArray = (JSONArray) parser.parse(data);
				//Data 내에 요소는 1개 밖에 없음...그 요소를 가져오고
				JSONObject FinalObj = (JSONObject) ResultArray.get(0);
				//그 안에서 Result를 가져옴 이녀석도 JSON Object 
				
				System.out.println(FinalObj);
				
				rd.close();
				conn.disconnect();
			} catch (ParseException e) {
				e.printStackTrace();
			}


	}
}
