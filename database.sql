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
    (1, 'Q10', 'Some of the science fiction movies can be silly and unbelievable', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Easy/Some%20of%20the%20science%20fiction%20movies%20can%20be%20silly%20and%20unbelievable.mp3')

    -- Nhập dữ liệu cho Topic 2 - Easy
    (2, 'Q1', 'Today is November 26th', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2easy/Today%20is%20November%2026th.mp3'),
    (2, 'Q2', 'It snowed all day today', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2easy/It%20snowed%20all%20day%20today.mp3'),
    (2, 'Q3', 'The snow is beautiful', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2easy/The%20snow%20is%20beautiful.mp3'),
    (2, 'Q4', 'The snow finally stopped', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2easy/The%20snow%20finally%20stopped.mp3'),
    (2, 'Q5', 'My sister and I are excited', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2easy/My%20sister%20and%20I%20are%20excited.mp3'),
    (2, 'Q6', 'My mom doesn''t like the snow', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2easy/My%20mom%20doesn''t%20like%20the%20snow.mp3'),
    (2, 'Q7', 'My mom has to shovel the driveway', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2easy/My%20mom%20has%20to%20shovel%20the%20driveway.mp3'),
    (2, 'Q8', 'My sister and I get to play', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2easy/My%20sister%20and%20I%20get%20to%20play.mp3'),
    (2, 'Q9', 'I put on my hat and mittens', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2easy/I%20put%20on%20my%20hat%20and%20mittens.mp3'),
    (2, 'Q10', 'My mom puts on my scarf', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2easy/My%20mom%20puts%20on%20my%20scarf.mp3'),

    -- Nhập dữ liệu cho Topic 3 - Easy
    (3, 'Q1', 'My daughter is going to college', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3easy/My%20daughter%20is%20going%20to%20college.mp3'),
    (3, 'Q2', 'That''s great, but it must be expensive', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3easy/That%27s%20great%2C%20but%20it%20must%20be%20expensive.mp3'),
    (3, 'Q3', 'Yes, but she has a grant', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3easy/Yes%2C%20but%20she%20has%20a%20grant.mp3'),
    (3, 'Q4', 'A grant? What''s a grant', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3easy/A%20grant%20What%27s%20a%20grant.mp3'),
    (3, 'Q5', 'The government is giving her money', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3easy/The%20government%20is%20giving%20her%20money.mp3'),
    (3, 'Q6', 'To pay for her education', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3easy/To%20pay%20for%20her%20education.mp3'),
    (3, 'Q7', 'Does it pay for everything', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3easy/Does%20it%20pay%20for%20everything.mp3'),
    (3, 'Q8', 'No, she has a loan, too', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3easy/No%2C%20she%20has%20a%20loan%2C%20too.mp3'),
    (3, 'Q9', 'What''s the difference between a loan and a grant', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3easy/What%27s%20the%20difference%20between%20a%20loan%20and%20a%20grant.mp3'),
    (3, 'Q10', 'You have to pay back a loan; a grant is a gift', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3easy/You%20have%20to%20pay%20back%20a%20loan%3B%20a%20grant%20is%20a%20gift.mp3'),

    -- Nhập dữ liệu cho Topic 4 - Easy
    (4, 'Q1', 'You can watch the weatherman on TV', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4easy/You%20can%20watch%20the%20weatherman%20on%20TV.mp3'),
    (4, 'Q2', 'to find out what the weather will be like', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4easy/to%20find%20out%20what%20the%20weather%20will%20be%20like.mp3'),
    (4, 'Q3', 'It might be a nice clear day with no clouds in the sky', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4easy/It%20might%20be%20a%20nice%20clear%20day%20with%20no%20clouds%20in%20the%20sky.mp3'),
    (4, 'Q4', 'The sun might be shining', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4easy/The%20sun%20might%20be%20shining.mp3'),
    (4, 'Q5', 'It could be a cloudy day', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4easy/It%20could%20be%20a%20cloudy%20day.mp3'),
    (4, 'Q6', 'Sometimes cloudy days are just dull', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4easy/Sometimes%20cloudy%20days%20are%20just%20dull.mp3'),
    (4, 'Q7', 'On some cloudy days it begins to rain or snow', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4easy/On%20some%20cloudy%20days%20it%20begins%20to%20rain%20or%20snow.mp3'),
    (4, 'Q8', 'Some days are rainy', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4easy/Some%20days%20are%20rainy.mp3'),
    (4, 'Q9', 'You need a raincoat umbrella and boots on a rainy day', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4easy/You%20need%20a%20raincoat%20umbrella%20and%20boots%20on%20a%20rainy%20day.mp3'),
    (4, 'Q10', 'Rain makes the flowers and grass grow', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4easy/Rain%20makes%20the%20flowers%20and%20grass%20grow.mp3'),

    -- Nhập dữ liệu cho Topic 5 - Easy
    (5, 'Q1', 'I wake up every morning at seven o''clock', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5easy/I%20wake%20up%20every%20morning%20at%20seven%20o''clock.mp3'),
    (5, 'Q2', 'I take a shower', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5easy/I%20take%20a%20shower.mp3'),
    (5, 'Q3', 'I eat my breakfast', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5easy/I%20eat%20my%20breakfast.mp3'),
    (5, 'Q4', 'I usually have toast or cereal', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5easy/I%20usually%20have%20toast%20or%20cereal.mp3'),
    (5, 'Q5', 'I brush my teeth', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5easy/I%20brush%20my%20teeth.mp3'),
    (5, 'Q6', 'I put on my clothes', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5easy/I%20put%20on%20my%20clothes.mp3'),
    (5, 'Q7', 'I catch the school bus', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5easy/I%20catch%20the%20school%20bus.mp3'),
    (5, 'Q8', 'I ride to school', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5easy/I%20ride%20to%20school.mp3'),
    (5, 'Q9', 'In my class we have math and English before recess', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5easy/In%20my%20class%20we%20have%20math%20and%20English%20before%20recess.mp3'),
    (5, 'Q10', 'At recess time the girls skip or walk around and talk', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5easy/At%20recess%20time%20the%20girls%20skip%20or%20walk%20around%20and%20talk.mp3'),

    -- Nhập dữ liệu cho Topic 1 - Hard
    (6, 'Q1', 'Well, we have this school excursion planned, but when exactly is it', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Hard/Well%2C%20we%20have%20this%20school%20excursion%20planned%2C%20but%20when%20exactly%20is%20it.mp3'),
    (6, 'Q2', 'Is it this Tuesday or Wednesday', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Hard/Is%20it%20this%20Tuesday%20or%20Wednesday.mp3'),
    (6, 'Q3', 'Well it can''t be Tuesday, with the English tests taking place.', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Hard/Well%20it%20can%E2%80%99t%20be%20Tuesday%2C%20with%20the%20English%20tests%20taking%20place.mp3'),
    (6, 'Q4', 'Ah, right. Not Tuesday, but Wednesday', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Hard/Ah%2C%20right%20not%20Tuesday%2C%20but%20Wednesday.mp3'),
    (6, 'Q5', 'That''s right - all day Wednesday - taking a bus outside the city', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Hard/That%E2%80%99s%20right%20-%20all%20day%20Wednesday%20-%20taking%20a%20bus%20outside%20the%20city.mp3'),
    (6, 'Q6', 'And where are we going', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Hard/And%20where%20are%20we%20going.mp3'),
    (6, 'Q7', 'Ah, last month we went to Arthur Island', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Hard/Ah%2C%20last%20month%20we%20went%20to%20Arthur%20Island.mp3'),
    (6, 'Q8', 'so this time we''re going to the Animal Park', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Hard/so%20this%20time%20we%E2%80%99re%20going%20to%20the%20Animal%20Park.mp3'),
    (6, 'Q9', 'Arthur Island was okay, but it was too cold', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Hard/Arthur%20Island%20was%20okay%2C%20but%20it%20was%20too%20cold.mp3'),
    (6, 'Q10', 'Let''s hope the weather for this week''s excursion is better', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Hard/Let%E2%80%99s%20hope%20the%20weather%20for%20this%20week%E2%80%99s%20excursion%20is%20better.mp3'),

    -- Nhập dữ liệu cho Topic 2 - Hard
    (7, 'Q1', 'Okay Mary, I know I''m putting on weight with all my bad eating habits', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2hard/Okay%20Mary%2C%20I%20know%20I%27m%20putting%20on%20weight%20with%20all%20my%20bad%20eating%20habits.mp3'),
    (7, 'Q2', 'That’s right. Chocolate bars, pizzas, and all washed down with litres of soft drink', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2hard/That%27s%20right.%20Chocolate%20bars%2C%20pizzas%2C%20and%20all%20washed%20down%20with%20litres%20of%20soft%20drink.mp3'),
    (7, 'Q3', 'And with all the sugar in soft drink,', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2hard/And%20with%20all%20the%20sugar%20in%20soft%20drink%2C.mp3'),
    (7, 'Q4', 'I think we can say you''re definitely overindulging, don''t you think', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2hard/I%20think%20we%20can%20say%20you%27re%20definitely%20overindulging%2C%20don%27t%20you%20think.mp3'),
    (7, 'Q5', 'I intend to definitely stop drinking that from now on', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2hard/I%20intend%20to%20definitely%20stop%20drinking%20that%20from%20now%20on.mp3'),
    (7, 'Q6', 'And that''s part of the sensible eating plan that we have agreed we need to formulate', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2hard/And%20that%27s%20part%20of%20the%20sensible%20eating%20plan%20that%20we%20have%20agreed%20we%20need%20to%20formulate.mp3'),
    (7, 'Q7', 'one that we can both follow', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2hard/one%20that%20we%20can%20both%20follow.mp3'),
    (7, 'Q8', 'That’s right, sensible, and practical', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2hard/That%27s%20right%2C%20sensible%2C%20and%20practical.mp3'),
    (7, 'Q9', 'allowing us to indulge in some sweet foods on occasions', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2hard/allowing%20us%20to%20indulge%20in%20some%20sweet%20foods%20on%20occasions.mp3'),
    (7, 'Q10', 'On rare occasions', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic2hard/On%20rare%20occasions.mp3'),

    -- Nhập dữ liệu cho Topic 3 - Hard
    (8, 'Q1', 'Hey, do you know any good places to eat around here', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3hard/Hey%2C%20do%20you%20know%20any%20good%20places%20to%20eat%20around%20here.mp3'),
    (8, 'Q2', 'Actually, there''s a fantastic Italian restaurant just two blocks away', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3hard/Actually%2C%20there%27s%20a%20fantastic%20Italian%20restaurant%20just%20two%20blocks%20away.mp3'),
    (8, 'Q3', 'It''s called The Golden Olive', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3hard/It%27s%20called%20The%20Golden%20Olive.mp3'),
    (8, 'Q4', 'Oh, that sounds great', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3hard/Oh%2C%20that%20sounds%20great.mp3'),
    (8, 'Q5', 'Do they have vegetarian options', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3hard/Do%20they%20have%20vegetarian%20options.mp3'),
    (8, 'Q6', 'Yes, they do', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3hard/Yes%2C%20they%20do.mp3'),
    (8, 'Q7', 'My friend Sarah is vegetarian', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3hard/My%20friend%20Sarah%20is%20vegetarian.mp3'),
    (8, 'Q8', 'and she always finds plenty to eat there', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3hard/and%20she%20always%20finds%20plenty%20to%20eat%20there.mp3'),
    (8, 'Q9', 'Perfect. Do I need a reservation', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3hard/Perfect.%20Do%20I%20need%20a%20reservation.mp3'),
    (8, 'Q10', 'I would recommend it', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic3hard/I%20would%20recommend%20it.mp3'),

    -- Nhập dữ liệu cho Topic 4 - Hard
    (9, 'Q1', 'Good morning, everyone', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4hard/Good%20morning%20everyone.mp3'),
    (9, 'Q2', 'I''ve been invited to talk about my research project into Australian Aboriginal rock paintings', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4hard/I''ve%20been%20invited%20to%20talk%20about%20my%20research%20project%20into%20Australian%20Aboriginal%20rock%20paintings.mp3'),
    (9, 'Q3', 'The Australian Aborigines have recorded both real and symbolic images of their time on rock walls for many thousands of years', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4hard/The%20Australian%20Aborigines%20have%20recorded%20both%20real%20and%20symbolic%20images%20of%20their%20time%20on%20rock%20walls%20for%20many%20thousands%20of%20years.mp3'),
    (9, 'Q4', 'Throughout the long history of this tradition', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4hard/Throughout%20the%20long%20history%20of%20this%20tradition.mp3'),
    (9, 'Q5', 'new images have appeared and new painting styles have developed', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4hard/new%20images%20have%20appeared%20and%20new%20painting%20styles%20have%20developed.mp3'),
    (9, 'Q6', 'And these characteristics can be used to categorise the different artistic styles', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4hard/And%20these%20characteristics%20can%20be%20used%20to%20categorise%20the%20different%20artistic%20styles.mp3'),
    (9, 'Q7', 'Among these are what we call the Dynamic Yam and Modern styles of painting', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4hard/Among%20these%20are%20what%20we%20call%20the%20Dynamic%20Yam%20and%20Modern%20styles%20of%20painting.mp3'),
    (9, 'Q8', 'One of the most significant characteristics of the different styles is the way that humans are depicted in the paintings', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4hard/One%20of%20the%20most%20significant%20characteristics%20of%20the%20different%20styles%20is%20the%20way%20that%20humans%20are%20depicted%20in%20the%20paintings.mp3'),
    (9, 'Q9', 'The more recent paintings show people in static poses', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4hard/The%20more%20recent%20paintings%20show%20people%20in%20static%20poses.mp3'),
    (9, 'Q10', 'But the first human images to dominate rock art paintings over 8000 years ago were full of movement', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic4hard/But%20the%20first%20human%20images%20to%20dominate%20rock%20art%20paintings%20over%208000%20years%20ago%20were%20full%20of%20movement.mp3'),

    -- Nhập dữ liệu cho Topic 5 - Hard
    (10, 'Q1', 'I haven''t seen you for a bit Marie', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5hard/I%20haven''t%20seen%20you%20for%20a%20bit%20Marie.mp3'),
    (10, 'Q2', 'No I''ve been busy with my project', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5hard/No%20I''ve%20been%20busy%20with%20my%20project.mp3'),
    (10, 'Q3', 'You''re making a vegan alternative to eggs aren''t you', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5hard/You%27re%20making%20a%20vegan%20alternative%20to%20eggs%20aren%27t%20you.mp3'),
    (10, 'Q4', 'Something that doesn''t use animal products', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5hard/Something%20that%20doesn''t%20use%20animal%20products.mp3'),
    (10, 'Q5', 'Yes I''m using chickpeas', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5hard/Yes%20I''m%20using%20chickpeas.mp3'),
    (10, 'Q6', 'I had two main aims when I first started looking for an alternative to eggs', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5hard/I%20had%20two%20main%20aims%20when%20I%20first%20started%20looking%20for%20an%20alternative%20to%20eggs.mp3'),
    (10, 'Q7', 'but actually I''ve found chickpeas have got more advantages', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5hard/but%20actually%20I''ve%20found%20chickpeas%20have%20got%20more%20advantages.mp3'),
    (10, 'Q8', 'But how about your project on reusing waste food', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5hard/But%20how%20about%20your%20project%20on%20reusing%20waste%20food.mp3'),
    (10, 'Q9', 'You were looking at bread weren''t you', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5hard/You%20were%20looking%20at%20bread%20weren%27t%20you.mp3'),
    (10, 'Q10', 'Yes It''s been hard work but I''ve enjoyed it', 'https://raw.githubusercontent.com/Phamlong2675/Python-Project/refs/heads/main/Audio/Topic5hard/Yes%20It''s%20been%20hard%20work%20but%20I''ve%20enjoyed%20it.mp3');
