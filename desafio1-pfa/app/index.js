const express = require('express');
const app = express();
const port = 3000;
const config = {
    host: 'pfa-mysql-d1',
    user: 'root',
    password: 'root',
    database: 'dbpfad1'
}

const mysql = require('mysql');
var connection = mysql.createConnection(config)

app.get('/', (req, res) => {
    connection.query(`select * from modulo`, function (error, results, fields) {
        if (error) {
            if (error.code == "ECONNREFUSED")
                return res.status(503).send({ error: "Aguardando Conexão Com Bando de Dados! Tente novamente mais tarde" })
            return res.status(500).send({ error: "Erro ao acessar banco de dados!" })
        }
        return res.send(results);
    });
})

app.listen(port, () => {
    console.log(`Servidor rodando na porta: ${port}`)
})