# 📞 Telecom Customer Churn & Retention Analysis

![Dashboard Preview](dashboard_preview.png)

## 📌 Executive Summary
Dataset này chứa thông tin của **3,333 khách hàng viễn thông** nhằm phân tích các yếu tố ảnh hưởng đến quyết định rời bỏ dịch vụ (**Customer Churn**). Tỷ lệ Churn tổng thể hiện tại là **14.49%**, gây thất thoát **$28.59K/tháng** doanh thu recurring.

Dự án này sử dụng kết hợp **SQL Server (T-SQL)** để làm sạch, biến đổi dữ liệu & trích xuất metrics, cùng với **Power BI** để trực quan hóa báo cáo quản trị tương tác.

---

## 🛠️ Tech Stack & Methods
* **Database Management:** SQL Server (SSMS) - Data Transformation, Feature Engineering, Views.
* **Business Intelligence:** Power BI - DAX Measures, Interactive Dashboard Design.
* **Data Analytics Methods:** Risk Segmentation, Behavioral Analytics, Churn Prediction Triggers.

---

## 📊 Key Insights (Trả lời câu hỏi Kinh doanh)

### 1. What variables contribute most to Churn?
* 📞 **Customer Service Calls:** Đây là yếu tố tác động lớn nhất. Khách hàng gọi tổng đài **từ 4 lần trở lên** có tỷ lệ Churn vọt từ `~10%` lên **`45% - 60%`**. Điều này chỉ ra rằng các vấn đề không được giải quyết dứt điểm ở những lần gọi đầu tiên khiến khách hàng bức xúc và rời bỏ.
* 📜 **Contract Renewal:** Khách hàng **không gia hạn hợp đồng** có tỷ lệ Churn lên tới **`42.41%`**, cao gấp 4 lần nhóm có gia hạn (`11.5%`).
* 📶 **Data Plan Usage:** Khách hàng không đăng ký Data Plan có tỷ lệ Churn cao gấp 2 lần nhóm sử dụng Data Plan.

### 2. Customer Risk Profile (Phân nhóm Rủi ro)
* 🔴 **High Risk Profile:** Khách hàng gọi CSKH $\ge 4$ lần **HOẶC** không gia hạn hợp đồng (`ContractRenewal = 0`).
* 🟡 **Medium Risk Profile:** Khách hàng gọi CSKH $2 - 3$ lần và chưa đăng ký Data Plan.
* 🟢 **Low Risk Profile:** Khách hàng gia hạn hợp đồng, gọi CSKH $\le 1$ lần và có Data Plan.

---

## 💡 Business Recommendations (Đề xuất Chiến lược)

1. 🚨 **Hệ thống Cảnh báo Sớm (CSKH Alert System):** 
   * Cài đặt Trigger trên CRM: Khi khách hàng thực hiện **cuộc gọi CSKH thứ 3**, tự động gán cờ ưu đãi/chăm sóc đặc biệt cho Chuyên viên cao cấp xử lý dứt điểm, **tuyệt đối không để phát sinh cuộc gọi thứ 4**.
2. 🎁 **Chiến dịch Giữ chân Chủ động (Proactive Retention):**
   * Lọc danh sách nhóm High Risk và Not Renewed trực tiếp trên Dashboard để đội Tele-sales liên hệ trước 30 ngày hết hạn hợp đồng kèm chính sách giảm cước $10-15\%$.
3. 📲 **Gói Cước Tích Hợp (Data Bundling):**
   * Thiết kế gói cước dùng thử Data giá rẻ cho nhóm khách hàng chưa đăng ký Data Plan nhưng có cước phí hàng tháng (MonthlyCharge) cao để gia tăng độ gắn kết (Stickiness).
