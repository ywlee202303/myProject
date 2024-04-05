<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/css/about/about.css">

<main class="about-wrap">
        <div class="about-logo">
            <img src="${ path }/img/PAGE_NAME_ABOUT.png" alt="">
        </div>
        <div class="about-img">
            <img src="${ path }/img/ABOUT_PAGE_IMAGE.png" alt="">
        </div>
        <div class="about-intro">
            <div>
                <img src="${ path }/img/aboutrestay.png" alt="">
                <div class="about-title">
                    <p>여행지에서 머무는 장소,</p>
                    <p>좋은 잠자리 문화를 선도하고 있는</p>
                    <p>STAY를 큐레이팅합니다.</p>
                </div>
            </div>
            <div class="about-content-wrap">
                <div>
                    <p>
                        머무는 장소는 누구에게나 추억을 선사합니다. 이러한 추억이라는 효용을 극대화하기 위해 장소를 선택하는
                        다양한 과정이 존재합니다. 아무런 사전 준비 없이 발걸음이 닿는 대로 우연히 빌리게 된 숙소에서 낯선 도시
                        에서의 하룻밤을 보내게 되기도 하고, 때로는 사랑하는 사람과의 특별한 추억을 만들기 위해 며칠씩 치열한 고민을 
                        거듭하여 장소를 찾게 되는 경우도 있습니다. 그렇게 여러 경로를 통해 만나게 된 특별한 장소와의 교감 
                        내지는 공간에서 누릴 수 있는 가치를 공유할 수 있는 장을 만들고 싶었습니다.
                    </p>
                </div>
                <div>
                    <p>
                        리스테이(RESTAY)는 머물고 싶은 집을 뜻하는 “STAY”와 관점을 갖고 휴식을 취한다는 의미의 “REST”의 
                        합성어로서 어원이 지니는 의미 그대로 편하게 휴식을 취하며 머물고 싶은 좋은 스테이 소개하는 플랫폼입니다. 
                        여행지에서 하룻밤을 편안하게 보낼 수 있는 잠자리 공간을 선별하여 소개하기 위해 바람직한 숙박문화를
                        선도하고 있는 분들의 이야기를 엮어 이를 소비하는 여행자들과의 소통, 연결을 도모하는 채널로 
                        기획되었습니다.
                    </p>
                </div>
                <div>
                    <p>
                        리스테이의 취재는 호스트의 열망과 꿈을 담은 스테이를 대상으로 합니다. 여행자들에게 좋은 잠자리를 
                        제공해 주어 바람직한 여행문화를 선도하고 있는 작지만 독창적인 매력을 지닌 다양한 유형의 스테이를 취재의 
                        범주로 삼습니다. 취지와 동일한 맥락에서 지역의 가치에 부합하고 호스트의 열망으로 만들어진 장소로서 
                        여행자의 오감을 만족시킬 수 있는 곳이라면 방 한 칸에 불과한 공간이라도 역시 취재의 범주에 포함시킵니다.
                    </p>
                </div>
                <div>
                    <p>
                        리스테이는 좋은 장소, 공간을 만들어가려는 사람들과 이를 소비하는 실제 여행자를 위한 정보의 교류 및 
                        소통의 장이 되어 지역 문화 내지는 여행 문화의 질적 향상을 도모합니다. 궁극적으로 지역과 사람, 장소에 대한 
                        가치를 보다 높여주는 스테이에 대한 관심과 이러한 장소를 만들고자 하는 열망을 일깨울 수 있는 의미 있는 
                        채널로 자리매김하고자 합니다.
                    </p>
                </div>
            </div>
        </div>
    </main>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />