DROP TABLE IF EXISTS chicas;
DROP TABLE IF EXISTS centros;

CREATE TABLE centros (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  ubicacion VARCHAR(255),
  email VARCHAR(255),
  telefono VARCHAR(50),
  web VARCHAR(500),
  tipo VARCHAR(50) DEFAULT 'Publico',
  horario VARCHAR(255),
  grado VARCHAR(255),
  estado_contacto VARCHAR(50) DEFAULT 'Pendiente',
  notas VARCHAR(1000),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE chicas (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  telefono VARCHAR(50),
  centro_id UUID REFERENCES centros(id) ON DELETE SET NULL,
  estado VARCHAR(50) DEFAULT 'Pendiente',
  fecha_entrevista TIMESTAMPTZ,
  notas VARCHAR(1000),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE centros ENABLE ROW LEVEL SECURITY;
ALTER TABLE chicas ENABLE ROW LEVEL SECURITY;

CREATE POLICY "allow_all_centros" ON centros FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all_chicas" ON chicas FOR ALL USING (true) WITH CHECK (true);

INSERT INTO centros (nombre, ubicacion, email, telefono, web, tipo, horario, grado) VALUES ('Institut Torre Roja', 'Viladecans', 'secretaria@torreroja.cat', '93 637 37 00', 'https://agora.xtec.cat/iestorreroja/', 'Publico', 'Tarde', 'CFGS Marketing i Publicitat');

INSERT INTO centros (nombre, ubicacion, email, telefono, web, tipo, horario, grado) VALUES ('Centro de FP Universae', 'Cornella / Sant Joan Despi / Online', 'Whatsapp', '93 271 27 39', 'https://universae.com/', 'Privado', 'Manana y Flexible', 'CFGS Marketing i Publicitat +3 variantes');

INSERT INTO centros (nombre, ubicacion, email, telefono, web, tipo, horario, grado) VALUES ('Fundacio Obicex Esplugues', 'Esplugues de Llobregat', 'empreses@obicex.es', '64 840 38 73', 'https://www.tuformacionprofesional.com/', 'Privado', 'Manana y Tarde', 'CFGS Marketing i Publicitat');

INSERT INTO centros (nombre, ubicacion, email, telefono, web, tipo, horario, grado) VALUES ('FP Nuria', 'Gava', 'practiques@escolesnuria.cat', '93 662 21 13', 'https://escolesnuria.cat/ca/', 'Privado', 'Manana y Tarde', 'CFGS Marketing i Publicitat');

INSERT INTO centros (nombre, ubicacion, email, telefono, web, tipo, horario, grado) VALUES ('Institut Joan Oro', 'Martorell', 'secretaria@iesjoanoro.cat', '93 775 36 18', 'https://institutjoanoro.cat', 'Publico', 'Tarde', 'CFGS Marketing i Publicitat');

INSERT INTO centros (nombre, ubicacion, email, telefono, web, tipo, horario, grado) VALUES ('Institut Provencana', 'L-Hospitalet de Llobregat', 'informacio@proven.cat', '93 338 25 53', 'https://www.proven.cat', 'Publico', 'Manana y Tarde', 'CFGS Marketing i Publicitat');

INSERT INTO centros (nombre, ubicacion, email, telefono, web, tipo, horario, grado) VALUES ('Jaume Balmes', 'L-Hospitalet de Llobregat', 'info@balmesonline.com', '93 336 56 54', 'https://ciclesformatius.es/', 'Privado', 'Tarde', 'CFGS Marketing i Publicitat');

INSERT INTO centros (nombre, ubicacion, email, telefono, web, tipo, horario, grado) VALUES ('CEAC Formacio Professional', 'L-Hospitalet de Llobregat', 'info@ceac.com', '91 217 45 98', 'https://www.ceac.es/fp-oficial-barcelona', 'Privado', 'Manana y Tarde', 'CFGS Marketing i Publicitat');

INSERT INTO centros (nombre, ubicacion, email, telefono, web, tipo, horario, grado) VALUES ('MEDAC Hospitalet', 'L-Hospitalet de Llobregat / Online', 'hospitalet@davante.es', '93 629 59 69', 'https://medac.es/fp-barcelona/carrer-miguel-hernandez-77', 'Privado', 'Manana y Tarde', 'CFGS Marketing i Publicitat');

INSERT INTO centros (nombre, ubicacion, email, telefono, web, tipo, horario, grado) VALUES ('Institut Marianao', 'Sant Boi de Llobregat', 'secretaria@institutmarianao.cat', '93 640 78 58', 'https://agora.xtec.cat/insmarianao/', 'Publico', 'Manana y Tarde', 'CFGS Gestio de Vendes i Espais Comercials');

INSERT INTO centros (nombre, ubicacion, email, telefono, web, tipo, horario, grado) VALUES ('Institut Francesc Ferrer i Guardia', 'Sant Joan Despi', 'iesffg@xtec.cat', '93 373 16 11', 'http://www.iesffg.cat/ca', 'Publico', 'Manana y Tarde', 'CFGS Gestio de Vendes i Espais Comercials');
