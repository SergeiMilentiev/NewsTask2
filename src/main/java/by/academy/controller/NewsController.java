package by.academy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import by.academy.bean.News;
import by.academy.constant.ControllerConstant;
import by.academy.service.INewsService;
import by.academy.service.ServiceException;

@Controller
@RequestMapping("/news")
public class NewsController {

	@Autowired
	private INewsService newsService;

	private static final int newsAmount = 5;

	@GetMapping("/guestInfo")
	public String listLatesNews(Model theModel) {

		try {
			List<News> latestNews = newsService.getLatestNews(newsAmount);
			theModel.addAttribute(ControllerConstant.USER, ControllerConstant.NOT_ACTIVE);
			theModel.addAttribute(ControllerConstant.NEWS, latestNews);
		} catch (ServiceException e) {
			return ControllerConstant.ERROR;
		}
		return ControllerConstant.BASE_LAYOUT;
	}

	@RequestMapping("/newsList")
	public String listAllNews(Model theModel) {

		try {
			List<News> newsessList = newsService.getList();
			theModel.addAttribute(ControllerConstant.NEWS, newsessList);
			theModel.addAttribute(ControllerConstant.USER, ControllerConstant.ACTIVE);
			theModel.addAttribute(ControllerConstant.ROLE, ControllerConstant.ADMIN);
			theModel.addAttribute(ControllerConstant.PRESENTATION, ControllerConstant.NEWS_LIST);
		} catch (ServiceException e) {
			return ControllerConstant.ERROR;
		}

		return ControllerConstant.BASE_LAYOUT;
	}

	@PostMapping("/saveNews")
	public String saveNews(@ModelAttribute("news") News news) {

		try {
			newsService.saveNews(news);
		} catch (ServiceException e) {
			return ControllerConstant.ERROR;
		}

		return ControllerConstant.REDIRECT_NEWS_LIST;
	}

	@PostMapping("/updateNews")
	public String updateNews(@ModelAttribute("news") News news) {

		try {
			newsService.updateNews(news);
		} catch (ServiceException e) {
			return ControllerConstant.ERROR;
		}

		return ControllerConstant.REDIRECT_NEWS_LIST;
	}

	@RequestMapping("/addNews")
	public String addNews(Model theModel) {

		theModel.addAttribute(ControllerConstant.USER, ControllerConstant.ACTIVE);
		theModel.addAttribute(ControllerConstant.ROLE, ControllerConstant.ADMIN);
		theModel.addAttribute(ControllerConstant.NEWS, ControllerConstant.ADD_NEWS);
		theModel.addAttribute(ControllerConstant.PRESENTATION, ControllerConstant.ADD_NEWS);

		return ControllerConstant.BASE_LAYOUT;
	}

	@GetMapping("/deleteNews")
	public String deleteNews(HttpServletRequest request) {

		try {
			String[] idNews = request.getParameterValues("newsId");
			if (idNews != null) {
				newsService.deleteNews(StringToInt(idNews));
			}
		} catch (ServiceException e) {
			return ControllerConstant.ERROR;
		}

		return ControllerConstant.REDIRECT_NEWS_LIST;
	}

	@GetMapping("/editNews")
	public String editNews(@RequestParam("newsId") int newsId, Model theModel) {

		try {
			News theNews = newsService.fetchById(newsId);
			theModel.addAttribute(ControllerConstant.USER, ControllerConstant.ACTIVE);
			theModel.addAttribute(ControllerConstant.ROLE, ControllerConstant.ADMIN);
			theModel.addAttribute(ControllerConstant.PRESENTATION, ControllerConstant.EDIT_NEWS);
			theModel.addAttribute(ControllerConstant.NEWS, theNews);
		} catch (ServiceException e) {
			return ControllerConstant.ERROR;
		}

		return ControllerConstant.BASE_LAYOUT;
	}

	@GetMapping("/viewNews")
	public String viewNews(@RequestParam("newsId") int newsId, Model theModel) {

		try {
			News theNews = newsService.fetchById(newsId);
			theModel.addAttribute(ControllerConstant.USER, ControllerConstant.ACTIVE);
			theModel.addAttribute(ControllerConstant.ROLE, ControllerConstant.ADMIN);
			theModel.addAttribute(ControllerConstant.PRESENTATION, ControllerConstant.VIEW_NEWS);
			theModel.addAttribute(ControllerConstant.NEWS, theNews);
		} catch (ServiceException e) {
			return ControllerConstant.ERROR;
		}

		return ControllerConstant.BASE_LAYOUT;
	}

	@GetMapping("/addForm")
	public String addForm(Model theModel) {
		News theNews = new News();
		theModel.addAttribute("add_news", theNews);
		return ControllerConstant.BASE_LAYOUT;
	}

	@GetMapping("/formForEdit")
	public String editForm(@RequestParam("newsId") int newsId, Model theModel) {
		try {
			News theNews = newsService.fetchById(newsId);
			theModel.addAttribute(ControllerConstant.EDIT_NEWS, theNews);
		} catch (ServiceException e) {
			return ControllerConstant.ERROR;
		}
		return ControllerConstant.BASE_LAYOUT;
	}

	@GetMapping("/login")
	public String login(Model theModel) {

		try {
			List<News> theNews = newsService.getList();
			theModel.addAttribute(ControllerConstant.NEWS, theNews);
			theModel.addAttribute(ControllerConstant.USER, ControllerConstant.ACTIVE);
			theModel.addAttribute(ControllerConstant.ROLE, ControllerConstant.ADMIN);
			theModel.addAttribute(ControllerConstant.PRESENTATION, ControllerConstant.NEWS_LIST);
		} catch (ServiceException e) {
			return ControllerConstant.ERROR;
		}

		return ControllerConstant.BASE_LAYOUT;
	}

	@GetMapping("/logout")
	public String logout(Model theModel) {

		try {
			List<News> latestNews = newsService.getLatestNews(newsAmount);
			theModel.addAttribute(ControllerConstant.USER, ControllerConstant.NOT_ACTIVE);
			theModel.addAttribute(ControllerConstant.NEWS, latestNews);
		} catch (ServiceException e) {
			return ControllerConstant.ERROR;
		}

		return ControllerConstant.BASE_LAYOUT;
	}

	private int[] StringToInt(String[] stringArray) {
		int[] array = new int[stringArray.length];
		for (int i = 0; i < stringArray.length; i++) {
			array[i] = Integer.parseInt(stringArray[i]);
		}
		return array;
	}
}
