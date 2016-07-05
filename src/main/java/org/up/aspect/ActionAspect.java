package org.up.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class ActionAspect {

//	private Logger logger = LogManager.getLogger();
//
//	@Around("execution(* org.up..*.*(..))")
//	private Object before(ProceedingJoinPoint joinPoint) throws Throwable{
//		StringBuilder sb = new StringBuilder(">>>> AOP logger \r\n");
//		sb.append(" [start    ] : " + System.currentTimeMillis() + " \r\n");
//		sb.append(" [Signature] :" + joinPoint.getSignature().getDeclaringTypeName() + "."
//				+ joinPoint.getSignature().getName());
//		Object value = joinPoint.proceed();
//		sb.append(" [end      ]: " + System.currentTimeMillis() + " <<<<");
//		logger.info(sb.toString());
//		return value;
//	}
}
