<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Elegant Cuts Salon</title>
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: #fdfbfb;
      margin: 0;
      padding: 0;
      color: #333;
    }
    header {
      background-color: #e91e63;
      color: white;
      text-align: center;
      padding: 20px 0;
      font-size: 2em;
    }
    .nav {
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      gap: 10px;
      background: #fff;
      padding: 10px;
      border-bottom: 1px solid #ccc;
    }
    .nav button {
      padding: 10px 20px;
      background-color: #e91e63;
      color: white;
      border: none;
      cursor: pointer;
      border-radius: 5px;
      transition: background 0.3s;
    }
    .nav button:hover {
      background-color: #d81b60;
    }
    .container {
      max-width: 700px;
      margin: 20px auto;
      padding: 20px;
      background: white;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
    }
    .hidden {
      display: none;
    }
    input, select, textarea {
      width: 100%;
      margin: 10px 0;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 1em;
    }
    .btn {
      background-color: #e91e63;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
    }
    .btn:hover {
      background-color: #c2185b;
    }
    .gallery, .staff-gallery {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
      gap: 10px;
    }
    .gallery img, .staff-gallery img {
      width: 100%;
      border-radius: 10px;
      transition: transform 0.3s ease;
      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    }
    .gallery img:hover, .staff-gallery img:hover {
      transform: scale(1.05);
    }
    footer {
      text-align: center;
      padding: 15px;
      background: #eee;
      margin-top: 40px;
      font-size: 0.9em;
      color: #555;
    }
    .appointment-summary {
      margin-top: 20px;
      background: #e0f7fa;
      padding: 15px;
      border: 1px solid #00acc1;
      border-radius: 5px;
    }
  </style>
</head>
<body>
  <header>Welcome to Elegant Cuts Salon</header>

  <div class="nav">
    <button onclick="showSection('signIn')">Sign In</button>
    <button onclick="showSection('signUp')">Sign Up</button>
    <button onclick="showSection('book')">Book</button>
    <button onclick="showSection('gallery')">Gallery</button>
    <button onclick="showSection('staff')">Our Staff</button>
    <button onclick="showSection('contact')">Contact</button>
    <button onclick="showSection('admin')">Admin</button>
    <button onclick="logout()">Logout</button>
  </div>

  <main>
    <section id="signIn" class="container hidden fade-in">
      <h2>Sign In</h2>
      <form onsubmit="signIn(event)">
        <input type="email" id="signin-email" placeholder="Email" required>
        <input type="password" id="signin-password" placeholder="Password" required>
        <button class="btn" type="submit">Login</button>
      </form>
    </section>

    <section id="signUp" class="container hidden fade-in">
      <h2>Sign Up</h2>
      <form onsubmit="signUp(event)">
        <input type="text" id="signup-name" placeholder="Full Name" required>
        <input type="email" id="signup-email" placeholder="Email" required>
        <input type="password" id="signup-password" placeholder="Password" required>
        <button class="btn" type="submit">Register</button>
      </form>
    </section>

    <section id="book" class="container hidden fade-in">
      <h2>Book Your Appointment</h2>
      <form onsubmit="bookAppointment(event)">
        <input type="text" id="book-name" placeholder="Your Name" required>
        <input type="date" id="book-date" required>
        <input type="time" id="book-time" required>
        <select id="book-service" required>
          <option value="">Select Service</option>
          <option value="Haircut">Haircut</option>
          <option value="Coloring">Coloring</option>
          <option value="Styling">Styling</option>
          <option value="Hair Spa">Hair Spa</option>
        </select>
        <button class="btn" type="submit">Book Now</button>
      </form>
      <div id="confirmation" class="appointment-summary hidden"></div>
    </section>

    <section id="gallery" class="container hidden fade-in">
      <h2>Our Haircut Styles</h2>
      <div class="gallery">
        <img src="OIP (1).jpeg" alt="Style 1">
        <img src="OIP (2).jpeg" alt="Style 2">
        <img src="OIP (5).jpeg" alt="Style 3">
        <img src="OIP (6).jpeg" alt="Style 4">
        
      
      </div>
    </section>

    <section id="staff" class="container hidden fade-in">
      <h2>Meet Our Stylists</h2>
      <div class="staff-gallery">
        <img src="OIP (1).jpeg" alt="Stylist 1">
        <img src="OIP (2).jpeg" alt="Stylist 2">
        <img src="OIP (5).jpeg" alt="Stylist 3">
        <img src="OIP (6).jpeg" alt="Stylist 4">
      </div>
    </section>

    <section id="contact" class="container hidden fade-in">
      <h2>Contact Us</h2>
      <p>Email: bdallhmhmdalmhdy319@gmai.com</p>
      <p>Phone: +250793895937 </p>
      <p>Address: 123 Salon Street, Kigali,City</p>
      <form>
        <input type="text" placeholder="Your Name" required>
        <input type="email" placeholder="Your Email" required>
        <textarea rows="4" placeholder="Your Message" required></textarea>
        <button class="btn" type="submit">Send Message</button>
      </form>
    </section>

    <section id="admin" class="container hidden fade-in">
      <h2>Admin Dashboard</h2>
      <div id="appointments-list"></div>
    </section>
  </main>

  <footer>
    &copy; 2025 Elegant Cuts. All Rights Reserved.
  </footer>

  <script>
    const users = JSON.parse(localStorage.getItem('users')) || [];
    const appointments = JSON.parse(localStorage.getItem('appointments')) || [];
    let currentUser = null;

    function showSection(id) {
      document.querySelectorAll('section').forEach(s => s.classList.add('hidden'));
      document.getElementById(id).classList.remove('hidden');
    }

    function signUp(event) {
      event.preventDefault();
      const name = document.getElementById('signup-name').value;
      const email = document.getElementById('signup-email').value;
      const password = document.getElementById('signup-password').value;
      users.push({ name, email, password });
      localStorage.setItem('users', JSON.stringify(users));
      alert('Signup successful!');
      showSection('signIn');
    }

    function signIn(event) {
      event.preventDefault();
      const email = document.getElementById('signin-email').value;
      const password = document.getElementById('signin-password').value;
      const user = users.find(u => u.email === email && u.password === password);
      if (user) {
        currentUser = user;
        alert(`Welcome back, ${user.name}`);
        showSection('book');
      } else {
        alert('Invalid email or password');
      }
    }

    function logout() {
      currentUser = null;
      alert('Logged out');
      showSection('signIn');
    }

    function bookAppointment(event) {
      event.preventDefault();
      if (!currentUser) return alert('Please sign in first!');
      const name = document.getElementById('book-name').value;
      const date = document.getElementById('book-date').value;
      const time = document.getElementById('book-time').value;
      const service = document.getElementById('book-service').value;
      const appointment = { name, date, time, service };
      appointments.push(appointment);
      localStorage.setItem('appointments', JSON.stringify(appointments));
      document.getElementById('confirmation').innerHTML = `Thanks ${name}, your ${service} is booked for ${date} at ${time}`;
      document.getElementById('confirmation').classList.remove('hidden');
    }
    function showAppointments() {
      const list = document.getElementById('appointments-list');
      list.innerHTML = appointments.map(a => `<p>${a.name} - ${a.service} - ${a.date} ${a.time}</p>`).join('');
    }

    showAppointments();
  </script>
</body>
</html>
