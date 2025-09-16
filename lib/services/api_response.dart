class ApiResponse<T> {
  bool succes;
  String msg;
  T? result;  // Pode ser nulo, já que nem sempre teremos um 'result'

  // Construtor para resposta de sucesso
  ApiResponse.succes(this.result)
      : succes = true,
        msg = '';  // Para sucesso, podemos definir uma mensagem padrão vazia

  // Construtor para resposta de erro
  ApiResponse.error(this.msg)
      : succes = false,
        result = null;  // Quando for erro, o 'result' é nulo
}
