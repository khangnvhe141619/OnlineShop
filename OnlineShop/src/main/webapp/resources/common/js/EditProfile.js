function validatePhone(phone) {
	let isPhone = /^[0-9]{7,11}$/;
	return isPhone.test(phone);
}

function Validate() {

	var firstname = document.getElementById("fullname").value;
	if (firstname.length > 50) {
		alert("First name must be less than 50 characters in length!");
		return false;
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

	var phone = document.getElementById("phonenumber").value;
	if (!validatePhone(phone)) {
		alert("Phone number must be minimum 7 positive integers");
		return false;
	} else {
		alert('Update Successful!');
	}
}

function checkPassword() {
	var newPass = document.getElementById("newpass").value;
	var rePass = document.getElementById("repass").value;
	var reg = new RegExp('^[a-zA-Z0-9]{2, 4}');

	if (newPass == rePass) {
		return true;
	} else {
		alert("Re-password must match New-password")
		return false;
	}
}
