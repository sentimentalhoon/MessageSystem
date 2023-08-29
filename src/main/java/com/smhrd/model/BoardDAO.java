package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class BoardDAO {
    SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();

    public int BoardArticleCreate(Board board) {
        int cnt = 0;
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)){
            cnt = sqlSession.insert("CreateArticle", board);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cnt;
    }

    public Board BoardArticleRead(String numString) {
        Board board = null;
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)){
            board = sqlSession.selectOne("ReadArticle", numString);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return board;
    }

    public int BoardArticleUpdate(Board board) {
        int result = 0;
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)){
            result = sqlSession.update("UpdateArticle", board);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int BoardArticleDelete(String numString) {
        int result = 0;
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)){
            result = sqlSession.delete("DeleteArticle", numString);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public ArrayList<Board> BoardListRead(String Page) {
        ArrayList<Board> arrayListBoard = new ArrayList<Board>();
        Object object = null;
        try (SqlSession sqlSession = sqlSessionFactory.openSession(true)){
            object = sqlSession.selectList("ReadBoardList", Page);
            if (object instanceof ArrayList<?>){
                for (Object obj : (ArrayList<?>) object){
                    if (obj instanceof Board){
                        arrayListBoard.add((Board) obj);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arrayListBoard;
    }
}
