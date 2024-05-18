$(document).ready(() => {
		$(".search-1").click(function(){
			$(".modal-wrap").fadeIn();
		});
		
		$(".modal-close").click(function(){
		    $(".modal-wrap").fadeOut();
		});
		
		$(".search-2").on('click', () => {
		    $(".modal-wrap-2").fadeIn();
		});
		
		$(".modal-when-close").on('click', () => {
		    $(".modal-wrap-2").fadeOut();
		});
		
		// 달력
		$('input[name="datefilter"]').daterangepicker({
		    autoUpdateInput: false,
		    locale: {
		    	applyLabel: "확인",
		        cancelLabel: "취소"
		    }
		});
		
		$('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
		    $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
		});
		
		$('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
		    $(this).val('');
		});
		
		//스테이 검색 - 국내지역 선택시 발생하는 이벤트
		$('.modal-location button.item').click((event)=>{
			$('.modal-brand button.item').removeClass('selected');
			
			//전체를 선택하면 다른 지역은 선택해제
			if(event.target.innerText === '전체')
			{
				$('.modal-location button.item').removeClass('selected');
			}
			event.target.classList.toggle('selected');
		});
		//스테이 검색 - 브랜드 선택시 발생하는 이벤트
		$('.modal-brand button.item').click((event)=>{
			$('.modal-location button.item').removeClass('selected');
			event.target.classList.toggle('selected');
		});

		//검색버튼 클릭했을때
		$('#btnSearch').on('click', ()=>
		{
			if($('.modal-location button.item.selected').length != 0)
			{
				$('.modal-location ul>input').remove();
				$('.modal-location button.item.selected').each((index, element) => {
					$('.modal-location ul').append('<input type="hidden" name="searchLocationKewords" value="'+ $(element).text() +'">');
				});
			}

			if($('.modal-brand button.item.selected').length != 0)
			{
				$('.modal-brand ul>input').remove();
				$('.modal-brand button.item.selected').each((index, element) => {
					$('.modal-brand ul').append('<input type="hidden" name="searchBrandKewords" value="'+ $(element).text() +'">');
				});
			}
			$('#formSearch').trigger('submit');
		});
});

//새로고침버튼 클릭했을때 이벤트 - 언제떠날까요는 기능안함
function clearSelected()
{
	$('.modal-brand button.item').removeClass('selected');
	$('.modal-location button.item').removeClass('selected');
}