using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using logic;
using magnajs.Codes;
using logic.Class;
using System.Transactions;
using Infraestructura.Archivos;
using Newtonsoft.Json;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System.Text;
using System.Threading.Tasks;

namespace magnajs.Pages
{
    public partial class Inicio : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.LoadJs("LoggeadoInfo", "false");
            this.LoadJs("EsAprobadorInfo", "false");
            this.LoadJs("EsCapturaInfo", "false");
            if (HttpContext.Current.Session["UsuarioId"] != null)
            {
                this.LoadJs("UsuarioIdInfo", HttpContext.Current.Session["UsuarioId"].ToString());
                
                if (HttpContext.Current.Session["UsuarioId"].ToString() == "2")
                {
                    this.LoadJs("EsAprobadorInfo", "true");
                    this.LoadJs("LoggeadoInfo", "true");
                }

                if (HttpContext.Current.Session["UsuarioId"].ToString() == "1")
                {
                    this.LoadJs("EsCapturaInfo", "true");
                    this.LoadJs("LoggeadoInfo", "true");
                }
            }
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod]
        static public Dictionary<string, object> GetInformacion(Dictionary<string, object> datos)
        {
            var page = new logic.BasePage();
            var a = new logic_acces(ConexionDB);
            var response = new Dictionary<string, object>();
            DataTable Dt1 = a.ExecuteQuery("sp_FR_GetList_AlertaCalidad", datos).Tables[0];
            DataTable Dt2 = a.ExecuteQuery("sp_FR_GetList_AlertaCalidad", datos).Tables[1];
            //Response
            response["InformacionPrincipal"] = page.DataTableToMap(Dt1);
            response["Resultado"] = page.DataTableToMap(Dt2);

            return response;

        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod]
        public static Dictionary<string, object> Guardar(Dictionary<string, object> datos)
        {
            var page = new Inicio();
            var rutaArchivos = ConfigurationManager.AppSettings["CarpetaArchivos"] +
                                   page.GetMessage("folderArchivos") + "/";

            var a = new logic_acces(ConexionDB);

            Utilities.DeleteFiles(rutaArchivos, 2);

            using (TransactionScope scope = new TransactionScope())
            {

                var informacionPrincipal = Utilities.StringToList(datos["InformacionPrincipal"]);

                foreach (var dato in informacionPrincipal)
                {

                    if (dato.ContainsKey("cve_alerta_calidad"))
                    {
                        dato["Usuario"] =  HttpContext.Current.Session["CveUsuario"].ToString();

                        a.ExecuteNonQuery("sp_FR_AlertaCalidadArchivos_IU", dato);

                        //var archivo = new Dictionary<string, object>();
                        //archivo.Add("RutaArchivo", dato["ra_acciones_correctivas"]);
                        //archivo.Add("UID", dato["UID_acciones_correctivas"]);
                        //archivo.Add("EsArchivoNuevo", dato["EsArchivoNuevo_acciones_correctivas"]);

                        //if (Utilities.GetBool(archivo, "EsArchivoNuevo"))
                        //{                            
                        //Cambia el archivo a la carpeta definitiva   
                        // Utilities.MoveFiles(nombrearchivo, path2, archivo, "RutaArchivo");
                        //Utilities.MoveFileToDateDirectory(rutaArchivos, archivo, "ArchivoId", "Archivos");
                        //}


                    }
                }

                scope.Complete();
            }

            var response = new Dictionary<string, object>();
            DataTable Dt1 = a.ExecuteQuery("sp_FR_GetList_AlertaCalidad", datos).Tables[0];

            //Response
            response["InformacionPrincipal"] = page.DataTableToMap(Dt1);
            return response;
            //return datos;
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod]
        static public Dictionary<string, object> Salir(Dictionary<string, string> datos)
        {
            var page = new logic.BasePage();
            var a = new logic_acces(ConfigurationManager.ConnectionStrings["ConexionDB"].ToString());
            var response = new Dictionary<string, object>();
            HttpContext.Current.Session.Abandon();
            response["Data"] = true;
            return response;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod]
        public static bool OpenDocumento(Dictionary<string, object> datos)
        {
            if (datos["RutaArchivo"] != null)
            {
                var storage = new AlmacenamientoAzureServicio();
                var page = new Inicio();
                var rutaArchivos = ConfigurationManager.AppSettings["CarpetaArchivos"] +
                    page.GetMessage("folderArchivos") + "/" + datos["RutaArchivo"];

                var bytes = storage.ObtenerArchivo(rutaArchivos);
                var extension = Path.GetExtension(datos["RutaArchivo"].ToString()).Substring(1);
                page.Session["ArchivoADescargar"] = new AnexoInfo(datos["NombreArchivoNuevo"].ToString(), "application/octet-stream", bytes, extension);
                return true;
            }
            return true;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod]
        public static bool AprobarRechazar(Dictionary<string, object> datos)
        {

            var page = new Inicio();
            var a = new logic_acces(ConexionDB);

            using (TransactionScope scope = new TransactionScope())
            {

                //var informacionPrincipal = Utilities.StringToList(datos["InformacionPrincipal"]);

                //foreach (var dato in informacionPrincipal)
                //{

                if (datos.ContainsKey("cve_alerta_calidad"))
                {
                    datos["EsAprobador"] = 1;
                    datos["Usuario"] = HttpContext.Current.Session["CveUsuario"].ToString();
                    a.ExecuteNonQuery("sp_FR_AlertaCalidadArchivos_IU", datos);
                }
                //}

                scope.Complete();
                return true;
            }
            return false;
        }



    }
}