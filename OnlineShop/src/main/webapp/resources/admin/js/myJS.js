/**
 * 
 */
function deleteShipper() {
	var doIt = confirm("Do you want to delete this?");
	if (doIt) {
		alert("Accepted Delete!");
		return true;
	} else {
		alert("Cancel Delete!");
		return false;
	}
}