<%-- 
    Document   : ChatEnter
    Created on : 24 Apr, 2022, 7:24:10 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" href="./userstyle.css">
        <link rel="stylesheet" href="./style.css">
        <script  src="./script.js"></script>
        <style>
            .overlaystyle {
                background: #FF6767;
                background: -webkit-linear-gradient(to right, #FF4B2B, #FF6767);
                background: linear-gradient(to right, #FF4B2B, #FF6767);
                background-repeat: no-repeat;
                background-size: cover;
                background-position: 0 0;
                color: #FFFFFF;
                position: relative;
                transform: translateX(0);
                transition: transform 0.6s ease-in-out;
            }

        </style>
    </head>
    <body class="overlaystyle" style="margin: auto;">
        <div id="frame" >
            <div id="sidepanel" >
                <center> <%=email%></center>
                <div id="profile">
                    <div class="wrap">
                        <img id="ffprofile-img"  src='<%=img%>'class="online" alt="" />
                        <div >&nbsp;<%=name%><br>dsvdfv</div> 
                    </div>
                </div>
                <div id="search">
                    <label for=""><i class="fa fa-search" aria-hidden="true"></i></label>
                    <input type="text" placeholder="Search contacts..." />
                </div>
                <div id="contacts">
                    <ul>
                        <li class="contact">
                            <div class="wrap" style="box-sizing: 20px;">
                                <span class="contact-status online"></span>
                                <img src="http://emilcarlsson.se/assets/louislitt.png" alt="" />
                                <div class="meta" >
                                    <p class="name">Louis Litt</p>
                                    <p class="preview">You just got LITT up, Mike.</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div id="bottom-bar">
                    <button id="addcontact"><i class="fa fa-user-plus fa-fw" aria-hidden="true"></i> <span>Add contact</span></button>
                    <button onclick="mychatFunction()" > <a onclick="mychatFunction()" style="color:white;"><i class="fa fa-cog fa-fw" aria-hidden="true" >Sign Out</i></a></button>
                </div>
            </div>
            <div class="content">
                <div class="contact-profile">
                    <img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
                    <p style="color: black;font-size: 20px;"><b>Harvey Specter</b></p>

                </div>
                <div class="messages">
                    <ul>
                        <li class="sent">
                            <img src="http://emilcarlsson.se/assets/mikeross.png" alt="" />
                            <p>How the hell am I supposed to get a jury to believe you when I am not even sure that I do?!</p>
                        </li>
                        <li  class="replies" >
                            <img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
                            <p style="color:black;">When you're backed against the wall, break the god damn thing down.</p>
                        </li>

                    </ul>
                </div>
                <div class="message-input">
                    <div class="wrap">
                        <input type="text" placeholder="Write your message..." />
                        <i class="fa fa-paperclip attachment" aria-hidden="true"></i>
                        <button class="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>