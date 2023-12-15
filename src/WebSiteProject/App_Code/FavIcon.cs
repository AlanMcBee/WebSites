//using System.Net;

//using IHostingEnvironment = Umbraco.Cms.Core.Hosting.IHostingEnvironment;


//namespace TwilightSoul
//{
//    public class FavIcon
//    {
//        private readonly IHostingEnvironment _webHostEnvironment;

//        public FavIcon(IHostingEnvironment webHostEnvironment)
//        {
//            _webHostEnvironment = webHostEnvironment;
//        }

//        public async Task Invoke(HttpContext context)
//        {
//            var request = context.Request;
//            var response = context.Response;
//            var url = request.Host.Value;
//            var host = request.Host.Host;
//            string imagePath = null;
//            if (host.ToLowerInvariant().Contains("TwilightSoul".ToLowerInvariant())
//                || host.ToLowerInvariant().Contains("localhost".ToLowerInvariant()))
//            {
//                imagePath = _webHostEnvironment.ToAbsolute("~/css/TwilightSoul/icons/favicon.ico");
//            }
//            else if (host.ToLowerInvariant().Contains("CodeCharm".ToLowerInvariant()))
//            {
//                imagePath = _webHostEnvironment.ToAbsolute("~/css/CodeCharm/icons/favicon.ico");
//            }
//            if (null == imagePath || !File.Exists(imagePath))
//            {
//                response.StatusCode = (int)HttpStatusCode.NotFound;
//                return;
//            }

//            response.StatusCode = (int)HttpStatusCode.OK;
//            response.ContentType = "image/x-icon";
//            await response.SendFileAsync(imagePath);
//        }
//    }
//}
