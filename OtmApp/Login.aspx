<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OtmApp.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">


        <title>bs4 social network layout - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap.min.css">
        <link rel="stylesheet" href="card.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style type="text/css">
            .navbar .form-control {
                width: 50px;
                background-color: antiquewhite;
            }

            .content {
                color: black;
                font-weight: normal;
            }

            .footer {
                color: black;
                margin-left: 30px;
            }

            .rounded-card {
                border-radius: 35px;
                border: 1px solid #E1E8ED;
            }

            body {
                background-color: #ffff;
            }

            .h7 {
                font-size: 0.8rem;
            }

            .gedf-wrapper {
                margin-top: 0.97rem;
            }

            @media (min-width: 992px) {
                .gedf-main {
                    margin: 0 auto; /* Dikey hizalamayı sağlar */
                    float: none; /* Kaydırma özelliğini kaldırır */
                    padding-left: 4rem;
                    padding-right: 4rem;
                }

                .gedf-card {
                    margin-bottom: 2.77rem;
                }
            }


            /**Reset Bootstrap*/
            .dropdown-toggle::after {
                content: none;
                display: none;
            }
        </style>
    </head>
    <body>
        <div id="loginForm">
            <input type="email" id="emailField" placeholder="E-posta adresiniz">
            <input type="password" id="passwordField" placeholder="Şifreniz">
            <label id="loginLabel">Giriş Yap</label>
        </div>
        <script src="https://www.gstatic.com/firebasejs/10.8.1/firebase-app-compat.js"></script>
        <script src="https://www.gstatic.com/firebasejs/10.8.1/firebase-auth-compat.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script>
            const firebaseConfig = {
                apiKey: "AIzaSyBhJTyPZintjfuPLN-yI6ykNeE48OVrrt4",
                authDomain: "otm-share.firebaseapp.com",
                projectId: "otm-share",
                storageBucket: "otm-share.appspot.com",
                messagingSenderId: "348092862020",
                appId: "1:348092862020:web:ae23c9664f7998b011b611",
                measurementId: "G-MXBLQQQSS3"
            };
            firebase.initializeApp(firebaseConfig);

            const auth = firebase.auth();
            /*
            // Kullanıcı oturum açtığında çağrılır
            auth.onAuthStateChanged(user => {
                if (user) {
                    // Kullanıcı oturum açmışsa ana sayfayı göster
                    document.getElementById('loginForm').style.display = 'none';
                    document.getElementById('mainPage').style.display = 'block';
                } else {
                    // Kullanıcı oturum açmamışsa giriş ekranını göster
                    document.getElementById('loginForm').style.display = 'block';
                    document.getElementById('mainPage').style.display = 'none';
                }
            });*/
            function login() {
                const email = document.getElementById('emailField').value;
                const password = document.getElementById('passwordField').value;

                auth.signInWithEmailAndPassword(email, password)
                    .then(userCredential => {
                        console.log('Successsss');
                    })
                    .catch(error => {
                        console.error('Giriş hatası:', error.message);
                    });
            }

            function logout() {
                auth.signOut()
                    .then(() => {
                        // Çıkış başarılı
                    })
                    .catch(error => {
                        console.error('Çıkış hatası:', error.message);
                    });
            }

            // Label elementini seç
            const loginLabel = document.getElementById('loginLabel');

            // Label'a tıklandığında çalışacak olan fonksiyon
            loginLabel.addEventListener('click', function () {
                const email = document.getElementById('emailField').value;
                const password = document.getElementById('passwordField').value;
                console.log("Event listener");
                auth.signInWithEmailAndPassword(email, password)
                    .then(userCredential => {
                        console.log('Giriş başarılı');
                        sendAjaxRequest(email, password); // Giriş bilgilerini parametre olarak gönder
                    })
                    .catch(error => {
                        console.error('Giriş hatası:', error.message);
                    });
            });

            // AJAX isteği gönderen fonksiyon
            function sendAjaxRequest(email, password) {
                $.ajax({
                    url: 'Kesitler.aspx',
                    method: 'POST',
                    data: {},
                    success: function (response) {
                        console.log('AJAX isteği başarılı ' + email);
                        // Kesitler.aspx sayfasına yönlendir
                        alert("email: " + email);
                        window.location.href = 'Kesitler.aspx';
                    },
                    error: function (xhr, status, error) {
                        console.error('AJAX isteği hatası:', error);
                    }
                });
            }

        </script>
    </body>
    </html>

</asp:Content>
