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
		            
		
});