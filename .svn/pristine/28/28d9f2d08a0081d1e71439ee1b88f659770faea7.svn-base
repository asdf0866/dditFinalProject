package kr.or.ddit.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.IConsultingMapper;
import kr.or.ddit.service.IConsultingService;
import kr.or.ddit.service.file.IFileService;
import kr.or.ddit.vo.AttachFileVO;
import kr.or.ddit.vo.BoardReplyVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Transactional
@Service
public class ConsultingServiceImpl implements IConsultingService {

	@Inject
	private IConsultingMapper mapper;
	
	@Inject
	private IFileService fileService;
	
	@Override
	public ServiceResult consultingInsert(HttpServletRequest req, BoardVO board) {
		ServiceResult result = null;
		
		//	첨부 파일이 존재하는 경우
		List<MultipartFile> reqFiles = board.getBoFile();
		if(!reqFiles.isEmpty() && reqFiles != null) {
			board = fileService.registerBoFile(req, board);
		}
		
		//1) BOARD 테이블에 insert
		int status = mapper.consultingInsert(board);
		
		//2) ATTACH_FILE 테이블에 insert
		//BoardVO(fileList=null, boardNo=null, writer=null, title=ㅁㅁㅁ3, content=<p>ㅂㅂㅂ2</p>
		//, wrtDt=null, attachFile=null, hit=0, boardStatCode=null, 
		//boFile=[org.springframework.web.multipart.support.파일객체])
												//파일객체		//ATTACH_FILE테이블의 FILE_ID(A.BOARD_NO = B.FILE_ID)
//		this.uploadController.uploadFormAction(board.getBoFile(), board.getBoardNo());
		
		if(status > 0) { // 등록 성공
			result = ServiceResult.OK;
			
		}else { //등록실패
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public int selectConsultingCount(PaginationInfoVO<BoardVO> pagingVO) {
		
		return mapper.selectConsultingCount(pagingVO);
	}

	@Override
	public List<BoardVO> selectConsultingList(PaginationInfoVO<BoardVO> pagingVO) {
		return mapper.selectConsultingList(pagingVO);
	}

	@Override
	public BoardVO selectConsulting(String boardNo) {
		mapper.incrementHit(boardNo); //조회수 증가
		return mapper.selectConsulting(boardNo);
	}

	@Transactional
	@Override
	public ServiceResult updateConsulting(HttpServletRequest req, BoardVO boardVO) {
		ServiceResult result = null;
		//1)
		int status = mapper.updateConsulting(boardVO);
		
		if(status > 0) { // 등록 성공->파일 처리
			
//			파일은 여러 개일 수 있으므로 List 객체에 담겨서 온다.
			List<MultipartFile> boFile = boardVO.getBoFile();
			
			//	파일이 존재할 경우 파일 등록 서비스로 보낸다.
			if(!boFile.isEmpty() && boFile != null) {
				ServiceResult sr = null;
				//	이미 파일을 등록한 적이 있는 경우
				String attachId = boardVO.getAttachFile();
				if(attachId != null && !attachId.equals("")) {
					sr = fileService.editBoardFile(req, boardVO);
					
					if(sr.equals(ServiceResult.FAILED)) {
						result = ServiceResult.FAILED;
					}
				} else {		//	등록한 적 없는 경우 신규 등록
					boardVO = fileService.registerBoFile(req, boardVO);
				}
			}		//	파일 등록 if문 종료
			
			result = ServiceResult.OK;
			
		}else { //등록실패
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public BoardVO selectBoard(String boardNo) {
		mapper.incrementHit(boardNo); //조회수 증가
		return mapper.selectBoard(boardNo);
	}

	@Override
	public void delete(String boardNo) {
		mapper.delete(boardNo);
		
	}

	@Override
	public AttachFileVO consultingDownload(int fileSerialNo) {
		AttachFileVO attachFileVO = mapper.consultingDownload(fileSerialNo);
		if(attachFileVO == null) {
			throw new RuntimeException();
		}
		mapper.incrementConsultingDowncount(fileSerialNo); //다운로드 횟수 증가
		return attachFileVO;
	}

	@Override
	public int updateAttachFile(AttachFileVO attachFileVO) {
		return this.mapper.updateAttachFile(attachFileVO);
	}
	
	//댓글 목록
	@Override
	public List<BoardReplyVO> commentList(String boardNo){
		return this.mapper.commentList(boardNo);
	}

	@Override
	public List<BoardVO> getPopular5() {
		// TODO Auto-generated method stub
		return mapper.getPopular5();
	}
}
