const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
    container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
    container.classList.remove("right-panel-active");
});
var userimg;
function onSignIn(googleUser) {
    document.getElementById("login").innerHTML = "";
    var profile = googleUser.getBasicProfile();
    var imagurl = profile.getImageUrl();
    userimg = profile.getImageUrl();
    var name = profile.getName();
    var email = profile.getEmail();
    document.getElementById("myImg").src = imagurl;
    document.getElementById("name").innerHTML = name;
    document.getElementById("myP").style.visibility = "hidden";
    document.getElementById("status").innerHTML = 'Welcome ' + name + '!<br><button style="color:white;">\n\
            <a href=success.jsp?email=' + email + '&imagurl=' + imagurl + '&name=' + name + ' style="color:white;"/>Continue with Google</a></button><br><br>\n\
            <button><a onclick="myFunction()" style="color:white;">Sign Out</a></button></p>'
}

function myFunction() {
    gapi.auth2.getAuthInstance().disconnect();
    window.location.href = "http://localhost:8080/project/";
}
function mychatFunction() {
    myFunction();
    history.go(-1);
}
