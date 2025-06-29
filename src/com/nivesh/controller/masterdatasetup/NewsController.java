package com.nivesh.controller.masterdatasetup;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nivesh.bo.NewsBO;
import com.nivesh.command.masterdatasetup.NewsCommand;
import com.nivesh.command.masterdatasetup.UpdateNewsCommand;
import com.nivesh.service.masterdatasetup.INewsService;

@Controller
@RequestMapping("/news")
//  Name-News Controller 
//  Purpose -Updating News
public class NewsController {

	public static final String NEWSINSERT="newsinsert",UPDATENEWS="updatenews";
	
	public NewsController() {
	}
	@Resource 
	INewsService iNewsService;

	public NewsController(INewsService iNewsService) {
		this.iNewsService = iNewsService;
	}
	@RequestMapping(value="/insertnews/home",method=RequestMethod.GET)
	public String inserthome(HttpServletRequest request){
				return NEWSINSERT;
		}

	@RequestMapping(value="/insertnews",method=RequestMethod.POST)    
	public String insertNews(@ModelAttribute("newsinsertform") NewsCommand rcommand,ModelMap map){
		String subject=rcommand.getSubject();
		String text=rcommand.getText1(); 
		if(subject != null && !subject.isEmpty()&& text != null && !text.isEmpty()){

			int b=iNewsService.newsInsert(rcommand);
			if(b==1){
				map.addAttribute("subject","News successfully inserted");
				map.addAttribute("text"," News successfully inserted");
			}
			return NEWSINSERT;
		}
		else{
			map.addAttribute("subject","News insertion failed");
			map.addAttribute("text","News insertion failed");
			return NEWSINSERT;

		}

	}

	@RequestMapping(value="/updatenews/home",method=RequestMethod.GET)
	public String updatehome(ModelMap map){

		List<NewsBO> newslist=null;
		newslist=iNewsService.newsForUpdation();
		map.addAttribute("subject", newslist);
		return UPDATENEWS;
	}

	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(@ModelAttribute("updateform") UpdateNewsCommand updateNewsCommand,ModelMap map){
		int[] b=iNewsService.updateNews(updateNewsCommand);
		List<NewsBO> newslist=null;
		newslist=iNewsService.newsForUpdation();
		map.addAttribute("subject", newslist);
		if(b!=null){
			map.addAttribute("result","News successfully Updated");
			return UPDATENEWS;
		}else{
			map.addAttribute("result","News updation failed");
			return UPDATENEWS;

		}



	}
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String delete(@RequestParam String id,ModelMap map){

		iNewsService.deleteNews(id);
		List<NewsBO> newslist=null;
		newslist=iNewsService.newsForUpdation();
		map.addAttribute("subject", newslist); 
		map.addAttribute("result","News successfully Deleted");
		return UPDATENEWS;
	}
	/*@RequestMapping(value = "/newsdata", method = RequestMethod.POST)
  	public @ResponseBody List<NewsBO> getNews() {
  		System.out.println("hai");
  		List<NewsBO> newsList = null;
  		newsList = iNewsService.getNewsList();
  		System.out.println("controller"+newsList);
  		return newsList;

  	}
	 */


}