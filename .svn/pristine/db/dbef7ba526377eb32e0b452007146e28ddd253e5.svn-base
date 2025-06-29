package com.nivesh.util;


import java.io.Serializable;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import org.springframework.stereotype.Service;

@Service
public class ExceptionPropertyAccessore implements IExceptionPropertyAccessore,Cloneable,Serializable{
   
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// private static final Logger logger = LoggerFactory.getLogger(ExceptionPropertyAccessore.class); 
	private static volatile ExceptionPropertyAccessore exceptionPropertyAccessore;
    
	public ExceptionPropertyAccessore() {
		
	}

	public ExceptionPropertyAccessore getInstance()
	{
		if(exceptionPropertyAccessore==null)
		{
			synchronized (ExceptionPropertyAccessore.class) {
				if(exceptionPropertyAccessore==null)
				{
					exceptionPropertyAccessore=new ExceptionPropertyAccessore();
				}
					
			}
		}
		return exceptionPropertyAccessore;
	}

	@Override
	public Map<String,String> getExceptionObject() {
		Map<String,String> map= new HashMap<String,String>();
		//exceptionPropertyAccessore=getInstance();
		//System.out.println("messageSource " +messageSource.getMessage(errCode, null,Locale.getDefault()));
		try {
			ResourceBundle resourceBundle = ResourceBundle.getBundle("ExceptionMessage");
			Enumeration<String> keys = resourceBundle.getKeys();
			while (keys.hasMoreElements()) {
				String key = keys.nextElement();
				String value = resourceBundle.getString(key);
				map.put(key, value);
				//System.out.println(key + ": " + value);
			}
			return map;
 
		} catch (Exception e) {
//			logger.error(e.getMessage());
		}
		return null;
	}

	public Object readresolve() {
		return exceptionPropertyAccessore;
	}

	@Override
	public Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return exceptionPropertyAccessore;
	}
	

	
}
