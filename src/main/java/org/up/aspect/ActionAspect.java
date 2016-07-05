package org.up.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class ActionAspect {
	
	@Before("execution(*  action..*.*(..))")
	private void before(ProceedingJoinPoint proceedingJoinPoint){
		
	}
}
