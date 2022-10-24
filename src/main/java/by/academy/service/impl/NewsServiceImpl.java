package by.academy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import by.academy.bean.News;
import by.academy.dao.INewsDAO;
import by.academy.dao.NewsDAOException;
import by.academy.service.INewsService;
import by.academy.service.ServiceException;

@Service
public class NewsServiceImpl implements INewsService {

	@Autowired
	private INewsDAO newsDAO;

	@Transactional
	@Override
	public List<News> getList() throws ServiceException {

		try {
			return newsDAO.getNews();
		} catch (NewsDAOException e) {
			throw new ServiceException(e);
		}
	}

	@Transactional
	@Override
	public List<News> getLatestNews(int amount) throws ServiceException {

		try {
			return newsDAO.getLatestNews(amount);
		} catch (NewsDAOException e) {
			throw new ServiceException(e);
		}
	}

	@Transactional
	@Override
	public News fetchById(int id) throws ServiceException {

		try {
			return newsDAO.fetchById(id);
		} catch (NewsDAOException e) {
			throw new ServiceException(e);
		}
	}

	@Transactional
	@Override
	public void deleteNews(int[] idNews) throws ServiceException {

		try {
			newsDAO.deleteNews(idNews);
		} catch (NewsDAOException e) {
			throw new ServiceException(e);
		}
	}

	@Transactional
	@Override
	public void saveNews(News news) throws ServiceException {

		try {
			newsDAO.saveNews(news);
		} catch (NewsDAOException e) {
			throw new ServiceException(e);
		}
	}

	@Transactional
	@Override
	public void updateNews(News news) throws ServiceException {

		try {
			newsDAO.updateNews(news);
		} catch (NewsDAOException e) {
			throw new ServiceException(e);
		}
	}

}
