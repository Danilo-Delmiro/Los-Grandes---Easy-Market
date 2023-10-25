<?php
$servidor = "localhost";
$usuario = "root";
$senha = "";
$dbname = "easy_market";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $product_name = $_POST["Nome"];
    $product_quantity = $_POST["Quantidade"];
    $product_price = $_POST["Preco"];

    $conexao = new mysqli($servidor, $usuario, $senha, $dbname);
    if ($conexao->connect_error) {
        die("Falha na conexão: " . $conexao->connect_error);
    }

    $stmt = $conexao->prepare("INSERT INTO produtos (Nome, Preco, Quantidade) VALUES (?, ?, ?)");
    $stmt->bind_param("ssd", $product_name, $product_quantity, $product_price);

    if ($stmt->execute()) {
        echo "Produto inserido com sucesso.";
    } else {
        echo "Erro ao inserir o produto: " . $stmt->error;
    }

    $stmt->close();
    $conexao->close();
}
?>

<?php
$conexao = new mysqli("localhost", "root", "", "easy_market");

if ($conexao->connect_error) {
    die("Falha na conexão: " . $conexao->connect_error);
}

$sql = "SELECT * FROM produtos";
$resultado = $conexao->query($sql);

if ($resultado->num_rows > 0) {
    echo "<table>";
    echo "<tr><th>ID</th><th>Nome</th><th>Preço</th><th>Quantidade</th></tr>";
}

while ($row = $resultado->fetch_assoc()) {
    echo "<tr>";
    echo "<td>" . $row["ID_Produto"] . "</td>";
    echo "<td>" . $row["Nome"] . "</td>";
    echo "<td>" . $row["Preco"] . "</td>";
    echo "<td>" . $row["Quantidade"] . "</td>";
    echo "</tr>";
}
echo "</table>";

$conexao->close();
?>
