from nicegui import ui
import pandas as pd
import string
import sqlite3

class Dictation:
    def __init__(self):
        self.index = 1
        self.user_answer = ""
        self.audio_player = None
        self.data = pd.DataFrame()  # Khởi tạo DataFrame rỗng
        self.selected_difficulty = None
        self.selected_topic = None
        self.notification_label = ui.label('').style('margin-top: 20px; font-size: 20px; color: black;')  # Khởi tạo label thông báo

    def update_audio_file(self):
        question_name = f"(Q{self.index})"
        audio_file = get_audio_file_path('user_name', self.selected_topic, question_name)

        if self.audio_player:
            self.audio_player.delete()  # Xóa đối tượng âm thanh cũ

        # Tạo đối tượng âm thanh mới và hiển thị thanh điều khiển
        self.audio_player = ui.audio(audio_file).props('controls').style('width: 300px;')  
        self.audio_player.play()  # Phát âm thanh

    def normalize(self, text):
        return str(text).lower().translate(str.maketrans('', '', string.punctuation.replace("'", "")))

    def check_answer(self):
        user_words = self.normalize(self.user_answer).strip().split()
        question_name = f"(Q{self.index})"
        correct_answer = get_correct_answer('user_name', self.selected_topic, question_name)
        correct_words = self.normalize(correct_answer).strip().split()
        return user_words == correct_words

    def check_answer_click(self):
        question_name = f"(Q{self.index})"
        if self.user_answer:
            result = self.check_answer()
            if result:
                self.notification_label.text = 'Câu trả lời đúng!'
                self.notification_label.style('color: green;')
                update_progress_status('user_name', self.selected_topic, question_name, 'correct')
            else:
                self.notification_label.text = 'Câu trả lời sai!'
                self.notification_label.style('color: red;')
                update_progress_status('user_name', self.selected_topic, question_name, 'incorrect')
        else:
            self.notification_label.text = 'Vui lòng nhập câu trả lời trước khi kiểm tra.'
            self.notification_label.style('color: orange;')

    def show_answer(self):
        question_name = f"(Q{self.index})"
        correct_answer = get_correct_answer('user_name', self.selected_topic, question_name)
        self.notification_label.text = f"Câu trả lời đúng là: '{correct_answer}'"
        self.notification_label.style('color: blue;')

    def skip(self):
        self.index = (self.index % 10) + 1  # Tăng chỉ số và quay lại đầu nếu vượt quá
        self.user_answer = ""
        self.input.value = ""  # Xóa ô nhập câu trả lời
        self.notification_label.text = ""  # Xóa nội dung thông báo
        self.update_audio_file()  # Cập nhật âm thanh cho câu tiếp theo
        self.no_sens.delete()
        self.no_sens = ui.label(f'({self.index}/10)').style('font-size: 18px;')

    def turnback(self):
        if self.index > 1:
            self.index -= 1
        else:
            self.index = 10
        self.user_answer = ""
        self.input.value = ""  # Xóa ô nhập câu trả lời
        self.notification_label.text = ""  # Xóa nội dung thông báo
        self.update_audio_file()  # Cập nhật âm thanh cho câu tiếp theo
        self.no_sens.delete()
        self.no_sens = ui.label(f'({self.index}/10)').style('font-size: 18px;')

    def go_to_topic_selection(self, difficulty):
        self.selected_difficulty = difficulty
        ui.notify(f'Bạn đã chọn độ khó: {self.selected_difficulty}')
        redirect('/topic')  # Hiển thị trang chọn chủ đề

    def set_topic(self, topic):
        self.selected_topic = topic
        self.index = 1
        ui.notify(f'Bạn đã chọn chủ đề: {self.selected_topic}')
        redirect('/dictation')  # Hiển thị trang dictation

    def input_value(self):
        self.input = ui.input('Nhập câu trả lời của bạn:', on_change=lambda: setattr(self, 'user_answer', self.input.value)).style('margin-bottom: 10px; font-size: 24px; width: 500px; padding: 10px;')



def get_correct_answer(user_name, topic_name, question_name):
    # Kết nối tới database
    conn = sqlite3.connect('your_database.db')
    cursor = conn.cursor()

    # Lấy user_id từ username
    cursor.execute("SELECT user_id FROM user WHERE username = ?", (user_name,))
    user_id = cursor.fetchone()
    if not user_id:
        conn.close()
        return "User not found"
    user_id = user_id[0]

    # Lấy topic_id từ topic_name
    cursor.execute("SELECT topic_id FROM dictation_topic WHERE topic_name = ?", (topic_name,))
    topic_id = cursor.fetchone()
    if not topic_id:
        conn.close()
        return "Topic not found"
    topic_id = topic_id[0]

    # Lấy question_id từ question_name và topic_id
    cursor.execute("SELECT question_id FROM dictation_question WHERE question_name = ? AND topic_id = ?", (question_name, topic_id))
    question_id = cursor.fetchone()
    if not question_id:
        conn.close()
        return "Question not found"
    question_id = question_id[0]

    # Lấy correct_answer từ dictation_question
    cursor.execute("SELECT correct_answer FROM dictation_question WHERE question_id = ?", (question_id,))
    correct_answer = cursor.fetchone()

    conn.close()

    if correct_answer:
        return correct_answer[0]
    return "Correct answer not found"

def get_audio_file_path(user_name, topic_name, question_name):
    # Kết nối tới database
    conn = sqlite3.connect('your_database.db')
    cursor = conn.cursor()

    # Lấy user_id từ username
    cursor.execute("SELECT user_id FROM user WHERE username = ?", (user_name,))
    user_id = cursor.fetchone()
    if not user_id:
        conn.close()
        return "User not found"
    user_id = user_id[0]

    # Lấy topic_id từ topic_name
    cursor.execute("SELECT topic_id FROM dictation_topic WHERE topic_name = ?", (topic_name,))
    topic_id = cursor.fetchone()
    if not topic_id:
        conn.close()
        return "Topic not found"
    topic_id = topic_id[0]

    # Lấy question_id từ question_name và topic_id
    cursor.execute("SELECT question_id FROM dictation_question WHERE question_name = ? AND topic_id = ?", (question_name, topic_id))
    question_id = cursor.fetchone()
    if not question_id:
        conn.close()
        return "Question not found"
    question_id = question_id[0]

    # Lấy audio_file_path từ dictation_question
    cursor.execute("SELECT audio_file_path FROM dictation_question WHERE question_id = ?", (question_id,))
    audio_file_path = cursor.fetchone()

    conn.close()

    if audio_file_path:
        return audio_file_path[0]
    return "Audio file path not found"

def update_progress_status(user_name, topic_name, question_name, new_status):
    # Kết nối đến cơ sở dữ liệu SQLite
    conn = sqlite3.connect('path_to_your_database.db')
    cursor = conn.cursor()

    # Lấy user_id từ user_name
    cursor.execute('''
        SELECT user_id FROM user WHERE user_name = ?
    ''', (user_name,))
    user_data = cursor.fetchone()

    # Kiểm tra xem có tìm thấy user_id không
    if user_data is None:
        print(f"User '{user_name}' không tồn tại.")
        conn.close()
        return

    user_id = user_data[0]

    # Lấy topic_id từ topic_name
    cursor.execute('''
        SELECT topic_id FROM dictation_topic WHERE topic_name = ?
    ''', (topic_name,))
    topic_data = cursor.fetchone()

    # Kiểm tra xem có tìm thấy topic_id không
    if topic_data is None:
        print(f"Topic '{topic_name}' không tồn tại.")
        conn.close()
        return

    topic_id = topic_data[0]

    # Lấy question_id từ question_name và topic_id
    cursor.execute('''
        SELECT question_id FROM dictation_question WHERE question_name = ? AND topic_id = ?
    ''', (question_name, topic_id))
    question_data = cursor.fetchone()

    # Kiểm tra xem có tìm thấy question_id không
    if question_data is None:
        print(f"Câu hỏi '{question_name}' không tồn tại trong topic '{topic_name}'.")
        conn.close()
        return

    question_id = question_data[0]

    # Cập nhật trạng thái và thời gian cho câu hỏi trong bảng progress
    cursor.execute('''
        UPDATE user_question_progress
        SET status = ?, attempt_date = CURRENT_TIMESTAMP
        WHERE user_id = ? AND topic_id = ? AND question_id = ?
    ''', (new_status, user_id, topic_id, question_id))

    # Lưu thay đổi và đóng kết nối
    conn.commit()
    conn.close()

    print(f"Đã cập nhật trạng thái câu hỏi '{question_name}' của người dùng '{user_name}'.")

def redirect(url: str):
    # Chuyển hướng trang
    ui.run_javascript(f'window.location.href = "{url}"')

@ui.page('/')
def difficulty_page():
    ui.label('Chọn Độ Khó:').style('justify-content: center; margin-bottom: 20px; font-size: 24px;')
    with ui.row().style('justify-content: center; margin: 10px 0;'):
        ui.button('Easy', on_click=lambda: dic.go_to_topic_selection('Easy')).style('margin: 10px; padding: 15px; font-size: 18px;')
        ui.button('Hard', on_click=lambda: dic.go_to_topic_selection('Hard')).style('margin: 10px; padding: 15px; font-size: 18px;')

@ui.page('/topic')
def topic_page():
    ui.label(f'Độ khó đã chọn: {dic.selected_difficulty}').style('margin-bottom: 20px; font-size: 24px;')
    ui.label(f'Chọn chủ đề:').style('margin-bottom: 10px; font-size: 24px;')
            
    # Tạo hàng cho các nút chủ đề
    with ui.row().style('justify-content: center; margin: 10px 0;'):
        if dic.selected_difficulty == 'Easy':
            ui.button('Topic 1', on_click=lambda: dic.set_topic('Topic 1 - Easy')).style('margin: 10px; padding: 15px; font-size: 18px;') 
            ui.button('Topic 2', on_click=lambda: dic.set_topic('Topic 2 - Easy')).style('margin: 10px; padding: 15px; font-size: 18px;')  
            ui.button('Topic 3', on_click=lambda: dic.set_topic('Topic 3 - Easy')).style('margin: 10px; padding: 15px; font-size: 18px;')
            ui.button('Topic 4', on_click=lambda: dic.set_topic('Topic 4 - Easy')).style('margin: 10px; padding: 15px; font-size: 18px;')  
            ui.button('Topic 5', on_click=lambda: dic.set_topic('Topic 5 - Easy')).style('margin: 10px; padding: 15px; font-size: 18px;')
        elif dic.selected_difficulty == 'Hard':
            ui.button('Topic 1', on_click=lambda: dic.set_topic('Topic 1 - Hard')).style('margin: 10px; padding: 15px; font-size: 18px;')  
            ui.button('Topic 2', on_click=lambda: dic.set_topic('Topic 2 - Hard')).style('margin: 10px; padding: 15px; font-size: 18px;')
            ui.button('Topic 3', on_click=lambda: dic.set_topic('Topic 3 - Hard')).style('margin: 10px; padding: 15px; font-size: 18px;')
            ui.button('Topic 4', on_click=lambda: dic.set_topic('Topic 4 - Hard')).style('margin: 10px; padding: 15px; font-size: 18px;')
            ui.button('Topic 5', on_click=lambda: dic.set_topic('Topic 5 - Hard')).style('margin: 10px; padding: 15px; font-size: 18px;')        
    with ui.row().style('width: 100%; padding: 0 20px;'):
            ui.button('Quay lại', 
                     on_click=lambda: redirect('/')
                     ).style('margin: 20px 0; padding: 15px; font-size: 18px;')

@ui.page('/dictation')
def dictation_page():
    ui.label(f'Bắt Đầu Dictation cho: {dic.selected_topic}').style('margin-bottom: 20px; font-size: 24px;')
   
    with ui.row().style('justify-content: center; margin: 10px 0; align-items: center;'):
        ui.button(on_click=lambda: [dic.turnback(), setattr(dic.input, 'value', '')], icon='fast_rewind').style('width: 50px; height: 50px; padding: 0;')
        ui.button(on_click=lambda: [dic.skip(), setattr(dic.input, 'value', '')], icon='fast_forward').style('width: 50px; height: 50px; padding: 0;')
        dic.update_audio_file()  # Cập nhật âm thanh
        dic.no_sens = ui.label(f'({dic.index}/10)').style('font-size: 18px;')

    dic.input_value()

    # Hiển thị label thông báo ở đây
    dic.notification_label = ui.label('').style('margin-top: 20px; font-size: 20px; color: black;')  # Khởi tạo label thông báo

    # Tạo hàng cho các nút
    with ui.row().style('justify-content: center; margin: 10px 0;'):
        ui.button('Kiểm tra đáp án', on_click=dic.check_answer_click).style('margin: 10px; padding: 15px; font-size: 18px;')
        ui.button('Hiển thị đáp án', on_click=dic.show_answer).style('margin: 10px; padding: 15px; font-size: 18px;')

    with ui.row().style('justify-content: center; margin: 10px 0;'):
        ui.button('Chọn độ khó', on_click=lambda:redirect('/')).style('margin: 10px; padding: 15px; font-size: 18px;')
        ui.button('Chọn chủ đề', on_click=lambda:redirect('/topic')).style('margin: 10px; padding: 15px; font-size: 18px;')

dic = Dictation()
ui.run()
