package com.kr.pawpawtrip.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.management.RuntimeErrorException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kr.pawpawtrip.member.model.mapper.MemberMapper;
import com.kr.pawpawtrip.member.model.vo.Member;


@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	
	@Override
	public Member login(String memberId, String memberPw) {
		Member member = mapper.selectMemberById(memberId);
		
		// 매번 다른 값으로 암호화
		System.out.println("encoder : " + encoder.encode(memberPw));
		
		if (member == null || !encoder.matches(memberPw, member.getMemberPw())) {
			return null;
		}
		
		return member;
	}
	
	@Override
	@Transactional // 에러가 생기면 자동 롤백 
	public int save(Member member) {
	    int result = 0;
	    
	    if (member.getMemberNo() > 0) {
	        // update
	    	if(member.getMemberPw().equals("")) {
	    		// 비밀번호 변경 없을 시
	    		member.setMemberPw(null);
	    		result = mapper.updateMember(member);
	    	} else {
	    		// 비밀번호 변경 시 
	    		member.setMemberPw(encoder.encode(member.getMemberPw())); // 새로운 비밀번호를 암호화하여 설정
	    		result = mapper.updateMember(member);
	    	}
	    } else {
	        // insert
	        member.setMemberPw(encoder.encode(member.getMemberPw())); // 새로운 비밀번호를 암호화하여 설정
	        result = mapper.insertMember(member);
	    }
	    
	    return result;
	}


	@Override
	public Boolean isDuplicateId(String memberId) {

		// null이 아니면 true 리턴 = 아이디 중복
		return mapper.selectMemberById(memberId) != null;
	}


	// access_Token을 요청하는 메서드 생성
	@Override
	public String getAccessToken(String code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
            
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
            
			sb.append("&client_id=5e374f58b3157eda0c7846d4ebda25f1"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8080/pawpawtrip/kakaoLogin"); // 본인이 설정한 주소
            
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();
            
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
            
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
            
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
            
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
            
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}


	// 서비스에 사용자 정보를 요청하는 내용 생성
	@Override
	public Member getUserInfo(String access_Token) {
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

//			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			
//			String id = properties.getAsJsonObject().get("id").getAsString();
			String id = element.getAsJsonObject().get("id").getAsString();
			String name = kakao_account.getAsJsonObject().get("name").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String phone_number = kakao_account.getAsJsonObject().get("phone_number").getAsString();
			String birthyear = kakao_account.getAsJsonObject().get("birthyear").getAsString();
			String birthday = kakao_account.getAsJsonObject().get("birthday").getAsString();
			
			// 지역번호와 대쉬를 제거한 전화번호 생성
			String cleaned_phone_number = phone_number.replaceAll("[^0-9]", "");
			// "010"으로 시작하도록 조정
			if (!cleaned_phone_number.startsWith("010")) {
			    // "010"으로 시작하지 않으면 추가
			    cleaned_phone_number = "010" + cleaned_phone_number.substring(4);
			}
			
			// id값 가져오는지 확인
			System.out.println("id : " + id );
			System.out.println("element : " + element.toString());
			
			userInfo.put("id", id);
			userInfo.put("name", name);
			userInfo.put("email", email);
			userInfo.put("phone_number", cleaned_phone_number);
			userInfo.put("birth", birthyear + birthday);

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Member result = mapper.findKakao(userInfo);
		// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
		System.out.println("Result : " + result);
		
		if(result == null) {
			// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
			mapper.insertKakao(userInfo);
			// 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
			return mapper.findKakao(userInfo);
			// 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
			//  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
		} else {
			// 정보가 이미 있기 때문에 result를 리턴함.
			return result;
		}
		
		
	}


	@Override
	public Member findMemberById(String memberId) {
		
		return mapper.selectMemberById(memberId);
	}

	// 회원 삭제 
	@Override
	@Transactional
	public int delete(int memberNo) {
		
		return mapper.updateStatus(memberNo, "N");
	}

	// 아이디 찾기
	@Override
	public String findMemberId(String memberName, String memberPhone) {
		
		return mapper.findMemberId(memberName, memberPhone);
	}

	// 비밀번호 찾기
	@Override
	public Member findMemberAndChangePw(String memberId, String memberName, String memberPhone) {
		
		Member member = mapper.findMemberAndChangePw(memberId, memberName, memberPhone);
		
		System.out.println("### findMember ### : " + member);
		
		return member;
	}

	


	
	
}
