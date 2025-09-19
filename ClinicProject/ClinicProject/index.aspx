<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ClinicProject.index" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>HealthyCare — Book an Appointment</title>
    <meta name="description" content="Fast, easy patient appointments. Choose a doctor, pick a date & time, and get reminders." />
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* small hero accent */
        .gradient-blob {
            background: radial-gradient(circle at 20% 20%, rgba(99,102,241,0.12), transparent 15%), radial-gradient(circle at 80% 80%, rgba(16,185,129,0.08), transparent 20%);
        }
    </style>
</head>
<body class="bg-gray-50 text-gray-800 antialiased">
    <!-- Header -->
    <header class="bg-white border-b">
        <div class="mx-auto max-w-7xl px-6 py-4 flex items-center justify-between">
            <a href="#" class="flex items-center gap-3">
                <div class="w-10 h-10 rounded-lg bg-indigo-600 flex items-center justify-center text-white font-semibold">HC</div>
                <span class="font-semibold text-lg">HealthyCare</span>
            </a>
            <nav class="hidden md:flex items-center gap-6 text-sm">
                <a href="#features" class="hover:text-indigo-600">Features</a>
                <a href="#doctors" class="hover:text-indigo-600">Doctors</a>
                <a href="#contact" class="hover:text-indigo-600">Contact</a>
                <a href="#book" class="px-4 py-2 bg-indigo-600 text-white rounded-md shadow hover:bg-indigo-700">Book Now</a>
                <a href="DoctorRegister.aspx" class="px-4 py-2 bg-indigo-900 text-white rounded-md shadow hover:bg-indigo-700">Doctor Register/Login</a>
            </nav>
            <button class="md:hidden p-2 rounded-md focus:outline-none" aria-label="Open menu">☰</button>
        </div>
    </header>

    <main class="mx-auto max-w-7xl px-6 py-12">
        <div class="grid lg:grid-cols-2 gap-12 items-center">
            <section>
                <div class="gradient-blob p-6 rounded-2xl">
                    <h1 class="text-3xl sm:text-4xl font-extrabold leading-tight">Book patient appointments in seconds</h1>
                    <p class="mt-4 text-gray-600">Fast scheduling, automated reminders, and telehealth options — all in one place. Save time and get the care you need.</p>

                    <ul class="mt-6 grid grid-cols-1 sm:grid-cols-2 gap-3 text-sm">
                        <li class="flex items-start gap-3">
                            <span class="mt-1 text-indigo-600">●</span>
                            <span>Same-day appointments</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="mt-1 text-indigo-600">●</span>
                            <span>Doctor profiles & specialties</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="mt-1 text-indigo-600">●</span>
                            <span>Secure patient data</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="mt-1 text-indigo-600">●</span>
                            <span>Appointment reminders</span>
                        </li>
                    </ul>

                    <div class="mt-8 flex gap-3">
                        <a href="#book" class="inline-flex items-center gap-2 px-5 py-3 bg-indigo-600 text-white rounded-md shadow hover:bg-indigo-700">Book an Appointment</a>
                        <a href="#features" class="inline-flex items-center gap-2 px-5 py-3 border rounded-md">Learn more</a>
                    </div>
                </div>
            </section>

            <!-- Appointment card -->
            <aside id="book" class="bg-white rounded-2xl shadow p-6">
                <h2 class="text-xl font-semibold">Schedule an appointment</h2>
                <p class="text-sm text-gray-500 mt-1">Fill details below — this demo stores nothing and shows a confirmation locally.</p>

                <form id="appointmentForm" class="mt-4 space-y-4" action="PatientSchedule.aspx" method="post">
                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
                        <div>
                            <label class="text-sm font-medium">Full name</label>
                            <input type="text" id="name" required class="mt-1 block w-full rounded-md border-gray-200 shadow-sm focus:ring-2 focus:ring-indigo-200 p-2" placeholder="Jane Doe" name="name">
                            <span class="text-xs text-red-600 hidden" id="error-name"></span>
                        </div>
                        <div>
                            <label class="text-sm font-medium">Phone</label>
                            <input type="tel" id="phone" required class="mt-1 block w-full rounded-md border-gray-200 shadow-sm focus:ring-2 focus:ring-indigo-200 p-2" placeholder="+91 98765 43210" name="phone">

                            <span class="text-xs text-red-600 hidden" id="error-phone"></span>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
                        <div>
                            <label class="text-sm font-medium">Email</label>
                            <input type="email" id="email" class="mt-1 block w-full rounded-md border-gray-200 shadow-sm focus:ring-2 focus:ring-indigo-200 p-2" placeholder="you@example.com" name="email">

                            <span class="text-xs text-red-600 hidden" id="error-email"></span>
                        </div>
                        <div>
                            <label class="text-sm font-medium">Select doctor</label>
                            <select id="doctor" name="doctor" class="mt-1 block w-full rounded-md border-gray-200 p-2">
                                <option value="" selected>Select the Doctor</option>
                                <%
                                    string path = "Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog=hospital;Integrated Security=True";

                                    SqlConnection con = new SqlConnection(path);

                                    SqlCommand cmd = new SqlCommand("SELECT userId,username FROM Users WHERE isApproved=1 AND roleId=1", con);
                                    con.Open();

                                    SqlDataReader cr = cmd.ExecuteReader();

                                    while (cr.Read())
                                    {
%>
                                <option value="<%Response.Write(cr["userId"]); %>"><%Response.Write(cr["username"]); %></option>
                                <%
                                    }
                                %>
                            </select>

                            <span class="text-xs text-red-600 hidden" id="error-doctor"></span>
                        </div>
                    </div>

                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
                        <div>
                            <label class="text-sm font-medium">Date</label>
                            <input type="date" id="date" required class="mt-1 block w-full rounded-md border-gray-200 shadow-sm focus:ring-2 focus:ring-indigo-200 p-2" name="pdate">

                            <span class="text-xs text-red-600 hidden" id="error-date"></span>
                        </div>
                        <div>
                            <label class="text-sm font-medium">Time</label>
                            <input type="time" id="time" required class="mt-1 block w-full rounded-md border-gray-200 shadow-sm focus:ring-2 focus:ring-indigo-200 p-2" name="ptime">

                            <span class="text-xs text-red-600 hidden" id="error-time"></span>
                        </div>
                    </div>

                    <div>
                        <label class="text-sm font-medium">Symptoms / Notes</label>
                        <textarea id="notes" rows="3" class="mt-1 block w-full rounded-md border-gray-200 shadow-sm p-2" placeholder="Brief description (optional)" name="note"></textarea>

                        <span class="text-xs text-red-600 hidden" id="error-notes"></span>
                    </div>

                    <div class="flex items-center justify-between gap-3">
                        <button type="submit" class="inline-flex items-center gap-2 px-5 py-3 bg-indigo-600 text-white rounded-md shadow hover:bg-indigo-700">Confirm Appointment</button>
                        <button type="button" id="clearBtn" class="px-4 py-2 border rounded-md">Clear</button>
                    </div>
                </form>



            </aside>
        </div>

        <section id="features" class="mt-16">
            <h3 class="text-2xl font-semibold">Why patients love HealthyCare</h3>
            <div class="mt-6 grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
                <div class="bg-white p-5 rounded-xl shadow">
                    <h4 class="font-semibold">Quick Booking</h4>
                    <p class="mt-2 text-sm text-gray-600">Pick a slot and confirm in under 60 seconds.</p>
                </div>
                <div class="bg-white p-5 rounded-xl shadow">
                    <h4 class="font-semibold">Reminders</h4>
                    <p class="mt-2 text-sm text-gray-600">Email & SMS reminders so you never miss a visit.</p>
                </div>
                <div class="bg-white p-5 rounded-xl shadow">
                    <h4 class="font-semibold">Secure Records</h4>
                    <p class="mt-2 text-sm text-gray-600">Patient information is encrypted and private.</p>
                </div>
                <div class="bg-white p-5 rounded-xl shadow">
                    <h4 class="font-semibold">Telehealth</h4>
                    <p class="mt-2 text-sm text-gray-600">Video consults available for remote care.</p>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer id="contact" class="mt-12 text-sm text-gray-600">
            <div class="border-t pt-6 flex flex-col sm:flex-row items-center justify-between gap-4">
                <p>© <span id="year"></span>HealthyCare. All rights reserved.</p>
                <div class="flex items-center gap-4">
                    <a href="#" class="hover:text-indigo-600">Privacy</a>
                    <a href="#" class="hover:text-indigo-600">Terms</a>
                    <a href="#" class="hover:text-indigo-600">Support</a>
                </div>
            </div>
        </footer>
    </main>

    <script>
        form.addEventListener('submit', (e) => {
            e.preventDefault();

            const name = document.getElementById("name").value.trim();
            const phone = document.getElementById("phone").value.trim();
            const email = document.getElementById("email").value.trim();
            const date = document.getElementById("date").value;
            const time = document.getElementById("time").value;

            let isValid = true;

            function validateName(name) {
                return name.length >= 3;
            }

            function validatePhone(phone) {
                return /^[0-9]{10}$/.test(phone);
            }

            function validateDate(date) {
                const today = new Date().toISOString().split("T")[0];
                return date >= today;
            }

            if (!validateName(name)) {
                document.getElementById("error-name").innerText = "Enter at least 3 characters.";
                document.getElementById("error-name").classList.remove("hidden");
                isValid = false;
            } else {
                document.getElementById("error-name").classList.add("hidden");
            }

            if (!validatePhone(phone)) {
                document.getElementById("error-phone").innerText = "Enter a valid 10-digit phone.";
                document.getElementById("error-phone").classList.remove("hidden");
                isValid = false;
            } else {
                document.getElementById("error-phone").classList.add("hidden");
            }

            if (!validateDate(date)) {
                document.getElementById("error-date").innerText = "Pick today or a future date.";
                document.getElementById("error-date").classList.remove("hidden");
                isValid = false;
            } else {
                document.getElementById("error-date").classList.add("hidden");
            }

            if (!email.includes("@")) {
                document.getElementById("error-email").innerText = "Enter a valid email address.";
                document.getElementById("error-email").classList.remove("hidden");
                isValid = false;
            } else {
                document.getElementById("error-email").classList.add("hidden");
            }

            if (!document.getElementById("doctor").value) {
                document.getElementById("error-doctor").innerText = "Please select a doctor.";
                document.getElementById("error-doctor").classList.remove("hidden");
                isValid = false;
            } else {
                document.getElementById("error-doctor").classList.add("hidden");
            }

            if (isValid) {
                form.submit();
            }
        });

    </script>
</body>
</html>

