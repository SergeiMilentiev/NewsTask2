package by.academy.service;

import java.util.List;

import by.academy.bean.News;

public interface INewsService {

	List<News> getList() throws ServiceException;

	List<News> getLatestNews(int amount) throws ServiceException;

	News fetchById(int id) throws ServiceException;

	void deleteNews(int[] idNews) throws ServiceException;

	void saveNews(News news) throws ServiceException;

	void updateNews(News news) throws ServiceException;
}
