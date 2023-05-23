package study;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import movie.MovieDAO;
import movie.MovieVO;

public class moveiAPI_study2 { 
	public static void main(String[] args) throws IOException { 
			
			String key = "02f126871d5a9b77294ae4bfaa67e3b3";
			String trailer_id = "";
			String trailer_key = "";
			
			MovieDAO dao = new MovieDAO();
			ArrayList<MovieVO> vos = dao.getAllMovieList();
			for(int i=0; i<vos.size(); i++) {
				MovieVO vo = vos.get(i);
		    try {
		    	URL url = new URL("https://api.themoviedb.org/3/search/movie?api_key="
		    			+ key + "&language=ko-KR"
		    			+"&query="
		    			+ URLEncoder.encode(vo.getTitle(), "UTF-8"));
		    	BufferedReader bf;
		    	bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
		    	String result = bf.readLine();
		    	
		    	JSONParser parser = new JSONParser();
					JSONObject obj = (JSONObject) parser.parse(result.toString());
					// {} 내에 있는 "results"를 가져옴 
					String data = obj.get("results").toString();
					//이걸 JSON Array로 변환 [] 
					JSONArray ResultArray = (JSONArray) parser.parse(data);
					//Data 내에 요소는 1개 밖에 없음...그 요소를 가져오고
					if(!ResultArray.isEmpty()) {
						String rYear = "0";
						for(int j=0; j<ResultArray.size(); j++) {
							JSONObject FinalObj = (JSONObject) ResultArray.get(j);
							if(FinalObj.get("release_date") == null || FinalObj.get("release_date")=="") break;
							rYear = ((String) FinalObj.get("release_date")).substring(0,4);	
							if(FinalObj.get("title")!=null && FinalObj.get("title").equals(vo.getTitle())&& rYear.equals(vo.getrYear()+"")) {
								trailer_id = FinalObj.get("id").toString();
								
								//id 구하고 바로 또!! 예고편 찾기 ㄱ 
								
								url = new URL("https://api.themoviedb.org/3/movie/"
										+ trailer_id
										+ "/videos?api_key=" + key 
										+ "&language=ko-KR");
								bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
								result = bf.readLine();
								
								parser = new JSONParser();
								obj = (JSONObject) parser.parse(result.toString());
								// {} 내에 있는 "Data"를 가져옴 
								data = obj.get("results").toString();
								//이걸 JSON Array로 변환 [] 
								ResultArray = (JSONArray) parser.parse(data);
								//Data 내에 요소는 1개 밖에 없음...그 요소를 가져오고
								if(!ResultArray.isEmpty()) {
									FinalObj = (JSONObject) ResultArray.get(0);
									trailer_key = FinalObj.get("key").toString();
									vo.setTrailerKey(trailer_key);
									dao.setMovieTrailer(vo);
								}
								
								
							}
						}
				
						}
					}
				 catch (ParseException e) {
					e.printStackTrace();
				}
			}

		}
	    

	}

