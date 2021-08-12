package com.myspring.daejeon30.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.daejeon30.board.vo.Board2VO;
import com.myspring.daejeon30.board.vo.ImageVO;
import com.myspring.daejeon30.paging.Criteria;

@Repository("board2DAO")
public class Board2DAOImpl implements Board2DAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List selectAllBoard2List() throws DataAccessException{
		List<Board2VO> board2List = sqlSession.selectList("mapper.board2.selectAllBoard2List");
		return board2List;
	}
	
	@Override
	public int insertNewBoard(Map boardMap) throws DataAccessException{
		
		int boardNO = selectNewBoardNO(); //���� ��ȣ ������
		boardMap.put("rb_num", boardNO); // �� ��ȣ�� ����ʿ� ����
		sqlSession.insert("mapper.board2.insertNewBoard",boardMap); //id�� ���� insert���� ȣ���ϸ鼭 boardMap�� ����
		return boardNO;
	}
	
	//�� �� ��ȣ�� �����ɴϴ�.
	private int selectNewBoardNO() throws DataAccessException {
		return sqlSession.selectOne("mapper.board2.selectNewBoardNO");
	}

	@Override
	public Board2VO selectBoard(int boardNO) {
		return sqlSession.selectOne("mapper.board2.selectBoard",boardNO);
	}

	@Override
	public void updateBoard(Map boardMap) throws DataAccessException {
		sqlSession.update("mapper.board2.updateBoard",boardMap);
	}
	
	
	//��ȸ�� ���� ���
	@Override
	public int updateBoardView(int boardNO) throws DataAccessException{
		return sqlSession.update("mapper.board2.updateBoardView",boardNO);
	}

	@Override
	public void deleteBoard(int boardNO) throws DataAccessException {
		sqlSession.delete("mapper.board2.deleteBoard",boardNO);
	}
	
	@Override
	public List selectImageFileList(int rb_num) throws DataAccessException {
		List<ImageVO> imageFileList = null;
		imageFileList = sqlSession.selectList("mapper.board2.selectImageFileList",rb_num);
		return imageFileList;
	}
	
	private int selectNewImageFileNO() throws DataAccessException{
		return sqlSession.selectOne("mapper.board2.selectNewImageFileNO");
	}
	
	//�Խñ��� �� ��
	@Override
	public int count() throws Exception{
		return sqlSession.selectOne("mapper.board2.count");
	}
	
	// �Խù� ��� + ����¡
	@Override
	public List<Board2VO> listPage(int displayPost, int postNum) throws Exception {
	
	HashMap<String, Integer> data = new HashMap<String, Integer>();
	  
	 data.put("displayPost", displayPost);
	 data.put("postNum", postNum);
	  
	 return sqlSession.selectList("mapper.board2" + ".listPage", data);
	}
	
	//�������׽�Ʈ
	@Override
	@SuppressWarnings("unchecked")
	public List selectBoardList(Criteria cri) {
	    return sqlSession.selectList("mapper.board2.getPage", cri);
	}
	@Override
	public int countBoardList()throws Exception{
		return (Integer)sqlSession.selectOne("mapper.board2.countBoardList");
	}




}
