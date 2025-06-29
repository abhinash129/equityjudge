package com.nivesh.service.masterdatasetup;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nivesh.bo.NewsBO;
import com.nivesh.command.masterdatasetup.NewsCommand;
import com.nivesh.command.masterdatasetup.UpdateNewsCommand;
import com.nivesh.dao.masterdatasetup.INewsDao;
import com.nivesh.util.ApplicationConstant;
import com.nivesh.util.DateHelper;

@Service
@Transactional
//Name-News Service
//purpose-Provide news Service
public class NewsServiceImpl implements INewsService{
	@Resource 
	private INewsDao newsdao;
	public void setNewsdao(INewsDao newsdao) {
		this.newsdao = newsdao;
	}
	@Override
	public int newsInsert(NewsCommand rCommand) {		
		NewsBO newsBo=new NewsBO();
		newsBo.setSubject(rCommand.getSubject());
		newsBo.setText(rCommand.getText1());
		newsBo.setActive(ApplicationConstant.ACTIVE);
		newsBo.setAuditaction(ApplicationConstant.AUDIT_ACTION_INSERT);
		newsBo.setAuditdatetime(DateHelper.todaysDateTimeInDBFormat());
		newsBo.setUserid("u0001");
	int b=newsdao.create(newsBo);
	return b;
	}
	
	
	@Override
	public List<NewsBO> newsForUpdation() {
		
	    NewsBO newsBO = new NewsBO();
		List<NewsBO> list=newsdao.newsForUpdation(newsBO);
		//newsBO.setText(list.toString());
		return list;
	}
	@Override
	public int[] updateNews(UpdateNewsCommand updateNewsCommand) {
		
		List<NewsBO> newsBoList=null;
		newsBoList=new ArrayList<NewsBO>();
		
		
		//Delete News Data
		newsdao.deleteAllNewsData();
		
		//insert updated new data
		
		
		
		String[] subject=updateNewsCommand.getSubject();
		String[] text=updateNewsCommand.getText1();
		for(int i=0;i<=(text.length)-1;i++)
		{
			String subjectStr=subject[i];
			NewsBO newsBo=new NewsBO();
			
			if(subjectStr!=null&&subjectStr.trim().length()>0)
				newsBo.setSubject(subjectStr);
			else
				newsBo.setSubject(null);
			if(text[i]!=null&&text[i].trim().length()>0)
				newsBo.setText(text[i]);
			else
			newsBo.setText(null);
			
			newsBo.setAuditaction(ApplicationConstant.AUDIT_ACTION_INSERT);
			newsBo.setAuditdatetime(DateHelper.todaysDateTimeInDBFormat());
			newsBo.setActive(ApplicationConstant.ACTIVE);
			newsBoList.add(newsBo);
			
		}
       int[] b=newsdao.batchInsert(newsBoList);
		return b;
	
	}
	@Override
	public String deleteNews(String id) {
		NewsBO newsBo=new NewsBO();
		
		newsBo.setId(Integer.parseInt(id));
		newsBo.setSubject(null);
		newsBo.setText(null);
		
		
		newsdao.delete(id);
		
		
		return "updatenews";
	}
	
		
}
