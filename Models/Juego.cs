class Juego {
    string Username {get; private set;}
    int PuntajeActual {get; private set;}
    int CantidadPreguntasCorrectas {get; private set;}
    List<Pregunta> Preguntas {get; private set;}
    List<Respuesta> Respuestas {get; private set;}

    public void InicializarJuego()
    {
        Username=0;
        PuntajeActual=0;
        CantidadPreguntasCorrectas=0;
    }
    public List<Categoria> ObtenerCategorias()
    {
        return BD.ObtenerCategorias();
    }
    public List<Dificultad> ObtenerDificultades()
    {
        return BD.ObtenerDificultades();
    }
    public void CargarPartida(string username, int dificultad, int categoria)
    {
        Preguntas=BD.ObtenerPreguntas(dificultad,categoria);
        Respuestas=BD.ObtenerRespuestas(Preguntas);
    }
    public Pregunta ObtenerProximaPregunta()
    {
        if(Preguntas.ContainsKey())
        {
            Random rnd = new Random();
            rnd.Next(1,Preguntas.Count())
            return rnd;
        }
        else
        {
            return Preguntas.Count();
        }
        //retorna pregunta al azar de la lista
    }
    public Respuesta ObtenerProximasRespuestas(int IdPregunta)
    {
        return BD.ObtenerRespuestas(Preguntas(IdPregunta));//(Preguntas(Id.Pregunta)) o (IdPregunta) solo ¡preguntar binker?
        //retorna respuesta correspondiente de la lista
    }
    public bool VerificarRespuesta(int idPregunta, int idRespuesta)
    {

    }
}   