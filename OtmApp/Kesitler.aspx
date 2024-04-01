<%@ Page Async="true" Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Kesitler.aspx.cs" Inherits="OtmApp.Kesitler" EnableEventValidation="false" %>

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

            .text-center{
                text-align: center;
            }

            .vertical-line {
                border-left: 1px solid #ccc;
                height: 100%;
            }
            
            .spotify-link{
                position:relative;
            }

            .card-content{
                font-size: 23px;
            }

            .height{
                align-content: center;
                min-height: 75px;
            }

            .card-link{
                color: black;
            }

            .share:hover{
                color: green;
            }

            .sticky{
                position:sticky;
                bottom: 0;
                right : 0;
                z-index:0;
            }
            
        </style>
    </head>
    <body>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <header class="text-center">
            <h1>
                OTM KESİT ŞOV HEY
            </h1>
        </header>
        <br/>
        <br/>
        <%--<nav class="navbar navbar-light bg-white">
            <!--<a href="#" class="navbar-brand">BootdEy.com</a>-->
            <div class="d-flex justify-content-center w-100">
                <form class="form-inline">
                    <div class="container">
                        <div class="row">
                            <div class="input-group align-items-center">
                                <input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-primary" type="button" id="button-addon2">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </nav>--%>

        <div class="container gedf-wrapper">
            <div class="row">
                <div class="col-sm">
                    <div class="card">Hey Div</div>
                </div>
                <div class="col-md-9 gedf-main offset-md-3">
    
                    <%-- Yeni post oluşturma ekranı --%>
                    <%--<div class="card gedf-card">
                        <div class="card-header">
                            <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">Make
                                        a publication
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="images-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#images">Images</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                    <div class="form-group">
                                        <label class="sr-only" for="message">post</label>
                                        <textarea class="form-control" id="message" rows="3" placeholder="What are you thinking?"></textarea>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                                    <div class="form-group">
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" id="customFile">
                                            <label class="custom-file-label" for="customFile">Upload image</label>
                                        </div>
                                    </div>
                                    <div class="py-4"></div>
                                </div>
                            </div>
                            <div class="btn-toolbar justify-content-between">
                                <div class="btn-group">
                                    <button type="submit" class="btn btn-primary">share</button>
                                </div>
                                <div class="btn-group">
                                    <button id="btnGroupDrop1" type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-globe"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="btnGroupDrop1">
                                        <a class="dropdown-item" href="#"><i class="fa fa-globe"></i>Public</a>
                                        <a class="dropdown-item" href="#"><i class="fa fa-users"></i>Friends</a>
                                        <a class="dropdown-item" href="#"><i class="fa fa-user"></i>Just me</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>

                    <asp:Repeater ID="CardRepeater" runat="server">
                        <ItemTemplate>
                            <div class="card gedf-card overflow-hidden shadow-lg rounded-pill rounded-lg rounded-card">
                                <div class="">
                                    <div class="<%--d-flex justify-content-between align-items-center--%>">
                                        <div class="<%--d-flex justify-content-between align-items-center--%>">
                                            <!--<div class="mr-2">
    <img class="rounded-circle" width="45" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt>
    </div>-->
                                            <div class="ml-3 mt-3 mr-3">
                                                <div class="h5 m-0">
                                                    <h5 class="card-title"><%#Eval("seasonAndEpisode") %></h5>
                                                    <hr class="hr hr-blurry" />
                                                </div>
                                            </div>
                                        </div>
                                        <%-- Card ayar menüsü --%>
                                        <%--<div>
                                                <div class="dropdown">
                                                    <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <i class="fa fa-ellipsis-h"></i>
                                                    </button>
                                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                                        <div class="h6 dropdown-header">Configuration</div>
                                                        <a class="dropdown-item" href="#">Save</a>
                                                        <a class="dropdown-item" href="#">Hide</a>
                                                        <a class="dropdown-item" href="#">Report</a>
                                                    </div>
                                                </div>
                                            </div>--%>
                                    </div>
                                </div>
                                <div class="card-body mr-1 row height">
                                        <div class="col-md-9 h4">
                                            <div class="content"><%#Eval("content") %></div>
                                        </div>
                                        <br />
                                        <div class="col-md-3 vertical-line height">
                                            <div class="spotify-link">
                                                <a href='<%#Eval("Url") %>' target="_blank" class="card-link">
                                                    <i class="bi bi-spotify" style='font-size: 36px; color: green; vertical-align: middle;'></i>
                                                    <span style="vertical-align: middle;">Spotify'da Aç</span>
                                                </a>
                                            </div>
                                        </div>
                                    <a class="card-link" href="https://open.spotify.com/episode/1Tlq1dxTVtorCnWARCJZIq?si=XMlHRmN7QICMnjDFXycTWA&amp;t=2488" target="_blank">
                                        <h5 class="card-title"></h5>
                                    </a>
                                </div>
                                <div class="ml-3 mr">
                                    <hr class="hr hr-blurry" />
                                </div>
                                <div class="mb-3">
                                   <%-- <a id="like-button" href="#" class="footer"><i class="bi bi-balloon-heart" style='color: #808080'></i>Like</a>
                                    <a href="#" class="footer"><i class="bi bi-chat-dots" style='color: #808080'></i>Comment</a>--%>
                                    <%--<a href="" class="footer"><i class="bi bi-share" style='color: #808080'></i> Paylaş</a>--%>
                                    <i class="bi bi-share footer share"> Paylaş</i>
                                </div>
                            </div>
                        </ItemTemplate>

                    </asp:Repeater>

                </div>
                <div class="col-sm">
                    <div class="card">Hey Div</div>
                </div>

            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript"></script>
        <script src="https://open.spotify.com/embed/iframe-api/v1" async></script>
        <script src="https://www.gstatic.com/firebasejs/10.8.1/firebase-app-compat.js"></script>
        <script src="https://www.gstatic.com/firebasejs/10.8.1/firebase-firestore-compat.js"></script>
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


            // Initialize Firebase
            firebase.initializeApp(firebaseConfig);
            const db = firebase.firestore();
            /*
            db.collection("User").add({
                first: "Ada",
                last: "Lovelace",
                born: 1815
            })
                .then((docRef) => {
                    console.log("Document written with ID: ", docRef.id);
                })
                .catch((error) => {
                    console.error("Error adding document: ", error);
                });*/
            // Initialize Cloud Firestore and get a reference to the service

            db.collection("Users").get().then((querySnapshot) => {
                querySnapshot.forEach((doc) => {
                    console.log(`${doc.id} => ${doc.data()}`);
                });
            });

            //const likeButton = document.getElementById('like-button');
        </script>

    </body>
    </html>
</asp:Content>
