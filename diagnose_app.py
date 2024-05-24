import tkinter as tk
from tkinter import messagebox
import pandas as pd
import pickle

# Load mô hình và Label Encoders
with open('model.pkl', 'rb') as file:
    model, label_encoders = pickle.load(file)

# Đọc dữ liệu thuốc
thuoc_data = pd.read_csv('thuốc_liều_lượng.csv')

def chuan_doan():
    trieu_chung_1 = entry_trieu_chung_1.get()
    trieu_chung_2 = entry_trieu_chung_2.get()
    trieu_chung_3 = entry_trieu_chung_3.get()
    
    input_data = pd.DataFrame([[trieu_chung_1, trieu_chung_2, trieu_chung_3]], columns=['triệu_chứng_1', 'triệu_chứng_2', 'triệu_chứng_3'])
    
    for column in input_data.columns:
        input_data[column] = label_encoders[column].transform(input_data[column])
    
    benh = model.predict(input_data)[0]
    
    thuoc_info = thuoc_data[thuoc_data['bệnh'] == label_encoders['bệnh'].inverse_transform([benh])[0]].iloc[0]
    messagebox.showinfo("Kết quả chẩn đoán", f"Bệnh: {label_encoders['bệnh'].inverse_transform([benh])[0]}\nThuốc: {thuoc_info['thuốc']}\nLiều lượng: {thuoc_info['liều_lượng']}\nChú ý: {thuoc_info['chú_ý']}")

# Tạo giao diện
root = tk.Tk()
root.title("Chẩn đoán bệnh")

tk.Label(root, text="Triệu chứng 1").grid(row=0)
tk.Label(root, text="Triệu chứng 2").grid(row=1)
tk.Label(root, text="Triệu chứng 3").grid(row=2)

entry_trieu_chung_1 = tk.Entry(root)
entry_trieu_chung_2 = tk.Entry(root)
entry_trieu_chung_3 = tk.Entry(root)

entry_trieu_chung_1.grid(row=0, column=1)
entry_trieu_chung_2.grid(row=1, column=1)
entry_trieu_chung_3.grid(row=2, column=1)

tk.Button(root, text="Chẩn đoán", command=chuan_doan).grid(row=3, column=0, columnspan=2)

root.mainloop()
