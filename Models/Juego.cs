public static class Juego {
    public static string Username {get; set;}
    public static int PuntajeActual {get; set;}
    public static int CantidadPreguntasCorrectas {get; set;}
    public static List<Pregunta> Preguntas {get; set;}
    public static List<Respuesta> Respuestas {get; set;}

    public static void InicializarJuego()
    {
        Username="";
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
        Preguntas=BD.ObtenerPreguntas(dificultad,categoria);
        Respuestas=BD.ObtenerRespuestas(Preguntas);
    }
    public static Pregunta ObtenerProximaPregunta()
    {
        if(Preguntas.Count>0)
        {
            Random rnd = new Random();
            return Preguntas[rnd.Next(1,Preguntas.Count())];
        }
        else
        {
            return null;
        }
        //retorna pregunta al azar de la lista
    }
    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
        List<Respuesta>RespuestasProximas= new List<Respuesta>();
        RespuestasProximas = null;
        foreach(Respuesta item in Respuestas)
        {
            if(item.IdPregunta==idPregunta)
            {
                RespuestasProximas.Add(item);
            }
        }
        return RespuestasProximas;
        //retorna respuestas correspondiente de la lista
    }
    public static bool VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        int i=0;
        bool correcta=false;
       do
       {
            if(Respuestas[i].IdRespuesta==idRespuesta && Respuestas[i].Correcta) // va a buscar la lista Respuestas que dentro tiene toda la respuesta (con id repuesta, id pregunta, etc) y compara con la respuesta elegida 
            {
                correcta=true;
            }
       }
       while(correcta=false && i<Respuestas.Count);
       
       if(correcta)
        {
            PuntajeActual=PuntajeActual+100;
            CantidadPreguntasCorrectas++;
        }
        else
        {
            Preguntas.Remove(Preguntas[idPregunta]);
        }
        return correcta;
    }
}   