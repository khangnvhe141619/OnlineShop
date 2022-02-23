
function Validate() {

	var username = document.getElementById("username").value;
	if (username.length > 50) {
		alert("User name must be less than 50 characters in length!");
		return false;
	} else if (username === "" || username == null) {
		alert("User name is not empty!")
		return false;
	}

	var password = document.getElementById("password").value;
	if (password === "" || password == null) {
		alert("Password is not empty!")
		return false;
	} else if (password.length > 50) {
		alert("Password must be less than 50 characters in length!");
	}

	var re_password = document.getElementById("re-password").value;
    if (re_password === "" || re_password === null) {
        alert("Re-Password is not empty!")
        return false;
    } else if (re_password != password) {
        alert("Re-Password must match the password!")
        return false;
    }
}