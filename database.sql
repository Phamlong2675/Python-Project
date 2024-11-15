-- Dictation topics table
CREATE TABLE IF NOT EXISTS dictation_topic (
    topic_id INTEGER PRIMARY KEY AUTOINCREMENT,
    topic_name TEXT NOT NULL,
);

-- Dictation questions table with user_id
CREATE TABLE IF NOT EXISTS dictation_question (
    question_id INTEGER PRIMARY KEY AUTOINCREMENT,
    topic_id INTEGER,
    question_name TEXT NOT NULL,
    correct_answer TEXT NOT NULL,
    audio_file_path TEXT,
    FOREIGN KEY (topic_id) REFERENCES dictation_topic(topic_id),
);

-- User progress tracking for dictation
CREATE TABLE IF NOT EXISTS user_question_progress (
    user_id INTEGER,
    topic_id INTEGER,
    question_id INTEGER,
    status TEXT DEFAULT 'not_done',
    attempt_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, topic_id, question_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (topic_id) REFERENCES dictation_topic(topic_id),
    FOREIGN KEY (question_id) REFERENCES dictation_question(question_id)
);



INSERT INTO dictation_topic (topic_name)
VALUES 
    ('Topic 1 - Easy'),
    ('Topic 2 - Easy'),
    ('Topic 3 - Easy'),
    ('Topic 4 - Easy'),
    ('Topic 5 - Easy'),
    ('Topic 1 - Hard'),
    ('Topic 2 - Hard'),
    ('Topic 3 - Hard'),
    ('Topic 4 - Hard'),
    ('Topic 5 - Hard');


INSERT INTO dictation_question (topic_id, question_name, correct_answer, audio_file_path)
VALUES
    -- Nhập dữ liệu cho Topic 1 - Easy
    (1, 'Q1', 'I go to the movies almost every week', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Easy/I%20go%20to%20the%20movies%20almost%20every%20week.mp3'),
    (1, 'Q2', 'Sometimes, I rent movies from the video store', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Easy/Sometimes%2C%20I%20rent%20movies%20from%20the%20video%20store.mp3'),
    (1, 'Q3', 'My favorite films are action films', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Easy/My%20favorite%20films%20are%20action%20films.mp3'),
    (1, 'Q4', 'I like to watch car chases', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Easy/I%20like%20to%20watch%20car%20chases.mp3'),
    (1, 'Q5', 'I like it when the bad guy has a shootout with the good guys', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Easy/I%20like%20it%20when%20the%20bad%20guy%20has%20a%20shootout%20with%20the%20good%20guys.mp3'),
    (1, 'Q6', 'I like the good guys to win', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Easy/I%20like%20the%20good%20guys%20to%20win.mp3'),
    (1, 'Q7', 'I also like science fiction movies', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Easy/I%20also%20like%20science%20fiction%20movies.mp3'),
    (1, 'Q8', 'I like things that take place in the future', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Easy/I%20like%20things%20that%20take%20place%20in%20the%20future.mp3'),
    (1, 'Q9', 'I like movies that have aliens from different planets in them', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Easy/I%20like%20movies%20that%20have%20aliens%20from%20different%20planets%20in%20them.mp3'),
    (1, 'Q10', 'Some of the science fiction movies can be silly and unbelievable', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Easy/Some%20of%20the%20science%20fiction%20movies%20can%20be%20silly%20and%20unbelievable.mp3');

    -- Nhập dữ liệu cho Topic 2 - Easy
