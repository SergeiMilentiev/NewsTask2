package by.academy.dao;

import java.util.List;

import by.academy.bean.News;

public interface INewsDAO {

	List<News> getNews() throws NewsDAOException;

	List<News> getLatestNews(int amount) throws NewsDAOException;

	News fetchById(int id) throws NewsDAOException;

	void deleteNews(int[] idNews) throws NewsDAOException;

	void saveNews(News news) throws NewsDAOException;

	void updateNews(News news) throws NewsDAOException;
}
