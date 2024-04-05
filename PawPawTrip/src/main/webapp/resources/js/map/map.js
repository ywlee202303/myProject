// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
// 별도의 이벤트 메소드를 제공하지 않습니다
var markers   = new Array();
var overlays= new Array();
window.onload = function()
{
    var container              = document.getElementById('map');               //지도를 담을 영역의 DOM 레퍼런스
    var options                = {                                             //지도를 생성할 때 필요한 기본 옵션
        center                 : new kakao.maps.LatLng(37.567928, 126.983049), //지도의 중심좌표.
        level                  : 12  ,                                         //지도의 레벨(확대, 축소 정도)
        draggable              : true,
        disableDoubleClickZoom : true
    };
    var map                    = new kakao.maps.Map(container, options);       //지도 생성 및 객체 리턴
    var clusterer              = new kakao.maps.MarkerClusterer({              // 마커들을 모아서(클러스터) 전체지도에서 구역별로 집계를 내주는 클러스트 지도
        map                    : map ,                                         // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter          : true,                                         // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel               :   10,                                         // 클러스터 할 최소 지도 레벨
        disableClickZoom       : true                                          // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
    });

    var zoomControl            = new kakao.maps.ZoomControl();                 // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
    map.addControl(zoomControl, kakao.maps.ControlPosition.BOTTOMRIGHT);       // 바닥오른쪽부터 컨트롤이 쌓일수 있게 한다.

    showMarkers(map, clusterer);                                               //장소를 지도에 뿌린다.

    document.getElementById('searchBtn').addEventListener('click', ()=>        //검색 버튼 클릭 이벤트
    {
        showMarkers(map, clusterer);                                           //장소를 지도에 뿌린다.
    });
    
    document.getElementById('searchKeyword').addEventListener('keyup', (event)=>  //검색창 엔터 이벤트
    {
        if(event.key == 'Enter')
        {
            showMarkers(map, clusterer);                                           //장소를 지도에 뿌린다.
        }
    });

    var geocoder               = new kakao.maps.services.Geocoder();           // 주소-좌표 변환 객체를 생성합니다
    //var imageSrc               = '/pawpawtrip/img/common/favSiteMarker.png';   // 마커이미지의 주소입니다
    var imageSrc               = '/pawpawtrip/img/trip/dog_icon.png';          // 마커이미지의 주소입니다
    var imageSize              = new kakao.maps.Size(30, 30);                  // 마커이미지의 크기입니다
    var imageOption            = {offset: new kakao.maps.Point(15, 15)};       // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
    var markerImage            = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption); // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var marker                 = new kakao.maps.Marker(
                               {
                                   map   : map,
                                   image : markerImage // 마커이미지 설정
                               });


    kakao.maps.event.addListener(map, 'click', function(mouseEvent, map)             // 지도에 클릭 이벤트를 등록합니다
    {                                                                           // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
        var addressInfo = document.getElementById('addressInfo');               // 주소      정보를 보여줄 DIV
        var clickLatlng = document.getElementById('clickLatlng');               // 위도 경도 정보를 보여줄 DIV
        var eventlatlng = mouseEvent.latLng;                                    // 클릭한 위도, 경도 정보를 가져옵니다

        addressInfo.innerHTML = '';
        
        for(let overlay of overlays)
        {
            console.log(overlay);
            overlay.setMap(null);
            
        }
        
        marker.setPosition(eventlatlng);                                        // 마커 위치를 클릭한 위치로 옮깁니다

        clickLatlng.innerText = '클릭한 위치\n위도 : ' + eventlatlng.getLat() + '\n경도 : ' + eventlatlng.getLng();

        geocoder.coord2RegionCode(eventlatlng.getLng(), eventlatlng.getLat(), coordToRegion); // 좌표로 행정동      주소 정보를 요청합니다
        geocoder.coord2Address(   eventlatlng.getLng(), eventlatlng.getLat(), coordToAdress); // 좌표로 법정동 상세 주소 정보를 요청합니다
    });


    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster)
    {
        // 현재 지도 레벨에서 1레벨 확대한 레벨
        var level = map.getLevel()-1;

        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
        map.setLevel(level, {anchor: cluster.getCenter()});
    });

    // 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'zoom_changed', function()
    {
        // 지도의 현재 레벨을 얻어옵니다
        document.getElementById('zoomInfo').innerHTML = '현재 지도 레벨은 ' + map.getLevel() + ' 입니다';
    });
}//onload function End


// 좌표로 행정동      주소 정보를 요청하는 콜백함수
function coordToRegion(result, status)
{
    var infoDiv = document.getElementById('addressInfo');

    if (status === kakao.maps.services.Status.OK)
    {
        for(var i = 0; i < result.length; i++)
        {
            if (result[i].region_type === 'H')  // 행정동의 region_type 값은 'H' 이므로
            {
                addressInfo.innerText = addressInfo.innerText + '[행정동 주소]\n' + result[i].address_name;
                break;
            }
        }
    }
};
// 좌표로 법정동 상세 주소 정보를 요청하는 콜백함수
function coordToAdress(result, status)
{
    var addressInfo = document.getElementById('addressInfo');
    if (status === kakao.maps.services.Status.OK)
    {
        var content     = '';
        content        +=  '[법정동 주소]\n';
        content        +=  result[0].road_address ? '도로명주소 : ' + result[0].road_address.address_name + '\n' : '';
        content        +=  '지번 주소 : ' + result[0].address.address_name + '\n';

        addressInfo.innerText = addressInfo.innerText + '\n' +content;
    }
}
// DB에서 좌표정보를 가져와 지도에 좌표를 전달한다.
function showMarkers(map, clusterer)
{
    let searchKeyword     = document.getElementById('searchKeyword').value;
    let searchContentType = document.getElementById('searchContentType').value; 
    let data              = {searchKeyword , searchContentType};

    $.ajax(
    {
        type : 'GET',
        url  : '/pawpawtrip/map/getPosition',
        data : data,
        success:function(data)
        {
            var imageSrc    = '/pawpawtrip/img/common/favSiteMarker2.png'; // 마커이미지의 주소입니다
            var imageSize   = new kakao.maps.Size(20, 23);                 // 마커이미지의 크기입니다
            var imageOption = {offset: new kakao.maps.Point(10, 20)};      // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

            clusterer.clear();
            markers = new Array();
            console.log(data);

            // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
            var markerImage    = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

            for (var i = 0; i < data.positions.length; i ++)
            {
                var pos    = data.positions[i];
                var marker = new kakao.maps.Marker(
                {
                    map      : map,
                    position : new kakao.maps.LatLng(pos.mapy, pos.mapx),
                    title    : pos.title,  // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                    image    : markerImage // 마커이미지 설정
                });

                //var baseImage = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png';
                var baseImage = '/pawpawtrip/img/common/replacedImage.png';
                var content   = '<div class="wrap">' +
                                    '<div class="info">' +
                                        '<div class="title">' + pos.title + '</div>' +
                                        '<div class="body">' +
                                            '<div class="img">' +
                                                '<img src="'+ (pos.image==null?baseImage:pos.image) +'" width="73" height="70">' +
                                            '</div>' +
                                            '<div class="desc">' +
                                                '<div class="ellipsis">'+ pos.address +'</div>' +
                                                '<div class="jibun ellipsis">' + (pos.tel==null?'': '(tel) ' + pos.tel) +'</div>' +
                                                '<div style="margin-top: 8px;margin-left: 113px;"><a href="http://localhost:8080/pawpawtrip/trip/'+ (pos.contenttypeid=='12'?'spot/spotDetail?id=':'stay/stayDetail?id=') + pos.contentid + '" class="link">상세보기</a></div>' +
                                            '</div>' +
                                        '</div>' +
                                    '</div>' +
                                '</div>';
                // 마커 위에 커스텀오버레이를 표시합니다
                // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
                overlay = new kakao.maps.CustomOverlay(
                {
                    content  : content,
                    map      : null, //먼저 지도에는 표시하지 않는다.
                    position : marker.getPosition()
                });


                overlays.push(overlay);

                // 데이터에서 좌표 값을 가지고 마커를 표시합니다
                // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
                markers.push(marker);


                //마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
                //클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
                (function(marker, overlay)
                {
                    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
                    kakao.maps.event.addListener(marker, 'click', function(event)
                    {
                        overlay.setMap((overlay.getMap()==null?map:null));//커스텀오버레이 on/off 기능
                    });
                })(marker, overlay);
            }// for 문 END

            // 클러스터러에 마커들을 추가합니다
            clusterer.addMarkers(markers);
        },//success END
        error: function(error)
        {
            console.log(`error : ${error}`);
        }
    });
}