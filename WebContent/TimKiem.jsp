<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="div_center_mid">
	<h2>Tìm kiếm</h2>
	<center>
		<form method="post" class="form-inline" style="margin: 50px 0 50px;">
			<div class="form-group">
				<input type="text" class="form-control" id="strSearch"
					placeholder="Nhập mã nhân viên...">
			</div>
			<button type="button" class="btn btn-default" onclick="search()">Tìm
				kiếm</button>
		</form>
	</center>
	<div id="div_result_search"></div>
</div>
<script type="text/javascript">
	function search() {

		var http = new XMLHttpRequest();
		http.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
			$("#div_result_search").html(this.responseText);
			}
		}

		link = "XuLy\\TimKiem.jsp?strSearch="
				+ document.getElementById("strSearch").value;
		http.open("POST", link, true);
		http.send();
	}
</script>