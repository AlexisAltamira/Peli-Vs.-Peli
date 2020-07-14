USE competencias;
DROP TABLE IF EXISTS competencia;

CREATE TABLE competencia (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);


USE competencias;
DROP TABLE IF EXISTS voto;

CREATE TABLE voto (
  id INT NOT NULL AUTO_INCREMENT,
  pelicula_id int(11) unsigned NOT NULL,
  competencia_id INT NOT NULL,
  PRIMARY KEY (id)
);
INSERT INTO competencia (nombre) VALUES ('¿Mejor pelicula?'), ('La mas lacrimogena'), ('¿Cuál es la película más pochoclera?'), ('¿Con qué comedia te reíste más?'), ('¿Cuál película es mejor para un día de lluvia?'), ('¿Qué film de terror fue el que te asustó más?'), ('¿Cuál es el mejor thriller?'), ('¿Mejor peli para ver en pareja?');
select * from competencia;
select * from genero;
ALTER TABLE voto add FOREIGN KEY (pelicula_id) REFERENCES pelicula(id);

ALTER TABLE voto add FOREIGN KEY (competencia_id) REFERENCES competencia(id);

ALTER TABLE competencia ADD COLUMN genero_id INT (11) UNSIGNED, ADD FOREIGN KEY (genero_id) REFERENCES genero(id);

ALTER TABLE competencia ADD COLUMN director_id INT (11) UNSIGNED, ADD FOREIGN KEY (director_id) REFERENCES director(id);

ALTER TABLE competencia ADD COLUMN actor_id INT (11) UNSIGNED, ADD FOREIGN KEY (actor_id) REFERENCES actor(id);


-- pruebas para validaciones en la creacion de nueva competencia
select * from competencia;


select count(pelicula.id) as cantidad from pelicula;
describe pelicula;

select * from pelicula;

select * from actor;

select count(*) as cantidad from pelicula p left join director_pelicula dp on (p.id = dp.pelicula_id) left join actor_pelicula ap on (p.id = ap.pelicula_id) 
 where genero_id=6 and director_id = 66 and actor_id = 6;
 
select * from competencia where nombre like "%Mejor película animada%";