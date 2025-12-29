import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector

# ================= DATABASE CONNECTION =================
def connect_db():
    try:
        return mysql.connector.connect(
            host="localhost",
            user="root",
            password="your_password_here",
            database="hospital_db"
        )
    except mysql.connector.Error as err:
        messagebox.showerror("Database Error", str(err))
        return None

db = connect_db()
cursor = db.cursor()

# ================= TABLE DISPLAY =================
def display_data(table_name):
    try:
        cursor.execute(f"SELECT * FROM {table_name}")
        rows = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]

        tree.delete(*tree.get_children())
        tree["columns"] = columns

        for col in columns:
            tree.heading(col, text=col)
            tree.column(col, width=120)

        for row in rows:
            tree.insert("", tk.END, values=row)

    except mysql.connector.Error as err:
        messagebox.showerror("Error", str(err))

# ================= INSERT DOCTOR =================
def insert_doctor():
    data = (
        first_name.get(),
        last_name.get(),
        zip_code.get(),
        street.get(),
        city.get(),
        salary.get(),
        gender.get()
    )

    if not all(data):
        messagebox.showwarning("Input Error", "All fields are required")
        return

    try:
        query = """
        INSERT INTO Doctor (first_name, last_name, zip_code, street, city, salary, gender)
        VALUES (%s,%s,%s,%s,%s,%s,%s)
        """
        cursor.execute(query, data)
        db.commit()
        messagebox.showinfo("Success", "Doctor added successfully")
        display_data("Doctor")

    except mysql.connector.Error as err:
        messagebox.showerror("Error", str(err))

# ================= UI SETUP =================
root = tk.Tk()
root.title("Hospital Database System")
root.geometry("900x600")

# ================= BUTTON FRAME =================
btn_frame = tk.Frame(root)
btn_frame.pack(pady=10)

tables = [
    "Doctor", "Patient", "Nurse",
    "Receptionist", "Clinic",
    "Equipment", "Medicine", "Room"
]

for table in tables:
    tk.Button(
        btn_frame, text=f"Show {table}",
        command=lambda t=table: display_data(t),
        width=14
    ).pack(side=tk.LEFT, padx=5)

# ================= FORM FRAME =================
form = tk.LabelFrame(root, text="Add Doctor", padx=10, pady=10)
form.pack(pady=10)

labels = ["First Name", "Last Name", "Zip Code", "Street", "City", "Salary", "Gender"]
entries = []

for label in labels:
    tk.Label(form, text=label).pack()
    entry = tk.Entry(form)
    entry.pack()
    entries.append(entry)

first_name, last_name, zip_code, street, city, salary, gender = entries

tk.Button(form, text="Insert Doctor", command=insert_doctor).pack(pady=10)

# ================= TABLE VIEW =================
tree = ttk.Treeview(root, show="headings")
tree.pack(expand=True, fill=tk.BOTH)

root.mainloop()
