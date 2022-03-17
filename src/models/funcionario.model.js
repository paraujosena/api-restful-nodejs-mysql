var dbConn = require('./../../config/db.config');

//Funcionario object create
var Funcionario = function(funcionario) {
    this.primeiro_nome = funcionario.primeiro_nome;
    this.ultimo_nome = funcionario.ultimo_nome;
    this.email = funcionario.email;
    this.telefone = funcionario.telefone;
    this.empresa = funcionario.empresa;
    this.funcao = funcionario.funcao;
    this.salario = funcionario.salario;
    this.status = funcionario.status ? funcionario.status : 1;
    this.data_criacao = new Date();
    this.data_atualizacao = new Date();
};

Funcionario.insere = function(NovoFunc, result) {
    dbConn.query("INSERT INTO funcionarios set ?", NovoFunc, function(err, res) {
        if (err) {
            console.log("error: ", err);
            result(err, null);
        } else {
            console.log(res.insertId);
            result(null, res.insertId);
        }
    });
};
Funcionario.procuraId = function(id, result) {
    dbConn.query("Select * from funcionarios where id = ? ", id, function(err, res) {
        if (err) {
            console.log("error: ", err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};
Funcionario.procuraTodos = function(result) {
    dbConn.query("Select * from funcionarios", function(err, res) {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        } else {
            console.log('funcionarios : ', res);
            result(null, res);
        }
    });
};
Funcionario.altera = function(id, funcionario, result) {
    dbConn.query("UPDATE funcionarios SET primeiro_nome=?,ultimo_nome=?,email=?,telefone=?,empresa=?,funcao=?,salario=? WHERE id = ?", [funcionario.primeiro_nome, funcionario.ultimo_nome, funcionario.email,
        funcionario.telefone, funcionario.empresa, funcionario.funcao, funcionario.salario, id
    ], function(err, res) {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        } else {
            result(null, res);
        }
    });
};
Funcionario.apaga = function(id, result) {
    dbConn.query("DELETE FROM funcionarios WHERE id = ?", [id], function(err, res) {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        } else {
            result(null, res);
        }
    });
};

module.exports = Funcionario;