package com.koreaIT.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.ArticleRepository;
import com.koreaIT.demo.vo.Article;

@Service
public class ArticleService {
	
	private ArticleRepository articleRepository;
	
	@Autowired
	public ArticleService(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
	}
	
	public void writeArticle(int memberId, int boardId, String title, String body) {
		articleRepository.writeArticle(memberId, boardId, title, body);
	}
	
	public int getLastInsertId() {
		return articleRepository.getLastInsertId();
	}
	
	public Article getArticleById(int id) {
		return articleRepository.getArticleById(id);
	}
	
	public List<Article> getArticles(int boardId, String searchKeywordType, String searchKeyword, int itemsInAPage, int page){
		
		int limitStart = (page - 1) * itemsInAPage;
		
		return articleRepository.getArticles(boardId, searchKeywordType, searchKeyword, limitStart, itemsInAPage);
	}
	
	public void modifyArticle(int id, String title, String body) {
		articleRepository.modifyArticle(id, title, body);
	}
	
	public void deleteArticle(int id) {
		articleRepository.deleteArticle(id);
	}

	public Article getForPrintArticle(int id) {
		
	
		
		return articleRepository.getForPrintArticle(id);
	}

	public int getArticlesCnt(int boardId, String searchKeywordType, String searchKeyword) {
		return articleRepository.getArticlesCnt(boardId, searchKeywordType, searchKeyword);
	}

	public void increaseHitCount(int id) {
		articleRepository.increaseHitCount(id);
	}

}
