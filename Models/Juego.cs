public static class Juego {
    public static string Username {get; set;}
    public static int PuntajeActual {get; set;}
    public static int CantidadPreguntasCorrectas {get; set;}
    public static List<Pregunta> Preguntas {get; set;}
    public static List<Respuesta> Respuestas {get; set;}
    public static int CantidadPreguntasGeneral {get; set;}

    public static void InicializarJuego(string username)
    {
        Username=username;
        PuntajeActual=0;
        CantidadPreguntasCorrectas=0;
    }
    public static List<Categoria> ObtenerCategorias()
    {
        return BD.ObtenerCategorias();
    }
    public static List<Dificultad> ObtenerDificultades()
    {
        return BD.ObtenerDificultades();
    }
    public static void CargarPartida(string username, int dificultad, int categoria)
    {
        Username=username;
        Preguntas=BD.ObtenerPreguntas(dificultad,categoria);
        Respuestas=BD.ObtenerRespuestas(Preguntas);
    }
    public static Pregunta ObtenerProximaPregunta()
    {
        if(Preguntas.Count()>0)
        {
            Random rnd = new Random();
            return Preguntas[rnd.Next(0,Preguntas.Count())];
        }
        else
        {
            return null;
        }
        //retorna pregunta al azar de la lista
    }
    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
        List<Respuesta> RespuestasProximas= new List<Respuesta>();
        foreach(Respuesta item in Respuestas)
        {
            if(item.IdPregunta==idPregunta)
            {
                RespuestasProximas.Add(item);
                Console.WriteLine(item);
            }
        }
        return RespuestasProximas;
        //retorna respuestas correspondiente de la lista
    }
    public static bool VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        bool correcta = false;
     
        Respuesta respuestaCorrecta = new Respuesta();
        
        /*filtra las respuesta por pregunta*/
        foreach(Respuesta item in Respuestas)
        {
            if(item.Correcta == true && item.IdPregunta == idPregunta)
            {
                respuestaCorrecta = item;
            }
        }
        if(idPregunta == respuestaCorrecta.IdPregunta && idRespuesta == respuestaCorrecta.IdRespuesta ){
                correcta = true;
                CantidadPreguntasCorrectas++;
                PuntajeActual++;
        }
        for(int i=0;i<Preguntas.Count();i++)
        {
            if(Preguntas[i].IdPregunta == idPregunta)
            {
                CantidadPreguntasGeneral++;
                Preguntas.Remove(Preguntas[i]);      
            }
        }
        Console.WriteLine(correcta);
        return correcta;  
    }
    
}   