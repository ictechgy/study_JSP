<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>설문조사 결과</h1><p>

<% request.setCharacterEncoding("UTF-8"); %>

이름 : <%= request.getParameter("username") %><br>
소개 : <%= request.getParameter("introduce") %><br>
나이 : <%= request.getParameter("age") %><br>
취미 : <%= request.getParameter("hobby") %><br>



<p></p>

선생님 풀이

<% request.setCharacterEncoding("UTF-8"); %>

<%
	String name = request.getParameter("name");
	out.print("이름 : " + name + "<br>");
	out.print("소개 : " + request.getParameter("so")+"<br>");
	out.print("나이 : " + request.getParameter("age")+"<br>");
	out.print("취미 : " + request.getParameter("hobby")+"<br>");
%>

post방식으로 전송하였으므로 인코딩 필요

체크박스에 선택한 것을 다 표현하기 위해서는 다른 방식을 써야함 -> 반복문을 쓰면 된다.
체크박스들끼리 이름을 다 달리 하고 해당 공간에 값이 존재하는지를 검증 후 출력하는 방식도 될 것 같다..예를들어 hobby1, hobby2 등 이렇게 이름짓고 value까지 다 정해주었을 때
hobby2쪽에 체크가 안되어있다면.. hobby2라는 공간자체를 받는쪽에서는 못받는건지.. 아니면 그러한 공간은 있겠지만 value가 비어있는건지..
만약 그러한 공간은 있지만 value가 없는 상태로 받는거라면 위에서 말한대로 값이 존재하는지를 확인한 후에 출력하는 방식도 되긴 할거다.. 다만 코드가 좀 복잡해질 듯?
만약 그러한 공간조차 못받게 되는 형태라면.. 그러한 공간이 존재합니까.. 뭐 이런걸 코드로 작성해서 검증해줘야하나

value가 있는지 보고 있으면 출력하는 방식으로.. 흠


getParameter는 값을 하나만 가져오는 메소드(반환형은 String)

getParameterValues 같은 name으로 여러값이 올 경우 값을 끄집어 올 떄 쓰는 메소드  - 반환형태는 String[]
<% 
String[] s = request.getParameterValues("hobby"); 

for(int i = 0; i<s.length; i++){
	out.print(s[i]+"<br>");
}
%>
사실상 String배열은 참조를 두번해야하는 방식이라서.. s[i]는 참조를 한번건너간것 뿐이지만.. 출력메소드에서는 .toString으로서 작동하고 잘 오버라이딩되어있기때문에 잘 출력되는듯?

값을 가져온다고 해서 값이 사라지지는 않음. 단순히 getter일뿐이지 버퍼에서 가져오는 next같은게 아님
취미를 여러개 선택한다면 hobby라는 이름으로 여러개 값을 가진 String배열로 값이 던져지는 듯

배열을 출력할 때 Arrays.toString() 메소드도 있었다..(String배열은 두번참조하는 형태라서 참조한번 건넌상태의 그 배열들의 해시코드값이 쭉 뜰 듯)
.toString하면 다 출력되지 않을까? 배열쪽에서는 해당 메소드가 기본적으로 오버라이딩되어있을 것 같은데-> s.toString을 이야기하는 것 같은데.. String배열의 두번참조특성때문에 출력문안에서 쓰인다고 하더라도 참조는 한번 건넌상태에서,
s[인덱스]의 실질적인 값이 아닌 그 자체에 들어있는 값(해시코드?)가 출력될 듯

다른때(if문내에서의 비교라던가..)는 안되는데 출력문안에서의 toString메소드는 실질적 값을 출력할 수 있도록 해주고.. 생략해도 되는 부분이었다. 

getClass()	  hashCode()  			toString()  			equals()
클래스정보			해시값		    클래스정보와 getName및 해시값			해시값비교





체크가 안돼서 값이 없으면 NULL이 들어온다.(공간자체를 못받는걸까 아니면 공간은 받는데 그 안에 value가 없는걸까.. 공간자체를 못받는거같긴 한데.. 그래서 getter쓰면 null받는거고?)
그런데 값이 없는 경우 s에는 NULL값이 들어가는데, 반복문의 조건식에서 s.length를 보는데 s에는 실질적 공간이 존재하지도 않아서(참조할 다리가 존재하지도 않음)
길이측정 불가.. 마치 NULL.length한것처럼.. -> 오류가 뜨게 된다. 만약 사용자가 하나도 체크를 안하면..

따라서 if ( s!= null) 로 NULL이 아닐때에만 반복문 실행되도록 감싸줘야함
물론 에러에 대해서는 <%@ page errorPage='' %> 을 만들 수도 있겠지만

<%
if (s!= null){
	for(String a : s){  //s의 값 하나씩 가져와서 a에 저장하여 사용하는 방식. 파이썬의 for i in list와 비슷하다. 
		out.print(a + "<br>");  //a라고는 썼지만 a.toString을 쓴 것과 같으며 출력문에서 toString은 실질적 값을 가져다 주기 때문에 정상적 출력 가능
	}
	out.print("<br> ======================<br>");
	for (int i=0; i< s.length; i++){
		out.print(s[i]+"<br>");  //s[i].toString을 쓴 것과 동일
	}
}
//else를 둬서 "취미를 하나도 선택하지 않으셨습니다"뭐 이런 메시지를 출력할 수도 있겠지..

//for each문이라고 하는데, 해당 for문은 리스트(확장형 배열)에서도 사용한다. 
//배열과 Set List Map<k,v>
/*
잠깐 복습해보자면, 배열은 그냥 길이가 정해져 있는 데이터저장소.

Set은 일정길이가 있지만 몇퍼센트정도 채우면 길이를 늘려주는 데이터 저장소. 단순히 데이터를 저장하고 가져다가 쓰기때문에 값의 중복이 불가능하고 값끼리의 구분자가 존재하지 않는다. 당연히 순서도 존재하지 않음
따라서 그 값을 쓸 경우 iterator()메소드를 쓴 뒤, Iterator참조형변수로 받아서 iterator객체를 만들어서 여러 메소드를 통해서 썼다.
iterator객체가 완성되면 Set이 가리키고 있는 공간들을 같이 가리키고 있는데 다만 순서가 존재하는 상태이다. 그리고 데이터들이 있는만큼만 공간이 만들어진 상태..
next메소드 - 쓰면은 iterator객체상에서 참조형변수가 하나씩 사라지는 형태. 실질적 공간이 사라지는 것은 아님
또, iterator쪽에서 값을 삭제하면 그건 Set쪽에서도 반영되지만 Set쪽에서 삭제하면 iterator객체쪽에서는 반영되지 않는다. 

List는 일정길이가 있으며 공간을 다 채울 경우 공간이 늘어나는 방식의 데이터 저장소. 각각의 값들은 인덱스번호로 구분지으며 값의 중복이 가능하고, 인덱스번호로서 그 값을 뽑아다가 쓸 수 있다.

Map은 Key와 Value로 구성되어있으며 Map.entry<k,v>의 집합이다. 밸류를 키로 구분지어 데이터를 저장한다. 따라서 밸류가 중복될 수는 있어도 키값이 중복될 수는 없다. 
메소드들중에 keySet()이 존재했는데, 이는 키값들을 Set데이터형태로 반환하는 메소드였다. Set형태로 반환한 키값을 이용해서 for each반복문이나 iterator를 쓴 뒤 모든 밸류에 대해 접근하도록 만들 수 있었다. get(key)메소드 사용
entrySet()메소드는 Set형태로 모든 키-밸류 묶음을 반환하는 메소드이다. 즉, Set의 한 공간 한공간마다 Map.entry(k,v)가 하나씩 통째로 묶여있는 형태로 존재.

자료형들에는 제네릭이라고 해서 <String>  <Integer> 등으로 데이터들의 타입을 지정할 수 있었다. <int>라고는 못씀
이 때 Integer라고 하면.. remove()같은 메소드를 쓸 때 remove(2) 라고 하면 실질적 값인 2를 없애라는건지 2번인덱스의 값을 없애라는건지 컴퓨터는 모르므로 그 부분을 명확히 해줘야 한다고 하셨다. 

*/

%>


데이터들을 가지고 있는 공간들의 이름 그 자체를 이용하여 편하게 출력해보자!

<%@ page import='java.util.Enumeration' %>     -> Enum과 같은 어떤 데이터집합소 자료형은 java.util쪽에 존재한다. 
<%
Enumeration e = request.getParameterNames();   //Object참조형변수로 가리키고 있어도 될 듯. 다형성
while(e.hasMoreElements()){
	String n = (String)e.nextElement();
	out.print(n+"<br>");
}
%>
iterator()라는 반복자.. 콜렉션중 Set콜렉션을 쓰기 위해서 썼었다. 

getParameterNames()는 value를 보내주는 공간들의 name들을 반환한다. 

getParameterNames()는 반환형이 Enum형이다. 
nextElement()는 Object형으로 값을 돌려줘서 String형변환을 하여 사용하도록 함

배열형태인 Enumeration...
e라는 값이 만들어지면
맨앞에는 BOF라는 문자가 존재. 그 다음에는 이전페이지에서 보내준 값들의 공간이름이 존재하고 끝에는 EOF가 존재한다.

hasMoreElement를 통해 다음값이 있느냐.. 현재 e는 BOF를 보고있는 상태(가리키는 상태)이고 그 다음값이 존재하는지를 보게 됨. 
따라서 값이 존재할 때에만 반복문의 종속문장이 실행
마지막 EOF만 남으면 e.hasMoreElement는 false가 됨

아래와같이 활용가능
<%
while (e.hasMoreElements()){
	String a = (String)e.nextElement();
	out.print(a+" : ");
	out.print(request.getParameter(a));
}
%>

다만 이렇게 만든다면 취미는 또 하나의 값만을 가져올 수 있음



</body>
</html>