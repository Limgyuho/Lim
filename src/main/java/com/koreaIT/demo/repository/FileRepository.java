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
			 SELECT  *, SUBSTRING_INDEX(originName, IF(LOCATE('_', originName) > 0, '_', '.'), 1) AS orgName
			 FROM `file`
			 ORDER BY id DESC
			""")
	List<FileVO> getFiles();
	
	
	
	
	
	
	@Insert("""
			INSERT INTO fileDP
				SET regDate = NOW(),
					originName = #{orgName},
					savedName = #{savedName},
					savedPath = #{savedPath},
					dpn = #{dpn}
			""")
	void insertfileDPInfo(String orgName, String savedName, String savedPath, String dpn);

	
	@Select("""
		    SELECT *
		    FROM fileDP
		    """)
	List<FileDP> getFileDPByDpn();

	

	@Select("""
			SELECT *
				FROM file
				WHERE id = #{fileId}
			""")
	FileDP getFileDPeById(int fileId);

	
	@Select("""
			 SELECT  *, SUBSTRING_INDEX(originName, IF(LOCATE('_', originName) > 0, '_', '.'), 1) AS orgName
			 FROM `file`
			 ORDER BY id DESC
			 LIMIT 5;
			""")
	List<FileVO> getFilesMain();



}
