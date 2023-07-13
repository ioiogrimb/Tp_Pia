import sql from 'mssql';
import config from '../models/db.js';

export class RespuestaService {
    Insert = async (respuestas) =>
    {

    const pool = await sql.connect(config);
    const response = await pool.request()
        
    .input('UserId',sql.Int, respuestas.UserId)
    .input('RespuestaSeleccionada',sql.VarChar, respuestas.RespuestaSeleccionada)
    .input('EsRespuestaCorrecta',sql.Bit, respuestas.EsRespuestaCorrecta)
    .input('FechaDeCreacion',sql.Date, respuestas.FechaDeCreacion)
    .query(`INSERT INTO Respuestas (UserId, RespuestaSeleccionada, EsRespuestaCorrecta, FechaDeCreacion) VALUES (@UserId, @RespuestaSeleccionada, @EsRespuestaCorrecta, @FechaDeCreacion)`);
    console.log(response)

    return response.recordset;
    }
}
