package com.nivesh.aspect;

import java.util.Arrays;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StopWatch;
import org.springframework.util.StopWatch.TaskInfo;

@Aspect
public class NiveshAspect {
	
	static Logger logger =  LoggerFactory.getLogger( NiveshAspect.class);
	
  
	
	// this method is the around advice
	  @Around("within(com.nivesh.service..*)")
    public Object transactionManagement(ProceedingJoinPoint call) throws Throwable {
        Object returnValue;
        StopWatch clock = new StopWatch(getClass().getName());
        try {
            clock.start(call.toShortString());
            returnValue = call.proceed();
        } 
        finally {
        	
            clock.stop();
        }
        return returnValue;
    }
   
	  
	  
	  @AfterReturning(pointcut = ("within(com.nivesh.service..*)"),returning="result")
    public void afterReturn(JoinPoint joinPoint, Object result) {
	 
		 logger.info("the method "+joinPoint.getSignature().getName()+" returns "+result);  
	   
		   }
   
   @AfterThrowing(
		   pointcut = ("within(com.nivesh.service..*)"),
		   throwing= "error")
		  public void logAfterThrowing(JoinPoint joinPoint, Throwable error) {
	        
	   
	   Signature signature = joinPoint.getSignature();
	    String methodName = signature.getName();
	    String stuff = signature.toString();
	    String arguments = Arrays.toString(joinPoint.getArgs());
	    logger.info(" We have caught exception in method: "
	        + methodName + " with arguments "
	        + arguments + "\nand the full toString: " + stuff + "\nthe exception is: "
	        + error.getMessage(), error);
	  }
			//...
		  
   
   
   

   @Around("within(com.nivesh.service..*)")
   public Object profile(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
	   logger.info("before executing method "+proceedingJoinPoint.getSignature().getName()+" "+"the argument of method is "+Arrays.toString(proceedingJoinPoint.getArgs()));
	   logger.info("the method "+proceedingJoinPoint.getSignature().getName()+" executed ");
	   StopWatch stopWatch = new StopWatch();
       stopWatch.start(proceedingJoinPoint.toShortString());
       boolean isExceptionThrown = false;
       try {
           // execute the profiled method
           return proceedingJoinPoint.proceed();
       } catch (RuntimeException e) {
           isExceptionThrown = true;
           throw e;
       } finally {
           stopWatch.stop();
           TaskInfo taskInfo = stopWatch.getLastTaskInfo();
           // Log the method's profiling result
           String profileMessage = taskInfo.getTaskName() + ": " + taskInfo.getTimeMillis() + " ms" +
                   (isExceptionThrown ? " (thrown Exception)" : "");
           logger.info(profileMessage);
       }
   }
	

	
   
	
	

}
