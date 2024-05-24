import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.preprocessing import LabelEncoder
import pickle

# Đọc dữ liệu
data = pd.read_csv('triệu_chứng_bệnh.csv')

# Chuyển đổi các giá trị chuỗi thành số
label_encoders = {}
for column in data.columns:
    if data[column].dtype == object:
        le = LabelEncoder()
        data[column] = le.fit_transform(data[column])
        label_encoders[column] = le

# Xử lý dữ liệu
X = data.drop('bệnh', axis=1)
y = data['bệnh']

# Chia dữ liệu thành tập huấn luyện và kiểm tra
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Huấn luyện mô hình
model = DecisionTreeClassifier()
model.fit(X_train, y_train)

# Lưu trữ mô hình và Label Encoders
with open('model.pkl', 'wb') as file:
    pickle.dump((model, label_encoders), file)

print("Mô hình đã được huấn luyện và lưu trữ thành công.")
