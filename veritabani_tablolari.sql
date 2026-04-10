-- 1. Veritabanını oluşturma ve içine girme
CREATE DATABASE IF NOT EXISTS EngineeringMentorship;
USE EngineeringMentorship;

-- 2. Şirketler Tablosu (Sektör kısmı artık zorunlu)
CREATE TABLE COMPANIES (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    industry VARCHAR(255) NOT NULL, -- Yıldızlı alan: Boş bırakılamaz
    website_url VARCHAR(255)
);

-- 3. Pozisyonlar Tablosu (Sadece unvan isimleri)
CREATE TABLE POSITIONS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    position_name VARCHAR(255) NOT NULL
);

-- 4. Deneyimler Tablosu (Mülakat soruları opsiyonel)
CREATE TABLE EXPERIENCES (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,              -- Kullanıcı tablosuna bağlı
    company_id INT NOT NULL,           -- Şirket tablosuna bağlı
    position_id INT NOT NULL,          -- Pozisyon tablosuna bağlı
    start_date DATE NOT NULL,
    end_date DATE NULL,                -- Devam eden stajlar için boş kalabilir
    interview_questions TEXT NULL,     -- Soruları hatırlamayanlar için boş kalabilir
    FOREIGN KEY (company_id) REFERENCES COMPANIES(id),
    FOREIGN KEY (position_id) REFERENCES POSITIONS(id)
);

-- 5. Şirket Yorumları ve Puanlama Tablosu
CREATE TABLE COMPANY_REVIEWS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5), -- 1-5 arası puan zorunlu
    is_anonymous TINYINT(1) DEFAULT 0 NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (company_id) REFERENCES COMPANIES(id)
);
