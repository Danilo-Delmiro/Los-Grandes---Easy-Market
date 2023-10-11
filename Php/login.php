<?php
$servidor = "localhost";
$usuario = "root";
$senha = "";
$dbname = "easy_market";

$conexao = mysqli_connect("localhost", "root", "", "easy_market");

$email = $_POST['email'];
$email = mysqli_real_escape_string($conexao, $email);

$senha = 0md5 ($_POST['senha']);
$senha = mysqli_real_escape_string($conexao, $senha);

$sql = "SELECT email FROM easy_market.usuario WHERE email='$email'";
$retorno = mysqli_query($conexao,$sql);

$sql = "SELECT senha from easy_market.usuario WHERE senha='$senha'";
$retorno = mysqli_query($conexao,$sql);

if(mysqli_num_rows($retorno)>0){
  echo"Email já cadastrado<br>";
}
else{
  $email = $_POST['email'];
  $senha = $_POST['senha'];

}
$sql = "INSERT INTO easy_market.usuario(email,senha) VALUES ('$email','$senha')";
if(mysqli_query($conexao, $sql)){
  echo "Usuario Cadastrado com sucesso";
}
else{
  echo "Erro".mysqli_connect_error($conexao);
}


mysqli_close($conexao);

?>