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
    # hàm khởi tạo
    def __init__(self, connection):
        super().__init__(themename="lumen")
        self.title("Hệ thống tư vấn chăm sóc sức khỏe")
        self.geometry("600x400")
        
        self.connection = connection
        self.symptoms = self.get_symptoms()
        self.symptom_widgets = []
        self.combo_count = 0
        self.deleted_indices = set()  # Giữ các chỉ số của triệu chứng đã xóa

        self.create_widgets()
        
    # lấy danh sách triệu chứng
    def get_symptoms(self):
        symptoms = []
        cursor = self.connection.cursor()
        cursor.execute("SELECT Ten_trieu_chung FROM Symptoms")
        rows = cursor.fetchall()
        for row in rows:
            symptoms.append(row[0])
        return symptoms

    # tạo giao diện ban đầu
    def create_widgets(self):
        # Tạo một frame để chứa các nút
        self.button_frame = ttk.Frame(self)
        self.button_frame.grid(row=0, column=0, columnspan=3, padx=10, pady=10, sticky="ew")

        self.columnconfigure(0, weight=1)
        self.columnconfigure(1, weight=1)
        self.columnconfigure(2, weight=1)

        self.button_frame.columnconfigure(0, weight=1)
        self.button_frame.columnconfigure(1, weight=1)
        self.button_frame.columnconfigure(2, weight=1)
    
        self.btn_add_symptom = ttk.Button(self.button_frame, text="Thêm triệu chứng", command=self.add_symptom)
        self.btn_add_symptom.grid(row=0, column=0, padx=5, pady=10)

        self.btn_consult = ttk.Button(self.button_frame, text="Chẩn đoán", command=self.consult_disease)
        self.btn_consult.grid(row=0, column=1, padx=5, pady=10)

        self.btn_view_diseases = ttk.Button(self.button_frame, text="Danh sách bệnh", command=self.view_diseases)
        self.btn_view_diseases.grid(row=0, column=2, padx=5, pady=10)

        self.add_symptom()  # Thêm triệu chứng đầu tiên

    # cập nhật danh sách triệu chứng bệnh
    def update_combos(self, event):
        selected_symptoms = [widget['combo'].get() for widget in self.symptom_widgets]
        for widget in self.symptom_widgets:
            combo = widget['combo']
            current_value = combo.get()
            combo['values'] = [s for s in self.symptoms if s not in selected_symptoms or s == current_value]

    # thêm triệu chứng
    def add_symptom(self):
        if self.deleted_indices:
            index = min(self.deleted_indices)
            self.deleted_indices.remove(index)
        else:
            self.combo_count += 1
            index = self.combo_count
        row = index + 2

        lbl = ttk.Label(self, text=f"Chọn triệu chứng {index}:")
        lbl.grid(row=row, column=0, padx=10, pady=10)

        combo = ttk.Combobox(self, values=self.symptoms)
        combo.grid(row=row, column=1, padx=10, pady=10)
        combo.bind("<<ComboboxSelected>>", self.update_combos)

        btn_remove = ttk.Button(self, text="Xóa triệu chứng", command=lambda: self.remove_symptom(index, lbl, combo, btn_remove))
        btn_remove.grid(row=row, column=2, padx=10, pady=10)

        self.symptom_widgets.append({'index': index, 'label': lbl, 'combo': combo, 'button': btn_remove})
    
    # xóa triệu chứng
    def remove_symptom(self, index, lbl, combo, btn_remove):
        lbl.grid_forget()
        combo.grid_forget()
        btn_remove.grid_forget()
        self.symptom_widgets = [widget for widget in self.symptom_widgets if widget['index'] != index]
        self.deleted_indices.add(index)
        self.update_combos(None)   
        
    # chẩn đoán bệnh
    def consult_disease(self):
        selected_symptoms = [widget['combo'].get() for widget in self.symptom_widgets]

        if not all(selected_symptoms):
            messagebox.showerror("Lỗi", "Hãy chọn đủ tất cả triệu chứng!")
            return
        
        # Truy vấn cơ sở dữ liệu để lấy danh sách bệnh và số triệu chứng phù hợp
        # SELECT d.Ten_benh, d.Nguyen_nhan, d.Thuoc_chua, d.Luu_y, COUNT(ds.Trieu_chung_ID) AS match_count
        query = f"""
        SELECT d.Ten_benh, d.Nguyen_nhan, d.Thuoc_chua, d.Luu_y, COUNT(ds.Trieu_chung_ID) AS match_count, 
           (COUNT(ds.Trieu_chung_ID) / (SELECT COUNT(*) FROM Symptoms WHERE Ten_trieu_chung IN ({','.join(['%s'] * len(selected_symptoms))}))) * 100 AS match_percentage
        FROM Diseases d
        JOIN Disease_Symptoms ds ON d.Benh_ID = ds.Benh_ID
        JOIN Symptoms s ON ds.Trieu_chung_ID = s.Trieu_chung_ID
        WHERE s.Ten_trieu_chung IN ({','.join(['%s'] * len(selected_symptoms))})
        GROUP BY d.Ten_benh
        ORDER BY match_count DESC
        LIMIT 1
        """

        cursor = self.connection.cursor()
        # cursor.execute(query, selected_symptoms)
        cursor.execute(query, selected_symptoms * 2)
        # result = cursor.fetchone()
        results = cursor.fetchall()

        if not results:
            messagebox.showinfo("Kết quả tư vấn", "Không tìm thấy bệnh nào phù hợp với các triệu chứng đã chọn.")
            return

        # Tính toán và hiển thị kết quả
        diseases = []
        max_percentage = results[0][5]

        for result in results:
            disease, cause, medicine, note, match_count, match_percentage = result
            diseases.append({
                'name': disease,
                'cause': cause,
                'medicine': medicine,
                'note': note,
                'percentage': match_percentage
            })
            if match_percentage < 100:  # Nếu tỷ lệ không phải là 100% thì không cần tiếp tục vòng lặp
                break

        if len(diseases) == 1 and max_percentage == 100:
            messagebox.showinfo("Kết quả chẩn đoán", f"Bạn có thể mắc bệnh:\n{diseases[0]['name']} \n\nNguyên nhân:\n{diseases[0]['cause']} \n\nThuốc:\n{diseases[0]['medicine']} \n\nLưu ý:\n{diseases[0]['note']}")
        else:
            disease_info = ""
            for disease in diseases:
                disease_info += f"Bệnh: {disease['name']} ({disease['percentage']:.2f}%)\nNguyên nhân: {disease['cause']}\nThuốc: {disease['medicine']}\nLưu ý: {disease['note']}\n\n"
            messagebox.showinfo("Kết quả chẩn đoán", f"Các bệnh có thể mắc phải:\n{disease_info}")

        # if result:
        #     disease = result[0]
        #     cause = result[1]
        #     medicine = result[2]
        #     note = result[3]
        #     messagebox.showinfo("Kết quả chẩn đoán", f"Bạn có thể mắc bệnh:\n{disease} \n\nNguyên nhân:\n{cause} \n\nThuốc:\n{medicine} \n\nLưu ý:\n{note}")
        # else:
        #     messagebox.showinfo("Kết quả chẩn đoán", "Không tìm thấy bệnh nào phù hợp với các triệu chứng đã chọn.")

    # danh sách bệnh
    def view_diseases(self):
        query = "SELECT Benh_ID, Ten_benh FROM Diseases"
        cursor = self.connection.cursor()
        cursor.execute(query)
        rows = cursor.fetchall()

        new_window = ttk.Toplevel(self)
        new_window.title("Danh sách bệnh")
        new_window.geometry("1000x400")

        tree = ttk.Treeview(new_window, columns=("Benh_ID", "Ten_benh"), show='headings', bootstyle=INFO)
        tree.heading("Benh_ID", text="ID")
        tree.heading("Ten_benh", text="Tên bệnh")

        # Thêm đường viền cho các cột
        tree.column("#0", width=0, stretch=NO)  # Ẩn cột 0
        for col, col_name in zip(("Benh_ID", "Ten_benh",), ("ID", "Tên bệnh")):
            tree.column(col, width=200, minwidth=50, anchor="center")
            tree.heading(col, text=col_name, anchor="center")

        # Thêm màu sắc cho hàng
        for index, row in enumerate(rows):
            if index % 2 == 0:  # Các hàng chẵn được tô màu trắng
                tree.insert("", "end", values=row, tags=("even",))
            else:  # Các hàng lẻ được tô màu xám
                tree.insert("", "end", values=row, tags=("odd",))

        # Thêm cấu hình màu sắc
        tree.tag_configure("even", background="#fff")
        tree.tag_configure("odd", background="#f5f5f5")

        # Ràng buộc sự kiện click vào Treeview
        tree.bind("<ButtonRelease-1>", lambda event: self.on_tree_select(event, tree))

        tree.pack(padx=10, pady=10, expand=True, fill='both')
        
    # nhấn vào tên bệnh để hiển thị thông tin liên quan đến bệnh đó
    def on_tree_select(self, event, tree):
        selected_item = tree.selection()[0]
        item_values = tree.item(selected_item, "values")
        disease_id = item_values[0]  # Lấy ID của bệnh được chọn

        # Truy vấn cơ sở dữ liệu để lấy thông tin chi tiết của bệnh
        query = """
        SELECT Ten_benh, Nguyen_nhan, Thuoc_chua, Luu_y 
        FROM Diseases
        WHERE Benh_ID = %s
        """
        cursor = self.connection.cursor()
        cursor.execute(query, (disease_id,))
        result = cursor.fetchone()

        if result:
            disease, cause, medicine, note = result
            messagebox.showinfo("Thông tin bệnh", f"Tên bệnh: {disease}\nNguyên nhân: {cause}\nThuốc: {medicine}\nLưu ý: {note}")
        else:
            messagebox.showinfo("Lỗi", "Không tìm thấy thông tin bệnh.")

if __name__ == "__main__":
    connection = create_connection()
    if connection:
        app = HealthAdvisorApp(connection)
        app.mainloop()
        close_connection(connection)
