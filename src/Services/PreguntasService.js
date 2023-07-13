import sql from 'mssql';
import config from '../models/db.js';

export class PreguntaService {
    Update = async (Pregunta, Id) => {
        console.log(Pregunta);
    
            const pool = await sql.connect(config);
            const result = await pool.request()
            .input('pId', sql.Int, Id)
            .input('pPregunta', sql.VarChar, Pregunta.Pregunta)
            .input('pOpcion1', sql.VarChar, Pregunta.Opcion1)
            .input('pOpcion2', sql.VarChar, Pregunta.Opcion2)
            .input('pOpcion3', sql.VarChar, Pregunta.Opcion3)
            .input('pOpcion4', sql.VarChar, Pregunta.Opcion4)
            .input('pFechaDeCreacion', sql.Date, Pregunta.FechaDeCreacion)
            .input('pRespuestaCorrecta', sql.VarChar, Pregunta.RespuestaCorrecta)
    
    
            .query('UPDATE Preguntas SET Pregunta = @pPregunta,Opcion1 = @pOpcion1, opcion2 = @pOpcion2, Opcion3 = @pOpcion3, Opcion4 = @pOpcion4,FechaDeCreacion = @pFechaDeCreacion,RespuestaCorrecta = @pRespuestaCorrecta  WHERE IdPregunta = @pId');
            console.log(result)
    
            return result.recordset;
            }
     
     Insert = async (preguntas) =>
            {
    
            const pool = await sql.connect(config);
            const response = await pool.request()
                
            .input('Pregunta',sql.VarChar, preguntas.Pregunta)
            .input('opcion1',sql.VarChar, preguntas.Opcion1)
            .input('opcion2',sql.VarChar, preguntas.Opcion2)
            .input('opcion3',sql.VarChar, preguntas.Opcion3)
            .input('opcion4',sql.VarChar, preguntas.Opcion4)
            .input('RespuestaCorrecta',sql.VarChar, preguntas.RespuestaCorrecta)
            .input('FechaDeCreacion',sql.Date,preguntas.FechaDeCreacion)

            .query(`INSERT INTO Preguntas (Pregunta, Opcion1, Opcion2, Opcion3, Opcion4, RespuestaCorrecta, FechaDeCreacion) VALUES (@Pregunta, @Opcion1, @Opcion2, @Opcion3, @Opcion4, @RespuestaCorrecta, @FechaDeCreacion)`);
            console.log(response)
    
            return response.recordset;
            }
    Get = async () =>
    {
        let returnEntity = null;

        try{
            let pool = await sql.connect(config);
            let result = await pool.request()             
            .query('SELECT * FROM Preguntas');
            returnEntity = result.recordset;
        }   

        catch (error)

        {
            console.log(error)
        }
        return returnEntity;
    }
    delete = async (Id) => {
        try {
        const pool = await sql.connect(config);
        
        
        const resultRespuesta = await pool
        .request()
        .input("pId", Id)
        .query('DELETE FROM Respuestas WHERE IdPregunta = @pId');
        
        
        const resultPregunta = await pool
        .request()
        .input("pId", Id)
        .query('DELETE FROM Preguntas WHERE @pId = IdPregunta');
        
        
        if (resultRespuesta.rowsAffected[0] > 0 || resultPregunta.rowsAffected[0] > 0) {
        return true;
        } else {
        return false;
        }
        } catch (error) {
        console.log(error);
        throw error;
        }
        };
}