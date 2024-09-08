<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Blood Bank Update</title>
    <style>
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
            line-height: 1.6;
            background-image: url('3.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        header {
            background-color: #8a1f1f;
            color: #fff;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .logo img {
            max-width: 80px;
            height: auto;
        }

        .title {
            font-size: 28px;
            font-weight: 700;
            text-align: center;
            margin: 0;
        }

        .home-link {
            background-color: #e4dede;
            color: #1c1a1a;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .home-link:hover {
            background-color: #a63333;
            color: #fff;
        }

        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #8a1f1f;
            font-size: 24px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="password"],
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .form-group button {
            background-color: #8a1f1f;
            color: #fff;
            border: none;
            padding: 12px 20px;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .form-group button:hover {
            background-color: #7f1d1d;
        }

        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 20px;
            }

            .home-link {
                padding: 8px 16px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <img src="2.png" alt="Blood Bank Logo">
        </div>
        <h1 class="title">Blood Bank Update</h1>
        <a href="home.html" class="home-link">Home</a>
    </header>
    <div class="container">
        <h1>Update Your Information</h1>
        <form id="updateForm" action="/update" method="post">
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" required>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password">
            </div>
            <div class="form-group">
                <label for="bloodGroup">Blood Group:</label>
                <select id="bloodGroup" name="bloodGroup">
                    <option value="A+">A+</option>
                    <option value="B+">B+</option>
                    <option value="O+">O+</option>
                    <!-- Add more blood group options as needed -->
                </select>
            </div>
            <div class="form-group">
                <button type="submit">Update</button>
            </div>
        </form>
    </div>

    <!-- Include your JavaScript here or in a separate script file -->
    <script>
        // Function to fetch user data from the server
        async function fetchUserData() {
            try {
                const response = await fetch('/api/user', {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json'
                        // You might need additional headers depending on your backend setup
                    }
                });
                if (!response.ok) {
                    throw new Error('Failed to fetch user data');
                }
                const userData = await response.json();
                return userData;
            } catch (error) {
                console.error('Error fetching user data:', error);
                return null;
            }
        }

        // Function to populate form fields with user data
        async function populateForm() {
            const userData = await fetchUserData();
            if (userData) {
                document.getElementById("firstName").value = userData.firstName;
                document.getElementById("lastName").value = userData.lastName;
                document.getElementById("email").value = userData.email;
                // Note: Password should not be pre-filled for security reasons
                document.getElementById("bloodGroup").value = userData.bloodGroup;
            } else {
                // Handle error or inform user that data could not be fetched
                alert('Failed to fetch user data. Please try again later.');
            }
        }

        // Populate form with user data on page load
        document.addEventListener("DOMContentLoaded", function() {
            populateForm();
        });
    </script>
</body>
</html>
