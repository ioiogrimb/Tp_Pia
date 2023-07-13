import express from "express";
import { RespuestaService } from "../Services/RespuestasService.js";
import Respuesta from "../models/Respuestas.js";

const RespuestasRouter = express();
const respuestaservice = new RespuestaService();
RespuestasRouter.use(express.json());

RespuestasRouter.post('/', async(req,res) => {
    const Respuestas = new Respuesta()
    await respuestaservice.Insert(req.body)
    res.status(201).json(Respuestas)
})

export default RespuestasRouter;