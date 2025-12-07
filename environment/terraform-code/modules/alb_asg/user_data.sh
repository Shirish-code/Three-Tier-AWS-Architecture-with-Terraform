#!/bin/bash
dnf update -y

dnf install -y httpd php php-fpm php-mysqlnd php-json mariadb1011-client-utils

systemctl enable httpd php-fpm
systemctl start httpd php-fpm

cat <<EOF > /etc/httpd/conf.d/php-fpm.conf
<FilesMatch \.php$>
    SetHandler "proxy:unix:/run/php-fpm/www.sock|fcgi://localhost/"
</FilesMatch>
EOF

systemctl restart httpd

echo "OK" > /var/www/html/health.html

cat <<EOF > /var/www/html/index.php
<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

\$servername = "${db_host}";
\$username   = "${db_username}";
\$password   = "${db_password}";
\$dbname     = "${db_name}";

\$conn = new mysqli(\$servername, \$username, \$password, \$dbname);
if (\$conn->connect_error) {
    die("DB Connection failed: " . \$conn->connect_error);
}

if (\$_SERVER["REQUEST_METHOD"] == "POST") {
    \$name  = \$_POST['name'] ?? '';
    \$email = \$_POST['email'] ?? '';

    if (!empty(\$name) && !empty(\$email)) {
        \$stmt = \$conn->prepare("INSERT INTO users (name, email) VALUES (?, ?)");
        if (!\$stmt) {
            die("Prepare failed: " . \$conn->error);
        }
        \$stmt->bind_param("ss", \$name, \$email);
        \$stmt->execute();
        \$stmt->close();
        echo "<p>Data inserted successfully!</p>";
    }
}

# Safe IMDSv2 call (won’t crash PHP)
\$token = @file_get_contents("http://169.254.169.254/latest/api/token", false, stream_context_create([
    "http" => [
        "method" => "PUT",
        "header" => "X-aws-ec2-metadata-token-ttl-seconds: 21600"
    ]
]));

\$instance_id = "UNKNOWN";
if (\$token !== false) {
    \$instance_id = trim(file_get_contents(
        "http://169.254.169.254/latest/meta-data/instance-id",
        false,
        stream_context_create([
            "http" => [
                "header" => "X-aws-ec2-metadata-token: \$token"
            ]
        ])
    ));
}
?>
<!DOCTYPE html>
<html>
<head><title>EC2 + RDS</title></head>
<body>
<h1>EC2 Instance ID: <?php echo htmlspecialchars(\$instance_id); ?></h1>
<form method="post">
  Name: <input type="text" name="name" required><br><br>
  Email: <input type="email" name="email" required><br><br>
  <button type="submit">Submit</button>
</form>
</body>
</html>
<?php \$conn->close(); ?>
EOF

chown apache:apache /var/www/html/index.php
chmod 644 /var/www/html/index.php