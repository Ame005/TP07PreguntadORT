using Microsoft.AspNetCore.Mvc;

namespace TP07PreguntadORT.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        ViewBag.Categorias= Juego.ObtenerCategorias();
        ViewBag.Dificultades= Juego.ObtenerDificultades();
        return View("ConfigurarJuego");
    }
    public IActionResult Comenzar(string username, int dificultad, int categoria){
        Juego.CargarPartida(username,dificultad,categoria);
        if (Juego.Preguntas.Count>0 && dificultad!=0 && categoria!=0)
            return RedirectToAction("Jugar");
        else
            return View("ConfigurarJuego");
    }
    [HttpPost]
    public IActionResult Jugar(){
        /*Carga en ViewBag todo lo necesario para mostrar la pregunta actual con sus respectivas respuestas 
        (que proviene del método ObtenerProximaPregunta. Si ya no hay más preguntas disponibles, retorna la 
        view Fin. Si el método retorna una pregunta, invoca a ObtenerProximasRespuestas de la clase Juego 
        guardando estos datos en ViewBag y retorna la view Juego.*/
        ViewBag.Username=Juego.Username;
        ViewBag.Puntaje=Juego.PuntajeActual;
        ViewBag.PreguntaProxima= Juego.ObtenerProximaPregunta();
        if(ViewBag.PreguntaProxima == null){
            return View("Fin");
        }
        
        ViewBag.RespuestasProximas=Juego.ObtenerProximasRespuestas(ViewBag.PreguntaProxima.IdPregunta);
        return View("Juego");
    }
    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta){
        /*Recibe el id de la respuesta elegida, invoca al método VerificarRespuesta de la clase Juego y 
        retorna la view Respuesta, enviando por ViewBag si fue correcta o no. (Como opcional, podés enviar 
        también cuál era la respuesta correcta).*/
        Console.WriteLine(idPregunta);
        Console.WriteLine(idRespuesta);
        ViewBag.Acierto=Juego.VerificarRespuesta(idPregunta,idRespuesta);
        //ViewBag.RespuestaCorrecta=Juego.correcta;
        return View("Respuesta");
    }

}
