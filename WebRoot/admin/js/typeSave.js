/**
 * ===商品类别管理===
 * 
 * @returns
 */

function checkName() {
	var name = $("#name").val();
	if (name == "" || (name.length < 1 || name.length > 12)) {
		$("#checku").html("名称不能为空且长度在1～12位之间！");
		$("input[id=name]").focus();
	} else {
		$("#checku").html("");
		$.ajax({
			url : "addType.do",
			type : "post",
			data : "name=" + name,
			dataType : "json",
			success : function(result) {
				if (result.info == "ok") {
					$("#checku").html("名称存在，请更换！");
					return false;
				} else {
					$("#checku").html("添加成功！");
					return true;
				}
			},
			error : function() {
				alert("请求失败！");
				return false;
			}

		});
	}

}

function checkUpdateName() {
	var name = $("#name").val();
	var tid = $("#tid").val();
	if (name == "" || (name.length < 1 || name.length > 12)) {
		$("#checku").html("名称不能为空且长度在1～12位之间！");
		$("input[id=name]").focus();
	} else {
		$("#checku").html("");
		$.ajax({
			url : "updateFtype.do",
			type : "post",
			data : {
				"name" : name,
				"id" : tid
			},
			dataType : "json",
			success : function(result) {
				if (result.info == "ok") {
					$("#checku").html("名称存在，请更换！");
					return false;
				} else {
					$("#checku").html("更新成功！");
					return true;
				}
			},
			error : function() {
				alert("请求失败！");
				return false;
			}

		});
	}
}

/**
 * ===车辆类别管理==
 */

function checkTypeDataName() {
	var name = $("#name").val();
	if (name == "" || (name.length < 1 || name.length > 12)) {
		$("#checku").html("名称不能为空且长度在1～12位之间！");
		$("input[id=name]").focus();
	} else {
		$("#checku").html("");
		$.ajax({
			url : "addTypeData.do",
			type : "post",
			data : "name=" + name,
			dataType : "json",
			success : function(result) {
				if (result.info == "ok") {
					$("#checku").html("名称存在，请更换！");
					return false;
				} else {
					$("#checku").html("添加成功！");
					return true;
				}
			},
			error : function() {
				alert("请求失败！");
				return false;
			}

		});
	}

}

function checkUpdateTypeDataName() {
	var name = $("#name").val();
	var tid = $("#tid").val();
	if (name == "" || (name.length < 1 || name.length > 12)) {
		$("#checku").html("名称不能为空且长度在1～12位之间！");
		$("input[id=name]").focus();
	} else {
		$("#checku").html("");
		$.ajax({
			url : "updateFtypeData.do",
			type : "post",
			data : {
				"name" : name,
				"id" : tid
			},
			dataType : "json",
			success : function(result) {
				if (result.info == "ok") {
					$("#checku").html("名称存在，请更换！");
					return false;
				} else {
					$("#checku").html("更新成功！");
					return true;
				}
			},
			error : function() {
				alert("请求失败！");
				return false;
			}

		});
	}
}