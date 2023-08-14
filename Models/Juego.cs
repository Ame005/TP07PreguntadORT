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
            rnd.Next(1,Preguntas.Count());
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
        return BD.ObtenerRespuestas(IdPregunta);
        //retorna respuestas correspondiente de la lista
    }
    public bool VerificarRespuesta(int idPregunta, int idRespuesta)
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
       while(correcta=false && i<Respuestas.Count)
       
       if(correcta)
        {
            PuntajeActual=PuntajeActual+100;
            CantidadPreguntasCorrectas++;
        }
        else
        {
            Preguntas.Remove(idPregunta);
        }
        return correcta;
    }
}   