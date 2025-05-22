# Flutter Auction App 🛒📱

A real-time **Bidding Auction App** built with **Flutter** and **Supabase**, featuring role-based authentication for buyers and sellers, live bidding functionality, and a clean, responsive UI.

![App Preview](https://github.com/user-attachments/assets/6c19fc29-329f-464c-a7ef-145d50ce0c79)

---

## 🔥 Features

### 🔐 Authentication (Supabase)
- Email/password login
- Role-based access: Buyer & Seller
- Secure session management

### 🛒 Buyer Functionality
- Browse active auction items
- Place live bids
- Track current highest bids
- View personal bid history

### 🏷️ Seller Functionality
- Add new auction items (title, image, description, base price)
- Set start/end time for bidding
- Monitor bids in real-time
- Edit or delete products

### ⚙️ Auction Logic
- Real-time bid updates using Supabase Realtime
- Winner auto-selection after auction ends
- Notifications for highest bidder
- Time-based control of auction lifecycle
- 
---

## 🧰 Tech Stack

- **Frontend:** Flutter (Dart)
- **Backend:** Supabase (Auth, Realtime Database)
- **Database:** Supabase PostgreSQL
- **Storage:** Supabase Storage
