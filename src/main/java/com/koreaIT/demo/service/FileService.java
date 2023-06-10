package com.koreaIT.demo.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.koreaIT.demo.repository.FileRepository;
import com.koreaIT.demo.vo.FileDP;
import com.koreaIT.demo.vo.FileVO;
@Service
public class FileService {
    
    @Value("${file.dir}")
    private String fileDir;
    
    private FileRepository fileRepository;

    @Autowired
    public FileService(FileRepository fileRepository) {
        this.fileRepository = fileRepository;
    }
    
    // 필수 프로그램 올리는곳
    public void saveFile(MultipartFile file) throws IOException {
        
        if (file.isEmpty()) {
            return;
        }
        
        String orgName = file.getOriginalFilename();
        
        String uuid = UUID.randomUUID().toString();
        
        String extension = orgName.substring(orgName.lastIndexOf("."));
        
        String savedName = uuid + extension;
        
        String savedPath = fileDir + File.separator + savedName;
        
        fileRepository.insertFileInfo(orgName, savedName, savedPath);
        
        file.transferTo(new File(savedPath));
    }

    public List<FileVO> getFiles() {
        return fileRepository.getFiles();
    }
    
    public FileVO getFileById(int fileId) {
        return fileRepository.getFileById(fileId);
    }
    
  
    
    
   //부서별 자료 올리는곳
    public void saveFileDP(MultipartFile file2, String dpn) throws IOException {
        if (file2.isEmpty()) {
            return;
        }

        String orgName = file2.getOriginalFilename();
        String uuid = UUID.randomUUID().toString();
        String extension = orgName.substring(orgName.lastIndexOf("."));
        String savedName = uuid + extension;
        String savedPath = fileDir + File.separator + savedName;

        fileRepository.insertfileDPInfo(orgName, savedName, savedPath, dpn);

        file2.transferTo(new File(savedPath));
    }

    public List<FileDP> getFileDPByDpn() {
        return fileRepository.getFileDPByDpn();
    }


	public FileDP getFileDPeById(int fileId) {
		
		return fileRepository.getFileDPeById(fileId);
	}
}