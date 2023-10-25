<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
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
    $cpf = isset($_POST['cpf']) ? $_POST['cpf'] : '';

    if (empty($email) || empty($senha) || empty($cpf)) {
        echo "Por favor, preencha todos os campos.<br>";
    } else {
        $email = mysqli_real_escape_string($conexao, $email);
        $senha = md5($senha); // 
        $cpf = mysqli_real_escape_string($conexao, $cpf);

        $sql = "SELECT email FROM empresa WHERE email='$email'";
        $resultado = mysqli_query($conexao, $sql);

        if (mysqli_num_rows($resultado) > 0) {
            echo "Email já cadastrado.<br>";
        } else {
            $sql = "INSERT INTO cadastro (email, senha, cpf) VALUES ('$email', '$senha', '$cpf')";
            $resultado = mysqli_query($conexao, $sql);

            if ($resultado) {
                echo "Usuário Cadastrado<br>";
            } else {
                echo "Erro ao cadastrar o usuário: " . mysqli_error($conexao);
            }
        }
    }

    mysqli_close($conexao);

    function validarCPF($cpf)
    {

        $cpf = preg_replace('/[^0-9]/', '', $cpf);


        if (strlen($cpf) != 11) {
            return false;
        }


        for ($i = 9; $i < 11; $i++) {
            $digito = 0;
            for ($j = 0; $j < $i; $j++) {
                $digito += $cpf[$j] * (($i + 1) - $j);
            }
            $digito = ($digito % 11) < 2 ? 0 : 11 - ($digito % 11);
            if ($cpf[$i] != $digito) {
                return false;
            }
        }

        return true;
    }

    $cpf = isset($_POST['cpf']) ? $_POST['cpf'] : '';

    if (!empty($cpf) && validarCPF($cpf)) {
    } else {
    }

    ?>
</body>

</html>