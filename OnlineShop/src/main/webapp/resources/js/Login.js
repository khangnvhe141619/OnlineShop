function Validate() {

    var email = document.getElementById("email").value;
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (email.length > 50) {
        alert("Email must be less than 50 characters in length!");
        return false;
    } else if (!email.match(mailformat)) {
        alert("You have entered an invalid email address!");
        return false;
    }
    return true;
}

function validateLogin() {

    var email = document.getElementById("email").value;
    if (email.length > 50) {
        alert("Email must be less than 50 characters in length!");
        return false;
    } 

    var password = document.getElementById("password").value;
    if (password == "" || password == null) {
        alert("Password is not empty!")
        return false;
    } else if (password.length > 50) {
        alert("Password must be less than 50 characters in length!");
        return false;
    }
    return true;
}