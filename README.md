# Shared Vehicle Rental Platform (Swift Final Project)

## Introduction
This project is a **shared vehicle rental platform**, developed as an **iOS application using Swift**, with a **Node.js backend and MongoDB** for managing the rental process. Users can use the app to **browse available vehicles, rent and return vehicles, and manage their personal accounts and rental history**.

## Main Features
### 1. User Login
- Users log in with their **phone number and password**.
- Depending on their role, they are directed to either the **user dashboard** or the **admin panel**.

### 2. Home Page (Vehicle List)
- Displays a list of **available rental vehicles**, including:
  - Vehicle ID
  - Battery level
  - Estimated travel distance
- Users can tap a vehicle to view more details.

### 3. Map Page
- Shows the **location of the selected vehicle**.
- Provides a **rental button** that directs users to the rental page.

### 4. Rental and Return
- **Renting a vehicle**:
  - Initiated via the API `http://127.0.0.1:5000/rentCar?id=<VehicleID>`.
  - The rental button updates to **return**.
- **Returning a vehicle**:
  - Handled through the API `http://127.0.0.1:5000/returnCar?id=<VehicleID>`.
  - Redirects users to the rental history page.

### 5. Rental History
- Fetches past rental records using the API `http://127.0.0.1:5000/getRecord`.
- Displays **rental date, cost, and vehicle details**.

### 6. User Account Management
- Displays **account balance**.
- Allows users to **manage personal information**.
- Provides navigation to **rental history or the home page**.

## Technical Architecture
### Backend (Server)
- **Node.js + MongoDB** for data management.
- Vehicle list and rental functionality:
  - **CRUD (Create, Read, Update, Delete) operations via API**.
  - `http.createServer` to launch the server.
  - `url.pathname` to identify request types.
  - `url.searchParams` to parse query parameters.
- Key API endpoints:
  - `GET /getCarList` → Retrieve the vehicle list.
  - `GET /rentCar?id=<VehicleID>` → Rent a vehicle.
  - `GET /returnCar?id=<VehicleID>` → Return a vehicle.
  - `GET /getRecord` → Retrieve rental history.

### Frontend (Client - iOS App)
- Developed using **Swift + UIKit**.
- Uses `URLSession` to **fetch data from the backend**.
- Implements `JSONDecoder` to **parse API responses**.
- UI designed with **Auto Layout** for adaptability.

## License
This project is for academic purposes and intended for learning and demonstration only.
