import express from "express";
import { PreguntaService } from "../Services/PreguntasService.js";
import Pregunta from "../models/Preguntas.js";

const PreguntasRouter = express();
const preguntaservice = new PreguntaService();
PreguntasRouter.use(express.json());

PreguntasRouter.post('/', async(req,res) => {
    const Preguntas = new Pregunta()
    /*Preguntas.Pregunta=req.body.Pregunta
    Preguntas.Opcion1=req.body.Opcion1
    Preguntas.Opcion2=req.body.Opcion2
    Preguntas.Opcion3=req.body.Opcion3
    Preguntas.Opcion4=req.body.Opcion4
    Preguntas.ResúestaCorrecta = req.body.RespuestaCorrecta
    Preguntas.FehchaDeCreacion = req.body.FechaDeCreacion*/
    await preguntaservice.Insert(req.body)
    res.status(201).json(Preguntas)
})
PreguntasRouter.get('/', async (req, res) => {
    const preguntas = await preguntaservice.Get();
    return res.status(200).json(preguntas);
})
PreguntasRouter.put('/:Id', async (req, res) => {
    console.log('estoy en put')
    const pregunta = await preguntaservice.Update(req.body, req.params.Id);
    console.log(pregunta);

    return res.status(200).json(pregunta);
  });

  PreguntasRouter.delete('/:Id', async(req, res) => {

    const id = req.params.Id;
    console.log('estoy en delete')
    const pregunta = await preguntaservice.delete(id)
    return res.status(201).json(pregunta);
    })

PreguntasRouter.get("/azar", async (req, res) => {
    const listaPreguntas = await preguntaservice.Get();
    const nro = Math.floor(Math.random() * listaPreguntas.length);
    res.status(200).json(listaPreguntas[nro]);
})

export default PreguntasRouter;
