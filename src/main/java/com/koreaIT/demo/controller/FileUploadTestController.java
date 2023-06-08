package com.koreaIT.demo.controller;

import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.koreaIT.demo.service.FileService;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.vo.FileVO;
import com.koreaIT.demo.vo.Member;

@Controller
public class FileUploadTestController {

	private FileService fileService;
	private MemberService memberService;

	@Autowired
	public FileUploadTestController(FileService fileService, MemberService memberService) {
		this.fileService = fileService;
		this.memberService = memberService;

	}	

	@RequestMapping("/usr/article/upload")
	@ResponseBody
	public String uploadFile(MultipartFile file) {

		try {
			fileService.saveFile(file);
		} catch (IOException e) {
			e.printStackTrace();
			return "파일 업로드 실패";
		}

		return "파일 업로드 성공";
	}

	@RequestMapping("usr/article/transmission")
	public String transmission(Model model,String department, String name) {

		List<FileVO> files = fileService.getFiles();
		model.addAttribute("files", files);
		
		List<Member> adminUpload = memberService.adminUpload();
		model.addAttribute("adminUpload", adminUpload);
		
		List<Member> transmissionMembers = memberService.transmissionMembers();
		model.addAttribute("transmissionMembers", transmissionMembers);
		
		return "usr/article/transmission";
	}

	@RequestMapping("/usr/article/program")
	public String view(Model model) {
		List<FileVO> files = fileService.getFiles();
	    model.addAttribute("files", files);

		return "usr/article/program";
	}

	@RequestMapping("/usr/article/file/{fileId}")
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@PathVariable("fileId") int fileId) throws IOException {

		FileVO fileVo = fileService.getFileById(fileId);
		
		Resource resource = new FileSystemResource(fileVo.getSavedPath());

		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
				.body(resource);
	}

	
	
}