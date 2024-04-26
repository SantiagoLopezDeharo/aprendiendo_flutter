class Preguntas 
{
  const Preguntas(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getRespRand()
  {
    final resprand = List.of(answers);
    resprand.shuffle();
    return resprand;
  }
}