package by.academy.bean;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "news")
public class News implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer idNews;

	@Column(name = "title")
	private String title;

	@Column(name = "brief")
	private String briefNews;

	@Column(name = "content")
	private String content;

	@Column(name = "newsDate")
	private LocalDate newsDate;

	public News() {
	}

	public News(int idNews, String title, String briefNews, String content, LocalDate newsDate) {
		super();
		this.idNews = idNews;
		this.title = title;
		this.briefNews = briefNews;
		this.content = content;
		this.newsDate = newsDate;
	}

	public News(String title, String briefNews, String content, LocalDate newsDate) {
		super();
		this.title = title;
		this.briefNews = briefNews;
		this.content = content;
		this.newsDate = newsDate;
	}

	public News(String title, String briefNews, String content) {
		super();
		this.title = title;
		this.briefNews = briefNews;
		this.content = content;
		this.newsDate = LocalDate.now();
	}

	public Integer getIdNews() {
		return idNews;
	}

	public void setIdNews(Integer idNews) {
		this.idNews = idNews;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBriefNews() {
		return briefNews;
	}

	public void setBriefNews(String briefNews) {
		this.briefNews = briefNews;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;

	}

	public LocalDate getNewsDate() {
		return newsDate;
	}

	public void setNewsDate(LocalDate newsDate) {
		this.newsDate = newsDate;
	}

	@Override
	public int hashCode() {
		return Objects.hash(briefNews, content, idNews, newsDate, title);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		News other = (News) obj;
		return Objects.equals(briefNews, other.briefNews) && Objects.equals(content, other.content)
				&& Objects.equals(idNews, other.idNews) && Objects.equals(newsDate, other.newsDate)
				&& Objects.equals(title, other.title);
	}

	@Override
	public String toString() {
		return "News idNews=" + idNews + ", title=" + title + ", briefNews=" + briefNews + ", content=" + content
				+ ", newsDate=" + newsDate;
	}

}
