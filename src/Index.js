import express from "express"
import PreguntasRouter from "./controllers/PreguntaController.js";
import RespuestasRouter from "./controllers/RespuestaController.js";
const app = express();
const port = 5000;
app.use(express.json())
app.use("/preguntas", PreguntasRouter);
app.use("/respuestas", RespuestasRouter);





app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
  