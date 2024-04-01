using FirebaseAdmin.Auth;
using Google.Cloud.Firestore;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Google.Rpc.Context.AttributeContext.Types;

namespace OtmApp
{
    public partial class Kesitler : System.Web.UI.Page
    {
        FirestoreDb db;
        [FirestoreDocumentId]
        public string Id { get; set; }
        
        [FirestoreProperty]
        public string content { get; set; }
        [FirestoreProperty]
        public int likeCount {  get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            { 
            if (Request.HttpMethod == "POST")
            {
                // Post isteği alındığında çalışacak kodlar buraya gelecek
                string email = Request.Form["email"]; // Post isteği ile gelen veriyi al
                string password = Request.Form["password"]; // Post isteği ile gelen veriyi al

                string a = Request.Form["email"];
                Response.Write("Veri: " + a);
                Session["email"] = email;
                //Response.Write("Response");
                // İşlemleri gerçekleştir
            }
            }

            //Response.Write("Session email is : "+Session["email"]);
            string path = AppDomain.CurrentDomain.BaseDirectory + @"otm-share-firebase-adminsdk-gro23-81d63f7f2b.json";
            Environment.SetEnvironmentVariable("GOOGLE_APPLICATION_CREDENTIALS", path);

            db = FirestoreDb.Create("otm-share");
            GetAllData();
        }

        //!DON'T USE THIS NOWWWWWWWWWW HEYYY
        void Section()
        {
            CollectionReference col = db.Collection("Section");
            Dictionary<string, object> data1 = new Dictionary<string, object>()
            {
                {"content",  "Content"},
            };
            col.AddAsync(data1);
            Response.Write("Data added sucessfully");
        }
        async void GetAllData()
        {
            Console.Write("Geet all data");
            var sectionCollection = db.Collection("Section");
            QuerySnapshot sectionQuery = await sectionCollection.GetSnapshotAsync();
            var usersCollection = db.Collection("Users");
            QuerySnapshot usersQuery = await usersCollection.GetSnapshotAsync();

            if (sectionQuery.Count>0)
            {
                var exs = new List<ItemEx>(); // Tüm belgelerin içeriğini saklamak için liste oluştur

                foreach (var documentSnapshot in sectionQuery.Documents)
                {
                    if (documentSnapshot.Exists)
                    {
                        // Belge varsa, içeriği al
                        var content = documentSnapshot.GetValue<string>("content");
                        var ep = documentSnapshot.GetValue<string>("seasonAndEpisode");
                        var splittedEpisode = ep.Split('.');
                        ep = "Sezon "+splittedEpisode[0] + " Bölüm " + splittedEpisode[1] + " - " + splittedEpisode[2];
                        var url = documentSnapshot.GetValue<string>("url");
                        var id = documentSnapshot.GetValue<int>("id");
                        {
                            foreach(var snap in usersQuery.Documents)
                            {
                                if(snap.Exists)
                                {
                                    var mail = snap.GetValue<string>("mail");
                                    if(mail == Session["email"])
                                    {
                                        var liked = snap.GetValue<string>("liked");
                                        Response.Write($"{mail} is mail and the liked sections are : {liked}");
                                        Console.Write("Console");
                                    }
                                }
                            }
                        }
                        if (content != null)
                        {
                            exs.Add(new ItemEx { Content = content, SeasonAndEpisode = ep, Url = url, Id = id });
                        }
                    }
                }

                // Verileri tekrarlayıcıya bağla
                CardRepeater.DataSource = exs;
                CardRepeater.DataBind();
            }
        }

        protected void GreetingBtn_Click(object sender, EventArgs e)
        {
            Response.Write("SDFAS");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("Clicked");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write("Resss");
        }
        [WebMethod]
        public static string likeButton_Click()
        {
            // Beğeni işlemi gerçekleştirildiğinde burada bir şeyler yapabilirsiniz
            // Örneğin, beğeni sayısını artırabilir veya bir log kaydı oluşturabilirsiniz

            // Örnek bir dönüş değeri
            return "Beğeni işlemi başarılı!";

            // Örnek bir Response.Write kullanımı
            //Response.Write("Beğeni işlemi başarılı!");
        }


        /* Our code
        async void GetAllData()
        {
            DocumentReference doc = db.Collection("Section").Document("MainDoc");
            DocumentSnapshot snap = await doc.GetSnapshotAsync();

           
            if (snap.Exists)
            {
                var exs = new List<ItemEx>(); // Liste oluştur
                Dictionary<string, object> dc = snap.ToDictionary();

                foreach (var item in dc)
                {
                    // content alanını al ve ItemEx nesnesine ekle
                    string content = item.Value.ToString();
                    exs.Add(new ItemEx { Content = content });
                }

                CardRepeater.DataSource = exs;
                CardRepeater.DataBind();
            }
        }*/
    }

    public class ItemEx
    {
        public string Content { get; set; }
        public string SeasonAndEpisode { get; set; }
        public string Url { get; set; }
        public int Id { get; set; }
        public bool IsLiked { get; set; }
        public bool IsSaved { get; set; }
    }

    /*
      if (snap.Exists)
            {
                Dictionary<string, object> dc = snap.ToDictionary();
                List<object> data = new List<object>();
                foreach (var item in dc)
                {
                    Response.Write("\nitem is" + item.Value);
                    data.Add("content"  = item.Value.ToString());
                }
                CardRepeater.DataSource = data;
                CardRepeater.DataBind();
            }*/
}