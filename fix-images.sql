-- Führe dieses SQL in Supabase aus um die kaputten Bilder zu reparieren

UPDATE posts SET image_url = 'https://images.unsplash.com/photo-1493894473891-10fc1e5dbd22?auto=format&fit=crop&w=600&q=80'
WHERE title LIKE '%3 Uhr nachts%';

UPDATE posts SET image_url = 'https://images.unsplash.com/photo-1504151932400-72d4384f04b3?auto=format&fit=crop&w=600&q=80'
WHERE title LIKE '%Baby schlaeft nur an der Brust%';

UPDATE posts SET image_url = 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&w=600&q=80'
WHERE title LIKE '%vermisse ich mein altes Leben%';

UPDATE posts SET image_url = 'https://images.unsplash.com/photo-1491013516836-7db643ee125a?auto=format&fit=crop&w=600&q=80'
WHERE title LIKE '%Stillen in der Oeffentlichkeit%';

UPDATE posts SET image_url = 'https://images.unsplash.com/photo-1612531386530-97286d97c2d2?auto=format&fit=crop&w=600&q=80'
WHERE title LIKE '%erste Erk%ltung%';

UPDATE posts SET image_url = 'https://images.unsplash.com/photo-1531983412531-1f49a365ffed?auto=format&fit=crop&w=600&q=80'
WHERE title LIKE '%mit anderen Muettern zu vergleichen%';

UPDATE posts SET image_url = 'https://images.unsplash.com/photo-1516589091380-5d8e87df6999?auto=format&fit=crop&w=600&q=80'
WHERE title LIKE '%Partner-Streit%';
