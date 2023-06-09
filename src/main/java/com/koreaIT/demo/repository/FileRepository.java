package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.koreaIT.demo.vo.FileDP;
import com.koreaIT.demo.vo.FileVO;

@Mapper
public interface FileRepository {

	@Insert("""
			INSERT INTO file
				SET regDate = NOW(),
					originName = #{orgName},
					savedName = #{savedName},
					savedPath = #{savedPath}
			""")
	void insertFileInfo(String orgName, String savedName, String savedPath);

	@Select("""
			SELECT *
				FROM file
				WHERE id = #{fileId}
			""")
	FileVO getFileById(int fileId);

	@Select("""
			SELECT *
				FROM file
			""")
	List<FileVO> getFiles();
	
	
	
	
	
	
	@Insert("""
			INSERT INTO fileDP
				SET regDate = NOW(),
					originName = #{orgName},
					savedName = #{savedName},
					savedPath = #{savedPath}
					dpn = #{dpn}
			""")
	void insertfileDPInfo(String orgName, String savedName, String savedPath, String dpn);


	
	@Select("""
			SELECT *
			FROM fileDP
			WHERE id = #{fileId}
			""")
	FileDP getFileDPeById(int fileId);
	
	@Select("""
			SELECT *
				FROM fileDP
				WHERE dpn =#{dpn}
			""")
	List<FileDP> getFileDP(String dpn);
	


}
