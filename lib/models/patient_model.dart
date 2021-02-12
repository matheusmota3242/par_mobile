class Patient {
  int id;
  String numArquivoLiga;
  String name;
  String age;
  String sex;
  DateTime creationDate;

  int get getId => id;

  set setId(int id) => this.id = id;

  String get getNumArquivoLiga => numArquivoLiga;

  set setNumArquivoLiga(String numArquivoLiga) =>
      this.numArquivoLiga = numArquivoLiga;

  String get getName => name;

  set setName(String name) => this.name = name;

  String get getAge => age;

  set setAge(String age) => this.age = age;

  String get getSex => sex;

  set setSex(String sex) => this.sex = sex;

  DateTime get getCreationDate => creationDate;

  set setCreationDate(DateTime creationDate) =>
      this.creationDate = creationDate;

  Patient(this.id, this.numArquivoLiga, this.name, this.age, this.sex,
      this.creationDate) {
    if (this.sex == 'F') {
      this.sex = 'Feminino';
    } else if (this.sex == 'M') {
      this.sex = 'Masculino';
    }
  }
}
