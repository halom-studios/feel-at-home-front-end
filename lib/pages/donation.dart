import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class DonationPage extends StatefulWidget {
  DonationPage({Key? key}) : super(key: key);

  @override
  _DonationPageState createState() => _DonationPageState();
}

class Endereco {
  final String logradouro;
  final String cep;
  final String estado;
  final String cidade;

  Map<String, dynamic> toJson() => {
        'logradouro': logradouro,
        'cep': cep,
        'estado': estado,
        'cidade': cidade,
      };

  Endereco(this.logradouro, this.cep, this.estado, this.cidade);
}

class Doador {
  final String nome;
  final String email;
  final String telefone;
  final Endereco endereco;

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'email': email,
        'telefone': telefone,
        'endereco': endereco,
      };

  Doador(this.nome, this.email, this.telefone, this.endereco);
}

class Doacao {
  final Doador doador;
  final String instituicao = "3fa85f64-5717-4562-b3fc-2c963f66afa6";
  final int tipoDoacao = 0;
  final String valor;

  Map<String, dynamic> toJson() => {
        'doador': doador,
        'instituicao': instituicao,
        'tipoDoacao': tipoDoacao,
        'valor': valor,
      };

  Doacao(this.doador, this.valor);
}

void getHttp() async {
  try {
    var response = await Dio().get('http://www.google.com');
    print(response);
  } catch (e) {
    print(e);
  }
}

Future<String> sendDonation(Doacao doacao) async {
  var bodyJson = json.encode(doacao);
  print(bodyJson);

  // final response = await http.post(Uri.parse('https://localhost:5001/api/doacao'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: bodyJson);
  
  final response = await Dio().get('http://www.google.com');

  if (response.statusCode == 201) {
    return response.data;
  } else {
    return "Falha ao fazer a doação ${response.statusCode}";
  }
}

class _DonationPageState extends State<DonationPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorTelefone = TextEditingController();
  final TextEditingController _controladorEndereco = TextEditingController();
  final TextEditingController _controladorLogradouro = TextEditingController();
  final TextEditingController _controladorCep = TextEditingController();
  final TextEditingController _controladorEstado = TextEditingController();
  final TextEditingController _controladorCidade = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Formulário de doação",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Card(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                  vertical: MediaQuery.of(context).size.height * 0.1),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        controller: _controladorNome,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: "Nome",
                          hintText: 'Por favor preencha com seu nome',
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(fontSize: 20),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor digite seu nome';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _controladorEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          hintText: 'Um e-mail válido',
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(fontSize: 20),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor digite um e-mail';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _controladorTelefone,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Telefone",
                          hintText: 'Numero de telefone',
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _controladorLogradouro,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                          labelText: "Logradouro",
                          hintText: '',
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(fontSize: 20),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor digite um endereço válido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _controladorCep,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "CEP",
                          hintText: '',
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(fontSize: 20),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor digite um endereço válido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _controladorEstado,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                          labelText: "Estado",
                          hintText: '',
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(fontSize: 20),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor digite um endereço válido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _controladorCidade,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                          labelText: "Cidade",
                          hintText: '',
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(fontSize: 20),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor digite um endereço válido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _controladorValor,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Valor",
                          hintText: 'Valor em R\$ a ser doado',
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        style: TextStyle(fontSize: 20),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor digite o quanto irá doar';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.3, 1],
                            colors: [
                              Color(0xFFF58524),
                              Color(0XFFDFC233),
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: SizedBox.expand(
                          child: TextButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Criar",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final String nome = _controladorNome.text;
                                final String email = _controladorEmail.text;
                                final String telefone =
                                    _controladorTelefone.text;
                                final String logradouro =
                                    _controladorLogradouro.text;
                                final String cep = _controladorCep.text;
                                final String estado = _controladorEstado.text;
                                final String cidade = _controladorCidade.text;
                                final String valor = _controladorValor.text;

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Obrigado pela sua doação!')),
                                );

                                var endereco =
                                    Endereco(logradouro, cep, estado, cidade);
                                var doador =
                                    Doador(nome, email, telefone, endereco);
                                var doacao = Doacao(doador, valor);

                                print(sendDonation(doacao));
                              } else {
                                getHttp();
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
