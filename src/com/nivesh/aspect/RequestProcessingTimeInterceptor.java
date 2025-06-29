package com.nivesh.aspect;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.nivesh.bo.UserSessionBO;

public class RequestProcessingTimeInterceptor extends HandlerInterceptorAdapter   {

	@Autowired  
	private ServletContext servletContext;  

	@Override  
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception {  
		try  
		{  
			HttpSession session = request.getSession();  
			UserSessionBO authToken=(UserSessionBO) session.getAttribute("sessionBO");

			String uri = request.getRequestURI();

			/*if(uri.endsWith("logout/"))
          {
        	  session.invalidate();
        	  response.setHeader("Cache-Control","no-cache");
          	  response.setHeader("Cache-Control","no-store");
          	  response.setHeader("Pragma","no-cache");
          	  response.setDateHeader ("Expires", 0);
               response.sendRedirect(servletContext.getContextPath()+"/");  
                        return false; 
/payment
          }*/
			if(!uri.endsWith("/javascriptdisabled")&&!uri.endsWith("/graphpattern/graph/detailsList")&&!uri.endsWith("/graphpattern/suggestion")&&!uri.endsWith("/graphpattern/companydetailsQuotes")&&
					!uri.endsWith("/graphpattern/graph/selectCompnyDemo")&&!uri.endsWith("/graphpattern/")&&
					!uri.endsWith("/webhook")&&!uri.endsWith("/paymentRedirect")&&!uri.endsWith("/payment")&&
					!uri.endsWith("/paymentAuthenticate")&&!uri.endsWith("/suscribe")&&!uri.endsWith("/disclaimer")
					&&!uri.endsWith("/dashboard/contactus2")&&!uri.endsWith("beforeLoginPortfolioDemo")&&
					!uri.endsWith("terms-and-conditions")&&!uri.endsWith("signup")&&!uri.endsWith("signuphome")&&
					!uri.endsWith("loginPage")&&!uri.endsWith("login_home")&&!uri.endsWith("login")&&!uri.endsWith("/")&&
//					!uri.endsWith("http://www.equityjudge.com") &&!uri.endsWith("/Nivesh_Development/")&&
					!uri.endsWith("http://localhost:8080/Nivesh_Development/") && !uri.endsWith("logout/") &&
					//!uri.endsWith("http://localhost:8080/Nivesh_Development/") && 
					!uri.endsWith("http://192.168.0.148:8080/Nivesh_Development/") && !uri.endsWith("logout/") && 
					!uri.endsWith("logout/")&&!uri.endsWith("contact_us")&&!uri.endsWith("feedbackSubmit")&&
					!uri.endsWith("about_us")&&!uri.endsWith("subscription")&&!uri.endsWith("forgotPassword")&&
					!uri.endsWith("loginfirst") &&!uri.endsWith("loginfirstTrend")&&!uri.endsWith("/userreview")
					&&!uri.endsWith("/algoEfficacy/findTop10List"))
			{
				if(authToken==null && (uri.endsWith("/companydatas/portfoliohome")))  
				{
					response.sendRedirect(servletContext.getContextPath()+"/loginfirst");  
					return false;  
				}else if(authToken==null && uri.endsWith("/companydata/portfoliodemo")){
					response.sendRedirect(servletContext.getContextPath()+"/beforeLoginPortfolioDemo");  
					return false; 
				}else if(authToken==null && (uri.endsWith("/graphpattern/graph/home") || uri.endsWith("/graphpattern/latestpattern"))){
					response.sendRedirect(servletContext.getContextPath()+"/loginfirstTrend");  
					return false;  
				}else if(authToken==null){
					response.sendRedirect(servletContext.getContextPath()+"/loginfirst");  
					return false;  
				}
				else  
				{  
					return true;  
				}  

			}



			return true;

		}catch(Exception ex)  
		{  
			ex.getMessage();  
			response.sendRedirect(servletContext.getContextPath()+"/");  
			return false;  
		}  
	}  





}

