function showMes(id) {
	var option = confirm('Are you sure to delete' + id);
	if (option === true) {
		window.location.href = 'DeleteController?id=' + id;
	}
}

function showCheck() {
	var departmentName = document.getElementById("departmentName").value;
	if (departmentName.length > 50) {
		alert("Department name must be less than 50 characters in length!");
	} else {
		alert("Add Department Successfully!");
	}
}