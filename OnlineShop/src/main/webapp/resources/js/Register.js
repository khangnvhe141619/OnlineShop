function validatePhone(phone) {
	let isPhone = /^[0-9]{7,11}$/;
	return isPhone.test(phone);
}

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

	var email = document.getElementById("email").value;
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if (email.length > 50) {
		alert("Email must be less than 50 characters in length!");
		return false;
	} else if (!email.match(mailformat)) {
		alert("You have entered an invalid email address!");
		return false;
	}

	var phone = document.getElementById("phone").value;
	if (!validatePhone(phone)) {
		alert("Phone number must be minimum 7 positive integers");
		return false;
	} else if (phone === "" || phone == null) {
		alert("Phone is not empty!")
		return false;
	}
}