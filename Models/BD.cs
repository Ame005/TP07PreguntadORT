using System.Data.SqlClient;
using Dapper;
public class BD {
    private static string ConnectionString = @"Server=localhost;DataBase=BD.Preguntados;Trusted_Connection=True;";
    public static List<Categoria> ObtenerCategorias(){
        List <Categoria> ListCategorias = new List<Categoria>();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Categorias";
            ListCategorias = db.Query<Categoria>(sql).ToList();
        }
        return ListCategorias;
    }
    public static List<Dificultad> ObtenerDificultades(){
        List <Dificultad> ListDificultades = new List <Dificultad> ();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Dificultades";
            ListDificultades = db.Query<Dificultad>(sql).ToList();
        }
        return ListDificultades;
    }
    public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria)
    {
        List <Pregunta> ListPreguntasUsar = new List <Pregunta> ();
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {   string sql="";
            if(categoria!=-1 && dificultad!=-1)
            {
                sql = "SELECT * FROM Preguntas WHERE IDDificultad=@dificultad AND IDCategoria=@categoria";
            }
            else if(categoria==-1 && dificultad==-1) 
            {
                sql = "SELECT * FROM Preguntas";
            }
            else if(categoria==-1 && dificultad!=-1)
            {
                sql = "SELECT * FROM Preguntas WHERE IDDificultad=@dificultad";
            }
            else if(categoria!=-1 && dificultad==-1)
            {
                sql = "SELECT * FROM Preguntas WHERE IDCategoria=@categoria";
            }
            ListPreguntasUsar = db.Query<Pregunta>(sql, new {dificultad=dificultad, categoria=categoria}).ToList();
        }
        return ListPreguntasUsar;
    }
    //al final de todo ver de no repetir codigo
    public static List<Respuesta> ObtenerRespuestas(List<Pregunta> ListPreguntasUsar){
        List <Respuesta> ListRespuestasUsar = new List <Respuesta> ();
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            foreach (Pregunta item in ListPreguntasUsar){
                string sql = "SELECT * FROM Respuestas WHERE IDPregunta = @pIdPregunta";
                ListRespuestasUsar.AddRange(db.Query<Respuesta>(sql, new {pIdPregunta=item.IdPregunta}).ToList());
                /*
                - Le pasamos por parametro el ID de la pregunta para llamar a todas las respuestas (true or false)
                - new {pIdPregunta=item.IdPregunta} esto es lo que se pasa por parametros a la query con los datos 
                - que le llegan del programa los usa para filtrar las respuestas de acuerdo a las preguntas de la List
                */
            }
        }
        return ListRespuestasUsar;
    }
}