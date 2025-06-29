package com.nivesh.util;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

public @interface AllAnnotation {
	@Documented
	@Target(ElementType.FIELD)
	@Retention(RetentionPolicy.RUNTIME)
	public @interface DateFieldAnnotate{
		
	}
	
	@Documented
	@Target(ElementType.FIELD)
	@Retention(RetentionPolicy.RUNTIME)
	public @interface IdAnnotation {

	}
}
