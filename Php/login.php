<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>

<body>
  <?php
  $servidor = "localhost";
  $usuario = "root";
  $senha = "";
  $dbname = "easy_market";

  $conexao = mysqli_connect($servidor, $usuario, $senha, $dbname);

  if (!$conexao) {
    die("Falha na conexão: " . mysqli_connect_error());
  }

  $email = isset($_POST['email']) ? $_POST['email'] : '';
  $senha = isset($_POST['senha']) ? $_POST['senha'] : '';

  if (empty($email) || empty($senha)) {
    echo "Por favor, preencha todos os campos.<br>";
  } else {
    $email = mysqli_real_escape_string($conexao, $email);
    $senha = md5($senha);

    $sql = "SELECT email FROM empresa WHERE email='$email'";
    $resultado = mysqli_query($conexao, $sql);

    if (mysqli_num_rows($resultado) > 0) {
      echo "Email já cadastrado.<br>";
    } else {
      $sql = "INSERT INTO empresa (email, senha) VALUES ('$email', '$senha')";
      $resultado = mysqli_query($conexao, $sql);

      if ($resultado) {
        echo "Usuario Logado";
      } else {
        echo "Erro ao cadastrar o usuário: " . mysqli_error($conexao);
      }
    }
  }
  mysqli_close($conexao);
  ?>
</body>

</html>