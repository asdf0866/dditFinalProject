package kr.or.ddit.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

//	@Component는 스프링 빈으로 등록하기 위한 어노테이션
//	@Aspect 어노테이션을 붙여 이 클래스가 Aspect를 나타내는 클래스라는결 명시
@Component
@Aspect
@Slf4j
public class ServiceLoggerAdvice {
	
	//	Before 어드바이스 - 조인 포인트 전에 발생한다. - 예외가 발생하는 경우만 제외하고 항상 실행된다.
	@Before("execution(* kr.or.ddit.*..*(..))")
	public void startLog(JoinPoint jp) {
		log.info("[@Beford] StartLog : ");
		
		// getSignature() : 어떤 클래스의 어떤 메소드가 실행되었는지 보여줌. 파라미터 타입은 무엇인지 보여준다.
		log.info("[@Beford] StartLog : " + jp.getSignature());
		
		// getArgs() : 전달된 파라미터 정보를 보여준다.
		log.info("[@Before] startLog : " + Arrays.toString(jp.getArgs()));
	}
	
	//	After Returning 어드바이스 - 조인 포인트가 정상적으로 종료한 후 실행된다. 예외가 발생하면 실행되지 않는다.
	@AfterReturning("execution(* kr.or.ddit.*..*(..))")
	public void logReturning(JoinPoint jp) {
		log.info("[@AfterReturning] logReturning : ");
		log.info("[@AfterReturning] logReturning : " + jp.getSignature());
	}
	
	//	After 어드바이스 - 조인 포인트에서 처리가 완료된 후 실행된다.
	@After("execution(* kr.or.ddit.*..*(..))")
	public void endLog(JoinPoint jp) {
		log.info("[@After] endLog : ");
		log.info("[@After] endLog : " + jp.getSignature());
		log.info("[@After] endLog : " + Arrays.toString(jp.getArgs()));
	}
	
	/*
	 *	Around 어드바이스 - 조인 포인트 전후에 실행된다.
	 *		- ProceedingJoinPoint : around 어드바이스에서 사용함
	 * 
	 *	스프링 프레임워크가 컨트롤 하고 있는 비즈니스 로직 호출을 가로챕니다.
	 *	책임이 around 어드바이스로 전가되는데, 비즈니스 메소드에 대한 정보를 around 어드바이스 메소드가 가지고 있어야 하고,
	 *	그 정보를 스프링 컨테이너가 around 어드바이스 메소드로 넘겨주면 
	 *	ProceedingJoinPoint 객체로 받아서 around 어드바이스가 컨트롤 시 활용합니다.
	 */
	@Around("execution(* kr.or.ddit.*..*(..))")
	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable{
		
		//	메소드 실행 직전 시간 체크
		long startTime = System.currentTimeMillis();
		log.info("[@Around] : " + Arrays.toString(pjp.getArgs()));

		//	메소드 실행(타겟)
		Object result = pjp.proceed();

		//	메소드 실행 직후 시간 체크
		long endTime = System.currentTimeMillis();
		log.info("[@Around] timeLog : " + Arrays.toString(pjp.getArgs()));

		//	직후 시간 - 직전 시간 = 메소드 실행 시간
		log.info("[@Around] timeLog : " + pjp.getSignature().getName() + " / (메소드 실행시간) : " + (endTime - startTime));
		
		return result;
	}
}






