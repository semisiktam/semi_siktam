<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>admin mode</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/siktam/resources/css/admin_4.css">

  
  <style>

  </style>
</head>
<body style="height:1080px">

<%@ include file="common/admin_header.jsp" %>

<div class="container" style="margin-top:50px">
  <div class="title">
    <h1><b>공지사항 관리</b></h1>
  </div>

  <div class="pagesearch">
    <div class="search">
      <input class="form-control input-lg" id="inputlg" type="text">
      <button style="border-radius: 6px;" ><span class="glyphicon glyphicon-search" style="color: white; font-size: 18px;"></span></button>
    </div>
    <div class="page">
      <ul class="pagination">
        <li class="active"><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#">6</a></li>
        <li><a href="#">7</a></li>
        <li><a href="#">8</a></li>
        <li><a href="#">9</a></li>
        <li><a href="#">></a></li>
        <li><a href="#">>></a></li>
      </ul>
    </div>
    <!-- class page -->
  </div>

  <div class="tbl">
    <table class="table table-hover" id="tbl">
      <tr>
        <th colspan="2">제목</th>
        <th colspan="4">내용</thcolspan="4">
          <th class="text-right">
            <a href="/siktam/resources/api/smarteditor/SmartEditor2Skin.html"><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#addmember" id="registerBtn">등록</button></a>
          </th>
      </tr>
      <tr>
        <td colspan="2">[#3] 10.1 패치 노트 (수정)
        </td>
        <td colspan="4" style="overflow: auto;">
          이번 패치에서는 지하세계의 거물인 세트를 만나보실 수 있으며, 리그 오브 레전드의 또 다른 나쁜 남자인 사일러스를 위한 큰 업데이트가 적용됩니다. 사일러스 변경사항의 주목적은 사일러스를 대표하는 돌격형 전사 방식의 플레이 스타일을 유지하면서도 사일러스가 중단 공격로에서 더 많이 사용되도록 하는 것입니다.
        </td>
        <td align="right">
          <a href="/siktam/resources/api/smarteditor/SmartEditor2Skin.html"><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modmember">수정</button></a>
          <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delmember">삭제</button>
          <!-- Modal -->
          <div id="delmember" class="modal fade" role="dialog">
            <div class="modal-dialog">

              <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title">공지 삭제</h4>
                </div>
                <div class="modal-body">
                  <p>해당 공지를 삭제하시겠습니까?</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">네</button>
                  <button type="button" class="btn btn-danger" data-dismiss="modal">아니요</button>
                </div>
              </div>

            </div>
          </div>
        </td>
      </tr>
      
      <!-- 1행끝 -->

      <tr>
        <td colspan="2">[#3] 10.1 전략적 팀 전투 패치 노트 (수정)</td>
        <td colspan="4" style="overflow: auto;">
          새해 복 많이 받으시길 바라며 올해에도 전략적 팀 전투와 함께 알찬 한 해 보내세요. 올해 첫 패치는 밸런스 변경사항과 함께 신규 특성 1개, 신규 챔피언 2명, 기존의 몇몇 아이템을 대체하는 신규 아이템 3개가 포함되어 있는 대규모 패치입니다. 신규 특성 달이 도입되어 방어 중심적인 팀 조합이 힘을 얻게 되며 레오나와 카르마를 결투장에서 보실 수 있게 됩니다. 또한 일부 아이템이 장착한 챔피언의 등급에 따라 더 강력한 효과를 발휘하며, 빛 효과와 빛 챔피언들이 상향 조정되었습니다.
        
        </td>
        <td align="right">
          <a href="/siktam/resources/api/smarteditor/SmartEditor2Skin.html"><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modmember">수정</button></a>
          <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delmember">삭제</button>

          <!-- Modal -->
          <div id="delmember" class="modal fade" role="dialog">
            <div class="modal-dialog">

              <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title">공지 삭제</h4>
                </div>
                <div class="modal-body">
                  <p>해당 공지를 삭제하시겠습니까?</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">네</button>
                  <button type="button" class="btn btn-danger" data-dismiss="modal">아니요</button>
                </div>
              </div>

            </div>
          </div>
        </td>
      </tr>
      <!-- 2행끝 -->

      <tr>
        <td colspan="2">9.24B 전략적 팀 전투 패치 노트
        </td>
        <td colspan="4" style="overflow: auto;">
          9.24b 전략적 팀 전투 패치를 확인하실 시간입니다. 이번 패치에서는 일반적인 밸런스 변경사항과 함께 3성 챔피언의 능력치 증가량이 변경됩니다. 3성 챔피언 완성 시 증가하는 체력과 공격력이 약간 줄어드는 대신 스킬 위력이 증가하도록 변경됩니다.
        </td>
        <td align="right">
          <a href="/siktam/resources/api/smarteditor/SmartEditor2Skin.html"><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modmember">수정</button></a>
          <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delmember">삭제</button>

          <!-- Modal -->
          <div id="delmember" class="modal fade" role="dialog">
            <div class="modal-dialog">

              <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title">공지 삭제</h4>
                </div>
                <div class="modal-body">
                  <p>해당 공지를 삭제하시겠습니까?</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">네</button>
                  <button type="button" class="btn btn-danger" data-dismiss="modal">아니요</button>
                </div>
              </div>

            </div>
          </div>
        </td>
      </tr>
      <!-- 3행끝 -->
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr><tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
    </table>
  </div>
  <!-- class tbl -->

</div>
<!-- class container -->



</body>
</html>
    