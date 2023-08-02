using System.Data.SqlClient;
using Dapper;
public class BD {
    private static string ConnectionString = @"Server=localhost;DataBase=Elecciones;Trusted_Connection=True;";
    public static List<Categoria> ObtenerCategorias(){
        List <Categoria> ListCategorias = null;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Categorias";
            ListCategorias = db.Query<Categoria>(sql).ToList();
        }
        return ListCategorias;
    }
    public static List<Dificultad> ObtenerDificultades(){
        List <Dificultad> ListDificultades = null;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Dificultades";
            ListDificultades = db.Query<Dificultad>(sql).ToList();
        }
        return ListDificultades;
    }
    public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria){
        List <Pregunta> ListPreguntasUsar = null;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            string sql = "SELECT * FROM Preguntas WHERE IDDificultad = @dificultad and IDCategoria = @categoria";
            //4 POSIBILIDADES -1 DIFICULTAD -1 CATEGORIAS -1 LAS DOS NINGUNA -1
        }
        return ListPreguntasUsar;
    }
    //
    public static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas){
        List <Respuesta> ListRespuestasUsar = null;
        using (SqlConnection db = new SqlConnection(ConnectionString)){
            
        }
        return ListRespuestasUsar;
    }
}