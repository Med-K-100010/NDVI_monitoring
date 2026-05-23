PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS parcelles (
    id_parcelle INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_etudiant TEXT NOT NULL,
    region TEXT NOT NULL,
    geom TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS ndvi_gee (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_parcelle INTEGER NOT NULL,
    date_image TEXT NOT NULL,
    ndvi_moyen REAL,
    ndvi_median REAL,
    ndvi_min REAL,
    ndvi_max REAL,
    ndvi_std REAL,
    source TEXT DEFAULT 'GEE',
    FOREIGN KEY(id_parcelle) REFERENCES parcelles(id_parcelle)
);

CREATE TABLE IF NOT EXISTS ndvi_modis (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_parcelle INTEGER NOT NULL,
    date_carte TEXT NOT NULL,
    ndvi_moyen REAL,
    ndvi_median REAL,
    ndvi_min REAL,
    ndvi_max REAL,
    ndvi_std REAL,
    source TEXT DEFAULT 'MODIS',
    file_path TEXT,
    FOREIGN KEY(id_parcelle) REFERENCES parcelles(id_parcelle)
);

CREATE TABLE IF NOT EXISTS comparaison_ndvi (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_parcelle INTEGER NOT NULL,
    date_gee TEXT NOT NULL,
    date_modis TEXT NOT NULL,
    ecart_jours INTEGER,
    ndvi_moy_gee REAL,
    ndvi_moy_modis REAL,
    ndvi_med_gee REAL,
    ndvi_med_modis REAL,
    erreur_moy REAL,
    erreur_med REAL,
    rmse REAL,
    FOREIGN KEY(id_parcelle) REFERENCES parcelles(id_parcelle)
);
