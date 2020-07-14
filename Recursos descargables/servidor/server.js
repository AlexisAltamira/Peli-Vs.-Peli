var express = require('express');
var bodyParser = require('body-parser');
var cors = require('cors');

var competenciasController = require ('./controladores/competenciasController');

var app = express();

app.use(cors());

app.use(bodyParser.urlencoded({
    extended: true
}));

app.use(bodyParser.json());

app.get('/competencias', competenciasController.buscarCompetencias);
app.get('/competencias/:id/peliculas', competenciasController.obtenerDosPeliculas);
app.post('/competencias/:idCompetencia/voto', competenciasController.guardarVoto);
app.get('/competencias/:id/resultados', competenciasController.cargarResultados);
app.post('/competencias', competenciasController.crearCompetencia);
app.delete('/competencias/:id/votos', competenciasController.eliminarVotos);
app.get('/generos', competenciasController.crearCompetenciaPorGenero);
app.get('/directores', competenciasController.crearCompetenciaPorDirectores);
app.get('/actores', competenciasController.crearCompetenciaPorActores);
app.get('/competencias/:id', competenciasController.obtenerNombre);
app.delete('/competencias/:idCompetencia', competenciasController.eliminarCompetencia);
app.put('/competencias/:id', competenciasController.editarCompetencia);

var port = '8080';

app.listen(port, function () {
  console.log( "Escuchando en el puerto " + port );
});