package by.academy.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import by.academy.bean.News;
import by.academy.dao.INewsDAO;
import by.academy.dao.NewsDAOException;

@Repository
public class NewsDAOImpl implements INewsDAO {

	@Autowired
	private SessionFactory sessionFactory;

	private static final String TAKE_ORDERED_NEWS = "from News order by newsDate desc";

	@Override
	public List<News> getNews() throws NewsDAOException {

		try {
			Session currentSession = sessionFactory.getCurrentSession();
			Query<News> theQuery = currentSession.createQuery(TAKE_ORDERED_NEWS, News.class);
			List<News> newsess = theQuery.getResultList();

			return newsess;

		} catch (Exception e) {
			throw new NewsDAOException(e);
		}
	}

	@Override
	public List<News> getLatestNews(int amount) throws NewsDAOException {

		try {
			Session currentSession = sessionFactory.getCurrentSession();
			Query<News> theQuery = currentSession.createQuery(TAKE_ORDERED_NEWS, News.class);
			theQuery.setMaxResults(amount);
			List<News> newsess = theQuery.getResultList();

			return newsess;

		} catch (Exception e) {
			throw new NewsDAOException(e);
		}
	}

	@Override
	public News fetchById(int id) throws NewsDAOException {

		try {
			Session currentSession = sessionFactory.getCurrentSession();
			News theNews = currentSession.get(News.class, id);
			return theNews;
		} catch (Exception e) {
			throw new NewsDAOException(e);
		}
	}

	private static final String DELETE_NEWS_BY_ID = "delete from News where id=:id";

	@Override
	public void deleteNews(int[] idNews) throws NewsDAOException {

		try {
			Session currentSession = sessionFactory.getCurrentSession();
			for (int id : idNews) {
				Query theQuery = currentSession.createQuery(DELETE_NEWS_BY_ID);
				theQuery.setParameter("id", id);
				theQuery.executeUpdate();
			}
		} catch (Exception e) {
			throw new NewsDAOException(e);
		}
	}

	@Override
	public void saveNews(News news) throws NewsDAOException {

		try {
			Session currentSession = sessionFactory.getCurrentSession();
			currentSession.save(news);
		} catch (Exception e) {
			throw new NewsDAOException(e);
		}
	}

	@Override
	public void updateNews(News news) throws NewsDAOException {
		try {
			Session currentSession = sessionFactory.getCurrentSession();
			currentSession.update(news);
		} catch (Exception e) {
			throw new NewsDAOException(e);
		}
	}

}
