<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
int n = 10;
int n2 = 20;
int sum = 0;
for(int i = 0; i<10; i++) sum+=i+1;
%>
<input type='text' value='1~10 합 : <%=sum%>'><br>

<!--  스크립틀릿 안에는 자바코드들이 들어갈 수 있는데 역시나 반복문과 같은 형식도 가능하다. main메소드에서 작성했던것들 작성 가능(변수 및 메소드와 출력문 등)
등호가 추가되어있는 스크립틀릿에는 출력할 것을 둘 수도, 메소드를 호출할수도 있다.(메소드 호출시 메소드의 결과값 출력) 
html코드 태그 안에 자바코드(스크립틀릿)를 사용 가능하다. 사용자에게서 값을 입력받는 input태그안의 기본적 출력값인 value에 자바스크립틀릿을 집어넣었다. -->
<p>
아래와 같은 출력문을 작성해보자<br>
1+2+3+...+100 = 5050<br>
1 ~ 100까지의 짝수의 합 : 2550<br>
1 ~ 100까지의 홀수의 합 : 2500<br>

<%
int sum1=0;
for(int i = 1; i<=100; i++){
	sum1+=i;
}
//sum이라는 변수는 위에서 이미 사용되었으므로 사용 안함
//sum1변수를 초기식안에서 선언할 수 있지만 그러한 경우 for문의 지역변수가 됨
//int i = 0; i<100 으로 조건식을 설정할 경우 종속문장에서 i+1한 값으로 누적합을 구해야 함

int even = 0, odd=0;  //짝수는 even에, 홀수는 odd에 누적

for(int i = 1; i<=100; i++){
	if (i%2==0){
		even+=i;
	}
	else{
		odd+=i;
	}
}
//짝홀수 누적합 한번에 구하기
%>

<input type='text' value='1+2+3+...+100 : <%=sum1 %><br>
						 1 ~ 100까지의 짝수의 합 : <%=even%><br>
						 1 ~ 100까지의 홀수의 합 : <%=odd %>'
						 rows=10 cols=20>
<br>
value값 표현문내에서 br태그 작동불능, text인풋칸의 크기를 결정하는 rows및 cols작동 불능
-> rows및 cols 속성은 textarea에서만 가능한 속성값. input text타입에서는 style을 사용하기. width나 height 등

<br>


<br>
<h1>선생님 풀이</h1>

<%

int total = 0;
int oddSum = 0, evenSum=0;
for(int i = 1; i<=100; i++){
	total+=i;
	if(i%2 == 0){
		evenSum+=i;
	}
	else{
		oddSum+=i;
	}
}
%>

<br>
1+2+3+...+100 = <%= total %><br>
1 ~ 100 까지의 짝수의 합 : <%=evenSum %><br>
1 ~ 100까지의 홀수의 합 : <%=oddSum %><br>



<p>

선언문<br>
<%!
	String str = "hello";
	int a = 10;
%>
str : <%= str %>  -> str은 잘 출력된다. 

변수의 출력이 스크립틀릿 아래에 존재한다면 잘 출력되지만 위에 존재한다면 오류가 발생한다.

선언문 -> 스크립틀릿 옆에 느낌표를 붙이면 된다. 
<%! %>  이렇게 하면 변수선언보다 변수의 호출 및 사용(출력)이 위에 있다고 하더라도 정상적으로 잘 출력된다. 
메모리공간에 미리 올려둠으로서 어디에서든 사용 가능하다.(정적으로 미리?)


메소드
<%!
	public void test(){
		a = 1000;
}
//한가지 유의할점은 int a를 선언한 문장이 선언문이 아닌 단순 스크립틀릿문이라면 스캐너가 해당 줄에 가서 변수 a를 만드는 식인데(동적)
//test메소드가 있는 스크립틀릿문이 선언문(!) 이라면 test()메소드를 먼저 구성하려 한다. 그런데 존재하지 않는 a에 값을 넣는 메소드라고?? 무슨말이야?? 하고 이해를 못하게 됨. 컴퓨터는...
//따라서 a라는 변수를 쓰는 메소드가 선언문에 있으므로 변수 a의 선언도 선언문스크립틀릿 안에 존재해야한다.
//다만 a변수 선언 스크립틀릿 선언문이 메소드 정의 스크립틀릿 선언문 앞에 있든 뒤에 있든 상관은 없는걸까. 선언문끼리도 어떤 메모리상에올라가는 순서가 존재한다면 a변수 선언을 메소드 정의 앞에다가 둬야할텐데.
//하나의 선언문에 같이 쓴다고 한다면 당연히 a변수 선언을 앞에다가 써야겠다만..

//선언문은 정적(static)방식같은 느낌이라면 ->  내부에 쓰이는 메소드나 변수들은 static으로 둘 필요가 없는걸까
//선언문이 아닌 일반 스크립틀릿문에서 static으로 해도 될 듯
//전부다 static으로 하려면 단순히 선언문형식으로 하면 되고, 일부만 static으로 만드려면 단순스크립틀릿으로 작성하고 개별적으로 static사용?
%>


<%="test()함수 호출 전 a : " + a %><br>
<%test(); %>
<%= "test()함수 호출 후 a : "+ a %><br>

<p>
아래와 같이 기본 변수에 값이 저장되어 있다. 그 변수들의 절대값을 구하는 함수를 만드시오.
1 ~ 10까지의 합을 구하는 함수를 만드시오 (오른쪽 결과처럼 만드시오.)
단, 메소드에서는 매개변수로 값을 받고 return으로 값을 돌려주도록 구성
(변수부, 메소드부, 출력부 3단계로 나눠서 표현)<br>

<%! 
int c = 5, d = -5;
int start=0, end=10;
%>
<%!

	public int absolute(int k){
	return Math.abs(k);
}	//if문으로 양수값이냐 음수값이냐를 구분짓고 -1을 곱할지 곱하지 않을지를 판단후에 반환하는 방식으로 메소드 구성 가능. 나는 Math클래스의 static메소드를 이용함
	
	
	int plusSum=0;
	public int totalSum(int start, int end){
		for(int i = start; i<=end;i++){
			plusSum+=i;
		}
	return plusSum;
}
%>
변수부와 메소드부 둘다 굳이 뭐.. 선언문방식일 필요는 없는 것 같은데.. 출력부가 어차피 아래에 존재할거라면.
<br>
5의 절대값 : <%= absolute(c) %><br>
-5의 절대값 : <%= absolute(d) %><br>
1부터 10까지의 합 : <%= totalSum(start, end) %><br>
신기한 점은 페이지에서 새로고침을 할 때마다 plusSum에 계속 55값만 나오는게 아닌 55씩 지속누적한다는 점
즉 웹페이지를 종료하지 않는한 메모리상에 변수가 계속 살아있는 듯한 느낌<br>




<p>
<h1>선생님 풀이</h1><br>

<%!
	public int abs(int n){	
		if (n<0){
			n=-n;
		}
		return n;
}


	public int sumFunc(int sum, int cnt){
		for(int i = 1; i<=cnt; i++){
			sum+=i;
		}
		return sum;
	}
%>

<%! 
int a1 = 5, b1=-5;
int sum1=0, cnt1=10;
%>

<% 
out.print(a1+"의 절대값 : "+abs(a1)+"<br>");   //<br>태그를 출력메소드 밖에 쓸 수는 없네.
out.print(b1+"의 절대값 : "+abs(b1)+"<br>");
out.print("1 ~ 10까지의 합 : "+sumFunc(sum1, cnt1)+"<br>");
%>
<br>
메모리공간에 값이 계속 올려져있어서 웹페이지를 새로고침하면 값은 계속 올라간다.(계속 1 ~ 10까지 합 지속 누적)<br>
웹페이지를 종료하는 순간 메모리에서 변수는 삭제<br>


</body>
</html>