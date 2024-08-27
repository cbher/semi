package semi.play.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static semi.common.JDBCtemplate.*;

import semi.cooking.model.vo.Attachment;
import semi.play.model.dao.PlayDao;
import semi.play.model.vo.Play;
import semi.play.model.vo.PlayReply;

public class PlayService {

	public ArrayList<Play> selectPlayList(){
		Connection conn = getConnection();
		ArrayList<Play> list = new PlayDao().selectPlayList(conn);
		close(conn);
		return list;
	}
	
	public Play selectDetailPlay(int placeNo) {
		Connection conn = getConnection();
		Play p = new PlayDao().selectDetailPlay(conn, placeNo);
		close(conn);
		return p;
	}
	
	public ArrayList<Attachment> selectAttachmentList(int placeNo){
		Connection conn = getConnection();
		ArrayList<Attachment> list = new PlayDao().selectAttachmentList(conn, placeNo);
		close(conn);
		return list;
	}
	
	public ArrayList<Play> selectPlaySimilarList(int categoryNo, int placeNo){
		Connection conn = getConnection();
		ArrayList<Play> list = new PlayDao().selectPlaySimilarList(conn, categoryNo, placeNo);
		close(conn);
		return list;
	}
	
	public ArrayList<PlayReply> selectPlayReply(int placeNo){
		Connection conn = getConnection();
		ArrayList<PlayReply> list = new PlayDao().selectPlayReply(conn, placeNo);
		close(conn);
		return list;
	}
	
	public int insertReply(PlayReply pr) {
		Connection conn = getConnection();
		int result = new PlayDao().insertReply(conn, pr);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
