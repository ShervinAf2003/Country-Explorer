-- Run this file inside the `countries` PostgreSQL database.

CREATE TABLE IF NOT EXISTS nameOfCountries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO nameOfCountries (name) VALUES
('Aruba'), ('Afghanistan'), ('Angola'), ('Anguilla'), ('Albania'),
('Andorra'), ('United Arab Emirates'), ('Argentina'), ('Armenia'),
('Australia'), ('Austria'), ('Azerbaijan'), ('Burundi'), ('Belgium'),
('Benin'), ('Brazil'), ('Canada'), ('Switzerland'), ('Chile'), ('China'),
('Cameroon'), ('Colombia'), ('Costa Rica'), ('Cuba'), ('Cyprus'),
('Czech Republic'), ('Germany'), ('Denmark'), ('Dominican Republic'),
('Algeria'), ('Ecuador'), ('Egypt'), ('Spain'), ('Estonia'), ('Ethiopia'),
('Finland'), ('Fiji'), ('France'), ('Gabon'), ('United Kingdom'),
('Georgia'), ('Ghana'), ('Greece'), ('Greenland'), ('Guatemala'),
('Guyana'), ('Hong Kong'), ('Honduras'), ('Croatia'), ('Haiti'),
('Hungary'), ('Indonesia'), ('India'), ('Ireland'), ('Iran'), ('Iraq'),
('Iceland'), ('Israel'), ('Italy'), ('Jamaica'), ('Japan'), ('Jordan'),
('Kazakhstan'), ('Kenya'), ('Kyrgyzstan'), ('Cambodia'), ('South Korea'),
('Kuwait'), ('Laos'), ('Lebanon'), ('Liberia'), ('Libya'), ('Sri Lanka'),
('Lesotho'), ('Lithuania'), ('Luxembourg'), ('Latvia'), ('Morocco'),
('Monaco'), ('Moldova'), ('Madagascar'), ('Maldives'), ('Mexico'),
('Malaysia'), ('Malta'), ('Myanmar'), ('Mongolia'), ('Mozambique'),
('Mauritania'), ('Mauritius'), ('Malawi'), ('Namibia'), ('Nepal'),
('Netherlands'), ('Norway'), ('New Zealand'), ('Oman'), ('Pakistan'),
('Panama'), ('Peru'), ('Philippines'), ('Poland'), ('Portugal'),
('Paraguay'), ('Palestine, State of'), ('Qatar'), ('Romania'), ('Russia'),
('Rwanda'), ('Saudi Arabia'), ('Sudan'), ('Senegal'), ('Singapore'),
('Serbia'), ('Slovakia'), ('Slovenia'), ('Sweden'), ('Switzerland'),
('Syria'), ('Thailand'), ('Tajikistan'), ('Turkmenistan'), ('Timor-Leste'),
('Tunisia'), ('Turkey'), ('Uganda'), ('Ukraine'), ('Uruguay'),
('United States'), ('Uzbekistan'), ('Venezuela'), ('Vietnam'),
('Yemen'), ('South Africa'), ('Zambia'), ('Zimbabwe')
ON CONFLICT (name) DO NOTHING;
