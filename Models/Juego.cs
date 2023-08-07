class Juego {
    string _username {get; private set;}
    int _puntajeActual {get; private set;}
    int _cantidadPreguntasCorrectas {get; private set;}
    List<Pregunta> _preguntas {get; private set;}
    List<Respuesta> _respuestas {get; private set;}

    public void InicializarJuego(){

    }
    public List<Categoria> ObtenerCategorias(){

    }
    public List<Dificultad> ObtenerDificultades(){

    }
    public void CargarPartida(string username, int dificultad, int categoria){

    }
    public Pregunta ObtenerProximaPregunta(){
        //retorna pregunta al azar de la lista
    }
    public Respuesta ObtenerProximasRespuestas(int idPregunta){
        //retorna respuesta correspondiente de la lista
    }
    public bool VerificarRespuesta(int idPregunta, int idRespuesta){

    }
}   