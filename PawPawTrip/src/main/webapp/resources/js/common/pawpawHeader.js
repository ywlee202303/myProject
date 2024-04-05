function footerSink()
{
	let windowHeight    = $(window).height();
	let htmlHeight      = $('html').outerHeight().toFixed(0);
	let bodyHeight      = $('body').outerHeight().toFixed(0);
	let navHeight       = $('nav.navbar').outerHeight().toFixed(0);
	let footerHeight    = $('footer').outerHeight();
	let containerHeight = (bodyHeight - navHeight - footerHeight).toFixed(0);
	let contentHeight   = 0;
	
	$('body>.content').each((idx, ele)=>{
		console.log($(ele).outerHeight());
		contentHeight   += $(ele).outerHeight();
	});
	contentHeight = Math.floor(contentHeight);
	
/*	console.log(`windowHeight    : ${windowHeight}
htmlHeight      : ${htmlHeight}
bodyHeight      : ${bodyHeight}
navHeight       : ${navHeight}
footerHeight    : ${footerHeight}
containerHeight : ${containerHeight}
contentHeight   : ${contentHeight}`); */
	
//	if(containerHeight > contentHeight)
//	{
//		$('#tempaltemo_footer').css('position', 'absolute');
//		console.log('absolute');
//	}
//	else
//	{
//		$('#tempaltemo_footer').css('position', 'relative');
//		console.log('relative');
//		$('body>.content>.container').removeAttr('height');
//	}
}

$(document).ready(()=>
{
	/********************** 서브메뉴 on 클래스 주기 - 시작 ***************************/
	//현재 URL 패턴에 맞게 메뉴에 on 클래스 추가
	let urlPatternSplit = window.location.pathname.split('/');
	let urlPattern = '';
	for(let idx = 2; idx < urlPatternSplit.length; idx++){
		urlPattern += '/' + urlPatternSplit[idx];				
	}
	$('li.nav-item ul a').each((idx, ele)=>{
		let menuUrlPatternSplit = $(ele).attr('href').split('/');
		let menuUrlPattern = '';
		for(let idx = 2; idx < menuUrlPatternSplit.length; idx++){
			menuUrlPattern += '/' + menuUrlPatternSplit[idx];				
		}
		$(ele).parent().removeClass('on');
		//현재URL 이 해당 메뉴와 같을때 on 클래스 추가
		if(urlPattern === menuUrlPattern)
		{
			$(ele).parent().addClass('on');
		}
	});
	/********************** 서브메뉴 on 클래스 주기 - 종료 ***************************/
	/********************** 푸터가 바닥으로 가기 위한 container-fluid height 설정 - 시작 ***************************/
//	$(window).resize(footerSink);
	
	
	
	/********************** 푸터가 바닥으로 가기 위한 container-fluid height 설정 - 종료 ***************************/
	/********************** 서브메뉴 hover이벤트 시작 ***************************/
	
	let menuSubId = false;//서브메뉴가 있는 ul의 id저장되어 hide()가 되지 않게 한다.
	
	$('.nav-item').on('mouseover', (event)=>
	{
		menuSubId = $(event.target).parent().children('ul.menu-sub').attr('id');
		
		//원인 불명, event.target이 되는 a태그 주변의 ul.menu-sub 의 id를 넣는다  
		if(menuSubId == undefined){
			menuSubId = $(event.target).parents('ul.menu-sub').attr('id');
		}
		
		let windowsWidth = $(window).width();

		//모바일형태(992px 미만)로 메뉴가 보일때는 서브메뉴 보이지 않게
		if(windowsWidth>=992)
		{
			$('#submenu_bg').show();
			if(menuSubId == 'menuUlsecond'){
				$('#menuUlsecond').show();
				$('#menuUlthird').hide();
			}
			else if(menuSubId == 'menuUlthird'){
				$('#menuUlsecond').hide();
				$('#menuUlthird').show();
			}
			else{
				$('#menuUlsecond').hide();
				$('#menuUlthird').hide();
				$('#submenu_bg').hide();
			}
		}
	});
	$('.nav-item').on('mouseleave', (event)=>
	{
		//event.preventDefault();
		//event.stopPropagation();
		let windowsWidth = $(window).width();

		//모바일형태(992px 미만)로 메뉴가 보일때는 서브메뉴 보이지 않게
		if(windowsWidth>=992)
		{
			if(menuSubId == 'menuUlsecond'){
				$('#menuUlsecond').show();
				$('#menuUlthird').hide();
			}
			else if(menuSubId == 'menuUlthird'){
				$('#menuUlsecond').hide();
				$('#menuUlthird').show();
			}
		}
	});
	$('#submenu_bg').on('mouseleave', (event)=>
	{
		$('#menuUlsecond').hide();
		$('#menuUlthird').hide();
		$('#submenu_bg').hide();
	});
	/********************** 서브메뉴 hover이벤트 종료 ***************************/
	
	$('div.afterWeather').draggable();
	
	//footerSink();	
})