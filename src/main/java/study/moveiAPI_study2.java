package study;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class moveiAPI_study2 { 
	public static void main(String[] args) throws IOException { 
		long start = System.currentTimeMillis();
		String result = "";
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));	
		try{
			
				String apiURL = "https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=W33FBFR1XCLECPF79NER&listCount=10&ratedYn=Y&releaseDts=20000101"
						+ URLEncoder.encode("극장용", "UTF-8");
				URL url = new URL(apiURL);
				
				BufferedReader bf;
				bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
	
				bf.readLine();
				result += bf.readLine();
				System.out.println(result);
			long end = System.currentTimeMillis();
			System.out.println( "실행 시간 : " + ( end - start )/1000.0 +"초");
		} catch(Exception e){
			e.printStackTrace();
		}
		
		} 
	}
