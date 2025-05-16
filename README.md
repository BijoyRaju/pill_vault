Pill Vault
Pill Vault is a Flutter-based mobile application designed to help users manage and store their medicines locally. The app provides a clean UI and essential features like medicine tracking, search, analytics, and user profile management — all stored securely using local storage (Hive) and login state persistence via SharedPreferences.

🧩 Features Overview
User Authentication
- Sign up using Full Name, Email, Phone Number, and Password
- Login with registered email and password
- Login state is saved using SharedPreferences

Medicine Management
- Add, view, edit, and delete medicines
- Store data like name, chemical name, dosage, price, description, and image
- Mark medicines as favorites

Data Storage
- Uses Hive for local database storage
- Separate Hive boxes for user data and medicine records

🗂️ App Modules

1. Home Page
- Features a SliverAppBar with a scrollable background image
- Displays:
    Recently added medicines
    Favorite medicines
- Navigation to full medicine details on tap on specific medicine

2. List View Page
- Shows all saved medicines in a scrollable list
- Each card includes:
    Medicine image
    Name
    Chemical name
    Short description
- Includes a search feature:
    Search by medicine name
    Search by chemical name
- On card tap:
    Shows full details
    Options to edit or delete the medicine

3. Add Page
- Form to input new medicine details:
    Medicine Name
    Chemical Name
    Dosage
    Price
    Description
    Medicine Photo
    On submission:
    Saves data to Hive
    Redirects to Home Page

4. Dashboard Page
- Displays analytics with a Bar Chart
    X-axis: Medicine Names
    Y-axis: Prices
- Shows:
    Total number of medicines added
- Visual breakdown of medicine pricing

5. Profile Page
- Displays logged-in user details:
    Dummy avatar
    Full Name
    Email
    Phone Number
- Actions:
    Edit Profile: Opens a dialog box to update user info
    Logout: Clears login state and navigates to login screen

🗃️ Local Storage Details

🔐 User Info
Stored in Hive box (users)
- Includes:
    Full name
    Email
    Phone number
    Password

💊 Medicine Data
Stored in Hive box (medicines)
- Each medicine has:
    Name
    Chemical Name
    Dosage
    Price
    Description
    Image (stored using Uint8List)

🧠 Login State
- Stored in SharedPreferences
- Saves loggedInUserKey to persist sessions

📦 Dependencies Used
- Hive: Local NoSQL database
- Hive Flutter Adapter: Required for Flutter apps using Hive
- Shared Preferences: Persistent local key-value storage
- Flutter Material: For building UI components
- Charts Package 

