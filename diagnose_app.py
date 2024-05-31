import mysql.connector
from mysql.connector import Error
import ttkbootstrap as ttk
from ttkbootstrap.constants import *
from tkinter import messagebox

# Kết nối đến cơ sở dữ liệu MySQL
def create_connection():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='dss',
            user='root',
            password=''
        )
        if connection.is_connected():
            print("Kết nối thành công!")
            return connection
    except Error as e:
        print("Lỗi khi kết nối đến MySQL", e)
    return None

# Đóng kết nối
def close_connection(connection):
    if connection.is_connected():
        connection.close()

# Lớp chính cho ứng dụng
class HealthAdvisorApp(ttk.Window):
    def __init__(self, connection):
        super().__init__(themename="lumen")
        self.title("Chương trình tư vấn chăm sóc sức khỏe")
        self.geometry("600x400")
        
        self.connection = connection
        self.symptoms = self.get_symptoms()
        
        self.create_widgets()

    def get_symptoms(self):
        symptoms = []
        cursor = self.connection.cursor()
        cursor.execute("SELECT Ten_trieu_chung FROM Symptoms")
        rows = cursor.fetchall()
        for row in rows:
            symptoms.append(row[0])
        return symptoms

    def create_widgets(self):
        self.lbl1 = ttk.Label(self, text="Chọn triệu chứng 1:")
        self.lbl1.grid(row=0, column=0, padx=10, pady=10)
        self.combo1 = ttk.Combobox(self, values=self.symptoms)
        self.combo1.grid(row=0, column=1, padx=10, pady=10)
        self.combo1.bind("<<ComboboxSelected>>", self.update_combos)

        self.lbl2 = ttk.Label(self, text="Chọn triệu chứng 2:")
        self.lbl2.grid(row=1, column=0, padx=10, pady=10)
        self.combo2 = ttk.Combobox(self, values=self.symptoms)
        self.combo2.grid(row=1, column=1, padx=10, pady=10)
        self.combo2.bind("<<ComboboxSelected>>", self.update_combos)

        self.lbl3 = ttk.Label(self, text="Chọn triệu chứng 3:")
        self.lbl3.grid(row=2, column=0, padx=10, pady=10)
        self.combo3 = ttk.Combobox(self, values=self.symptoms)
        self.combo3.grid(row=2, column=1, padx=10, pady=10)
        self.combo3.bind("<<ComboboxSelected>>", self.update_combos)

        self.btn_consult = ttk.Button(self, text="Tư vấn bệnh", command=self.consult_disease)
        self.btn_consult.grid(row=3, column=0, columnspan=2, padx=10, pady=10)

        self.btn_view_diseases = ttk.Button(self, text="Danh sách bệnh", command=self.view_diseases)
        self.btn_view_diseases.grid(row=4, column=0, columnspan=2, padx=10, pady=10)

    def update_combos(self, event):
        selected_symptoms = [self.combo1.get(), self.combo2.get(), self.combo3.get()]
        for combo in [self.combo1, self.combo2, self.combo3]:
            current_value = combo.get()
            combo['values'] = [s for s in self.symptoms if s not in selected_symptoms or s == current_value]

    def consult_disease(self):
        symptom1 = self.combo1.get()
        symptom2 = self.combo2.get()
        symptom3 = self.combo3.get()

        if not symptom1 or not symptom2 or not symptom3:
            messagebox.showerror("Lỗi", "Hãy chọn đủ 3 triệu chứng!")
            return

        query = """
        SELECT d.Ten_benh, COUNT(ds.Trieu_chung_ID) AS match_count
        FROM Diseases d
        JOIN Disease_Symptoms ds ON d.Benh_ID = ds.Benh_ID
        JOIN Symptoms s ON ds.Trieu_chung_ID = s.Trieu_chung_ID
        WHERE s.Ten_trieu_chung IN (%s, %s, %s)
        GROUP BY d.Ten_benh
        ORDER BY match_count DESC
        LIMIT 1
        """

        cursor = self.connection.cursor()
        cursor.execute(query, (symptom1, symptom2, symptom3))
        result = cursor.fetchone()

        if result:
            disease = result[0]
            messagebox.showinfo("Kết quả tư vấn", f"Bạn có thể mắc bệnh: {disease}")
        else:
            messagebox.showinfo("Kết quả tư vấn", "Không tìm thấy bệnh nào phù hợp với các triệu chứng đã chọn.")

    def view_diseases(self):
        query = "SELECT Ten_benh, Nguyen_nhan, Thuoc FROM Diseases"
        cursor = self.connection.cursor()
        cursor.execute(query)
        rows = cursor.fetchall()

        new_window = ttk.Toplevel(self)
        new_window.title("Danh sách bệnh")
        new_window.geometry("600x400")

        tree = ttk.Treeview(new_window, columns=("Ten_benh", "Nguyen_nhan", "Thuoc"), show='headings')
        tree.heading("Ten_benh", text="Tên bệnh")
        tree.heading("Nguyen_nhan", text="Nguyên nhân")
        tree.heading("Thuoc", text="Thuốc chữa")

        for row in rows:
            tree.insert("", "end", values=row)

        tree.pack(expand=True, fill='both')

if __name__ == "__main__":
    connection = create_connection()
    if connection:
        app = HealthAdvisorApp(connection)
        app.mainloop()
        close_connection(connection)
