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

import movie.MovieDAO;
import movie.MovieVO;

public class moveiAPI_study2 { 
	public static void main(String[] args) throws IOException { 
		MovieDAO dao = new MovieDAO();
		long start = System.currentTimeMillis();
		BufferedReader rd = null;
		HttpURLConnection conn = null;
		StringBuilder sb = new StringBuilder();
		int pageCnt = 0;
		String str = "";
		for(int j=0; j<5; j++) { //총 17391건 
			StringBuilder urlBuilder = new StringBuilder("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2"); /*URL*/ 
			urlBuilder.append("&" + "ServiceKey=W33FBFR1XCLECPF79NER"); /*Service Key*/ 
			urlBuilder.append("&" + "ratedYn="+ URLEncoder.encode("Y", "UTF-8")); /* 심의 통과된 영화만*/
			
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
				String data = obj.get("Data").toString();
				//이걸 JSON Array로 변환 [] 
				JSONArray ResultArray = (JSONArray) parser.parse(data);
				//Data 내에 요소는 1개 밖에 없음...그 요소를 가져오고
				JSONObject FinalObj = (JSONObject) ResultArray.get(0);
				//그 안에서 Result를 가져옴 이녀석도 JSON Object []
				String FinalResult = FinalObj.get("Result").toString();
				//이걸 최종찐마지막으로 배열로 가져와주면 끝 
				JSONArray movieArray = (JSONArray) parser.parse(FinalResult);
				
				
				//영화별로 하나씩 정리해준다
				for(int i=0; i<movieArray.size(); i++) {
					MovieVO vo = new MovieVO();
					JSONObject movie = (JSONObject) movieArray.get(i);
					if(((String) movie.get("genre")).contains("에로")) break;
					//감독, 출연 배우 정리 이 녀석은 {}로 묶여있음 가져와야함 
					String DirectorsStr = movie.get("directors").toString();
					//Directors: { directors : "" }니까 이번에는 오브젝트로
					JSONObject DirectorsObj = (JSONObject)parser.parse(DirectorsStr); // {}로 묶인 객체 뽑기
					String DirectorStr = DirectorsObj.get("director").toString(); 
					JSONArray directorArray = (JSONArray) parser.parse(DirectorStr);//이제 []로 시작하는 배열에서 다시 directorNm뽑기
					JSONObject director = (JSONObject) directorArray.get(0);
					
					//줄거리 정리 - 감독 키랑 비슷하게 구성 
					String PlotsStr = movie.get("plots").toString();
					JSONObject PlotsObj = (JSONObject)parser.parse(PlotsStr); // {}로 묶인 객체 뽑기
					String plotStr = PlotsObj.get("plot").toString(); 
					JSONArray plotArray = (JSONArray) parser.parse(plotStr);//이제 []로 시작하는 배열에서 다시 directorNm뽑기
					JSONObject plot = (JSONObject) plotArray.get(0);
					
					//배우 정리
					String ActorsStr = movie.get("actors").toString();
					JSONObject ActorsObj = (JSONObject)parser.parse(ActorsStr); // {}로 묶인 객체 뽑기
					String ActorStr = ActorsObj.get("actor").toString(); 
					JSONArray actorArray = (JSONArray) parser.parse(ActorStr);//이제 []로 시작하는 배열에서 다시 directorNm뽑기
					String actors="";
					for(int a=0; a<actorArray.size(); a++) {
						actors += ((JSONObject) actorArray.get(a)).get("actorNm").toString()+"/";
					}
					actors = actors.substring(0, actors.lastIndexOf("/"));
					
//					str += movie.get("title") + "(" + movie.get("prodYear")+")  | " + movie.get("posters")  
//					+ movie.get("nation")  + "  |  "   +  movie.get("genre").toString().replace(",", "/") + "<br/>"
// 					+ director.get("directorNm") + "  |  " + movie.get("keywords")  + movie.get("posters")
// 					+ plot.get("plotText") + " | "  +actors.toString() + " | " + movie.get("keywords").toString().replace(",", "/")
// 					+ "<br/><br/>";
					
					
					
					vo.setTitle(movie.get("title").toString().trim().replace("!HS ","").replace(" !HE", ""));
					vo.setrYear(Integer.parseInt(movie.get("prodYear").toString()));
					vo.setCountry(movie.get("nation").toString().trim());
					vo.setGenre(movie.get("genre").toString().replace(",", "/"));
					vo.setDirector(director.get("directorNm").toString());
					vo.setActor(actors);
					vo.setKeyword(movie.get("keywords").toString().replace(",", "/"));
					vo.setStory(plot.get("plotText").toString());
					vo.setPoster(movie.get("posters").toString());
					
					dao.setMovieDB(vo);
				}
				
				sb.setLength(0);
				rd.close();
				conn.disconnect();
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
    long end = System.currentTimeMillis();
//		System.out.println( "실행 시간 : " + ( end - start )/1000.0 +"초");


	}
}
