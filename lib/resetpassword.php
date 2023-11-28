<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];

    // Generate a new password
    $newPassword = generateRandomPassword(); // Implement this function

    // Update user's password in the database
    $servername = "localhost";
    $username = "your_username";
    $password = "your_password";
    $dbname = "your_database_name";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);

    // Update password in the database for the provided email
    $sql = "UPDATE users SET password='$hashedPassword' WHERE email='$email'";

    if ($conn->query($sql) === TRUE) {
        // Send the new password to the user's email
        $to = $email;
        $subject = "Password Reset";
        $message = "Your new password is: $newPassword";
        $headers = "From: your_email@example.com";

        // Uncomment the line below to send the email (Ensure email server is properly configured)
        // mail($to, $subject, $message, $headers);

        echo "Password reset successful. Check your email for the new password.";
    } else {
        echo "Error updating password: " . $conn->error;
    }

    $conn->close();
} else {
    echo "Invalid request";
}

function generateRandomPassword($length = 8) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $password = '';

    for ($i = 0; $i < $length; $i++) {
        $password .= $characters[rand(0, strlen($characters) - 1)];
    }

    return $password;
}
?>
