<!DOCTYPE html>
<html lang="en" >
    <head>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'>
        <link rel="stylesheet" href="./style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta name="google-signin-client_id" content="<<--replace with google client id -->>">
    </head>

    <body>
        <h2>Sign in/up Form</h2>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="createAcc.jsp">
                    <h1>Create Account</h1>
                    <span>or use your email for registration</span>
                    <input type="text" placeholder="Name" name="name" />
                    <input type="email" placeholder="Email" name="email"/>
                    <input type="password" placeholder="Password" name="pass"/>
                    <input type="cpassword" placeholder="Confirm Password" name="cpass"/>
                    <input type="File" placeholder="Select Image" name="images" accept="image/x-png,image/gif,image/jpeg,image/jpg" />
                    <button type="submit">Sign Up</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="sign.jsp" method="post">
                    <h1>Sign in</h1>
                    <div class="social-container">
                        <div class="g-signin2" data-onsuccess="onSignIn" id="myP"></div>
                        <img id="myImg" class="myImg"><br>
                        <p id="name"></p>
                        <div id="status">
                        </div>
                    </div>
                    
                    <div id="login">
                        <span>or use your account</span>

                        <input type="email" placeholder="Email" name="email" required/>
                        <input type="password" placeholder="Password" name="password" required/>            
                        <button type="submit">Sign In</button>

                </form>
            </div>

        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Welcome Back!</h1>
                <p>To keep connected with us please login with your personal info</p>
                <button class="ghost" id="signIn">Sign In</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>Hello, Friend!</h1>
                <p>Enter your personal details and start journey with us</p>
                <button class="ghost" id="signUp">Sign Up</button>
            </div>
        </div>
    </div>
</div>
<script  src="./script.js"></script>

</body>
</html>
