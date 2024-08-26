package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.AttachFileVO;

public interface IFileMapper {
	public int getFileNo(String string);
	public void attachFileRegister(AttachFileVO attachFile);
	public List<AttachFileVO> getFileList(String attachFile);
	public AttachFileVO getFile(AttachFileVO attachFile);
	public int delFile(AttachFileVO delFile);
	public int getFileCount(String attachFile);
}
