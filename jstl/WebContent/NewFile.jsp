<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
el과 jstl을 배울것이다.

<%= "test" %><br> - 기존표현방식
${ "test" }<br> - 달러 특수기호와 괄호로 표기하는 EL방식

EL - Expression Language(표현언어)
JSP스크립트를 대신해 속성값들을 보다 편리하게 출력하기 위해 제공된 언어이다.
표현식으로서 attribute값이나 parameter값을 출력할 용도로 사용하는 언어
즉 표현하고 출력하는 것에 중점화되어있는 Language이다.

정수형 : ${ 10 }<br>
실수형 : ${ 10.111  }<br>
문자형 : ${ "test" }<br>
논리형 : ${ true }<br>
null값 : ${ null }<br>  -> 아무것도 출력되지 않는다. 이는 출력스크립틀릿에서도 동일하다.
연산 : ${ 5+2 }<br> -> 연산은 자동으로 수행하여 결과값이 출력된다.
=========================<br>
<h1>연산자들</h1>
\${5 + 2} : ${5 + 2}<br>
\${5 - 2} : ${5 - 2}<br>
\${5 * 2} : ${5 * 2}<br>
\${5 / 2} : ${5 / 2}<br>
\${5 div 2} : ${5 div 2}<br>
\${5 % 2} : ${5 % 2}<br>
\${5 mod 2} : ${5 mod 2}<br>

역슬래시를 붙이면 EL의 연산이 작동하지 않고 그대로 출력된다. -> 마치 Escape문자나 서식제어문자에서 \\나 \" 와 같이 쓰거나 %%를 쓰는 것과 같이 특수기호를 문자 그대로 출력하겠다고 쓰는 것처럼 되서인듯
\\${5 mod 2} 이런식으로 쓰면 역슬래시가 문자로서 하나 출력될 뿐 EL은 정상작동될 듯


\${5 == 2 } : ${5 == 2} => \${5 eq 5} : ${5 eq 5}<br>
\${5 != 2 } : ${5 != 2} => \${5 ne 5} : ${5 ne 5}<br>	not equal
\${5 < 2 } : ${5 < 2} => \${5 lt 5} : ${5 lt 5}<br>		less than
\${5 > 2 } : ${5 > 2} => \${5 gt 5} : ${5 gt 5}<br>		greater than
\${5 <= 2 } : ${5 <= 2} => \${5 le 5} : ${5 le 5}<br>	less or equal
\${5 >= 2 } : ${5 >= 2} => \${5 ge 5} : ${5 ge 5}<br>	greater or equal

위와같이 산술연산자나 비교연산자에 있어 영어단어를 쓸 수도 있음

\${(5>2) || (5<2) } : ${(5>2) || (5<2)} => \${true or false} : ${true or false}<br>
\${(5>2) && (5<2) } : ${(5>2) && (5<2)} => \${true and false} : ${true and false}<br>
\${!(5>2)} : ${!(5>2)} => \${not true} : ${not true }<br>

위와같이 출력스크립틀릿문을 간편하게 EL문으로서 작성할 수 있다.
${ }
달러특수기호와 중괄호를 사용.


EL을 이용하면..
request를 이용해 받아서 출력하는 것을 보다 간편하게 작성할 수 있다. EL의 param(내부객체)이용

</body>
</html>