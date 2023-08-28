package com.smhrd.model;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.google.gson.Gson;
import com.smhrd.database.SqlSessionManager;

public class MessageDAO {
  // 자바와 DB 의 연결을 위한 작업! -> 어떤 작업을 처리할 것인지 연결!

  // 0. SqlSessionManager(Class) 기능 불러오기
  SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();

  // 회원 가입을 진행할 수 있는 메소드.
  public int sendMessage(Message message) {
    int cnt = 0;
    try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
      // 1. 데이터 베이스 연결 -> 연결 객체 대여
      // true == autocommit
      // 2. sql 문장 선택
      cnt = sqlSession.insert("sendMessage", message);

      // 4. DB 종료
      sqlSession.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return cnt;
  }

  public ArrayList<Message> getMessageList(String email) {
    ArrayList<Message> messageList = null;
    try (SqlSession sqlSession = sqlSessionFactory.openSession(true);) {
      messageList = new ArrayList<Message>();
      // 1. 데이터 베이스 연결 -> 연결 객체 대여
      // true == autocommit

      // 2. sql 문장 선택
      messageList = (ArrayList) sqlSession.selectList("getMessageList", email);

    } catch (Exception e) {
      e.printStackTrace();
    }
    return messageList;
  }

  public String getMessageListToJson(String email) {
    ArrayList<Message> messageList = null;
    String jsonPlace = null;
    try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
      messageList = new ArrayList<Message>();
      // 1. 데이터 베이스 연결 -> 연결 객체 대여
      // true == autocommit


      // 2. sql 문장 선택
      messageList = (ArrayList) sqlSession.selectList("getMessageList", email);

      Gson gson = new Gson();
      jsonPlace = gson.toJson(messageList);

    } catch (Exception e) {
      e.printStackTrace();
    }
    return jsonPlace;
  }
}
