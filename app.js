const mysql = require('mysql2')

const con = mysql.createConnection({
    host: 'localhost', 
    user: 'root', 
    password: '161023@Fr', 
    database: 'freela' 
});


con.connect((err) => {
    if (err) {
        console.log('Erro connecting to database...', err)
        return
    }
    console.log('Connection established!')

    var sql = "INSERT INT USUARIO (cpf, nome, descricao, avaliacao, foto)"
    var values = [
        ['46546', 'Valdemar', 'ovo', 5, 'goafdas']
    ]

    con.query(sql,[values],function(err,result){

    })
})

con.end((err) => {
    if(err) {
        console.log('Erro to finish connection...', err)
        return 
    }
    console.log('The connection was finish...')
})