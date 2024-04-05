window.onload = function(){
    let btn1 = document.getElementById('btn1');
    btn1.addEventListener('click', ()=>{
        // 1. XMLHttpRequest 객체 생성
        let xhr = new XMLHttpRequest();

        // 2. onreadystatechange에 콜백 함수 지정
        // - 비동기 통신에 대한 응답 상태에 변경이 있을 경우 실행된다.
        xhr.onreadystatechange = ()=> {
            console.log(`readyState : ${xhr.readyState}`);

            // 0 (uninitialized) - (request가 초기화되지 않음)
            // 1 (loading)       - (서버와의 연결이 성사됨)
            // 2 (loaded)        - (서버가 request를 받음)
            // 3 (interactive)   - (request(요청)을 처리하는 중)
            // 4 (complete)      - (request에 대한 처리가 끝났으며 응답할 준비가 완료됨)
            if(xhr.readyState === 4){
                /*
                status : HTTP 응답 상태 코드
                    200 : OK
                    404 : Not Found
                    500 : Internal Server Error
                    ...
                    
                    (https://developer.mozilla.org/ko/docs/Web/HTTP/Status)
                */
                if(xhr.status ===200){
                    //서버에서 응답한 데이터를 담고 있는 속성
                    console.log(xhr.responseText);
                    document.getElementById('p1').innerHTML = xhr.response;
                }
            }
        }; 

        // 3. open('요청 방식', 'URL', 비동기 여부) 메소드 호출
        xhr.open('GET', '/04_AJAX/jsAjax.do?name=홍길동&age=30');

        // 4. send() 메소드 호출
        // - 위 정보를 참조해서 서버에 요청을 한다.
        xhr.send();
    });
    
    let btn2 = document.getElementById('btn2');
    btn2.addEventListener('click', ()=>{
        let xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function(){
            if(xhr.readyState === 4 && xhr.status === 200){
                console.log(xhr.responseText);
                document.getElementById('p2').innerHTML = xhr.response;
            }
        }

        xhr.open('POST', '/04_AJAX/jsAjax.do');
        //POST 요청의 경우 send() 메소드 호출하기 전에 아래와 같이 요청헤더를 추가해야한다.
        xhr.setRequestHeader(
                'Content-Type',
                // 'application/x-www-form-urlencoded'
                'application/x-www-form-urlencoded;charset=UTF-8'
            )
        xhr.send('name=홍길동&age=30');
    });
}

$(document).ready(function(){
    $('#btn3').on('click',()=>{
        let input = $('#input').val();
        $.ajax({
            //전송방식
            type : 'GET',
            url : '/04_AJAX/jqAjax.do',//요청 URL
            data:{//요청시 전달할 파라미터 설정
                input//input: input
            },
            //AJAX 통신 성공시 실행될 콜백 함수
            success:function(data){
                console.log(data);
                $('#output1').val(data);
            },
            //AJAX 통신 실패시 실행될 콜백 함수
            error: function(data){
                console.log(data);
            }
        });
    });

    $('#btn4').on('click',()=>{
        let userName = $('#userName').val();
        let userAge  = $('#userAge').val();
        
        $.ajax({
            type : 'POST',
            url : '/04_AJAX/jqAjax.do',
            data:{
                userName,
                userAge
            },
            success:function(data){
                console.log(data);
                $('#output2').val(data);
            },
            error: function(error){
                console.log(`status : ${error.status}`);
            }
        });
    });
    $('#userNo').on('keypress',function(event){
        if(event.key == 'Enter'){
            ajaxFunc();
        }
    });
    $('#btn5').on('click',ajaxFunc);

    $('#btn6').on('click',()=>{
        let gender = $('input[name=gender]:checked').val();

        $.ajax({
            type : 'GET',
            url : '/04_AJAX/jsonArrayAjax.do',
            dataType: 'json',
            data:{
                gender
            },
            success : (list) =>{
                console.log(list);
                let result = '';

                if(list === null){
                    result = '사용자 정보가 없습니다.';
                }
                else{
                    list.forEach(element => {
                        result += `회원 번호 : ${element.no}<br>`;
                        result += `회원 이름 : ${element.name}<br>`;
                        result += `회원 나이 : ${element.age}<br>`;
                        result += `회원 성별 : ${element.gender}<br><br>`;
                    });
                }
                $('#p4').html(result);

            },
            error : (error) =>{
                console.log(error);
            }
        });
    });
});
let ajaxFunc = function(){

    let userNo = $('#userNo').val();

    $.ajax({
        type:'GET',
        url: '/04_AJAX/jsonAjax.do',
        data:{
            userNo//userNo : userNo
        },
        success:(obj)=>{
            console.log(obj);
            let result = '';

            if(obj === null){
                result = '사용자 정보가 없습니다.';
            }
            else{
                result  = `회원 번호 : ${obj.no}<br>`;
                result += `회원 이름 : ${obj.name}<br>`;
                result += `회원 나이 : ${obj.age}<br>`;
                result += `회원 성별 : ${obj.gender}<br>`;
            }
            $('#p3').html(result);
        },
        error : (error)=>{
            console.log(`status : ${error.status}`);
        }            
    });
}