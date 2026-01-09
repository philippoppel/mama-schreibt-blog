-- Supabase Setup fuer Babsis Mama-Blog
-- Fuehre dieses SQL im Supabase SQL Editor aus

-- 1. Tabelle fuer Blog-Posts erstellen
CREATE TABLE IF NOT EXISTS posts (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  excerpt TEXT,
  category TEXT DEFAULT 'Mama-Alltag',
  image_url TEXT,
  published BOOLEAN DEFAULT false,
  featured BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. RLS (Row Level Security) aktivieren
ALTER TABLE posts ENABLE ROW LEVEL SECURITY;

-- 3. Policy: Jeder kann veroeffentlichte Posts lesen
CREATE POLICY "Jeder kann veroeffentlichte Posts lesen" ON posts
  FOR SELECT USING (published = true);

-- 4. Policy: Authentifizierte User koennen alles
CREATE POLICY "Auth Users haben vollen Zugriff" ON posts
  FOR ALL USING (auth.role() = 'authenticated');

-- 5. Beispiel-Posts einfuegen (optional)
INSERT INTO posts (title, content, excerpt, category, image_url, published, featured) VALUES
(
  'Langzeitstillen - Warum ich mich nicht rechtfertige',
  'Mein Sohn ist jetzt 18 Monate alt und wir stillen immer noch. Die Blicke, die Kommentare, die gut gemeinten Ratschlaege - ich kenne sie alle.

Als ich schwanger war, hatte ich mir vorgenommen: 6 Monate stillen, dann ist Schluss. So hatte ich es ueberall gelesen, so machten es die meisten. Aber dann kam alles anders.

Mein Sohn liebte das Stillen. Und ich? Ich auch. Es war unser Moment, unsere Verbindung. Warum sollte ich das aufgeben, nur weil andere es komisch finden?

Die WHO empfiehlt Stillen bis mindestens 2 Jahre. Das sagt kaum jemand. Stattdessen hoere ich: "Der ist doch schon so gross!" oder "Der kann doch schon essen!"

Ja, er kann essen. Er isst auch. Aber er stillt auch noch. Und das ist okay. Das ist mehr als okay - es ist schoen.

Ich habe aufgehoert, mich zu erklaeren. Wenn jemand fragt, sage ich einfach: "Das passt fuer uns so." Punkt. Keine Rechtfertigung, keine Diskussion.

An alle Mamas die auch laenger stillen: Ihr macht das richtig. Hoert auf euer Gefuehl, nicht auf die Meinungen anderer.',
  'Mein Sohn ist 18 Monate alt und wir stillen immer noch. Ueber Blicke, Kommentare und warum ich meinen Weg gehe.',
  'Stillen',
  'https://images.unsplash.com/photo-1515488042361-ee00e0ddd4e4?auto=format&fit=crop&w=900&q=80',
  true,
  true
),
(
  'Wenn dein Baby dich beim Stillen tritt',
  'Kleine Fuesse, grosse Wirkung. Kennst du das auch? Du stillst ganz friedlich und WUMMS - ein Tritt in den Bauch, ans Kinn, oder noch schlimmer: direkt auf die andere Brust.

Mein Sohn hat eine Phase, in der er beim Stillen turnt. Er dreht sich, er tritt, er zieht an allem was er greifen kann. Manchmal frage ich mich, ob er stillt oder Kung-Fu trainiert.

Was mir hilft:
- Eine Stillkette oder Kette zum Festhalten
- Seine Haende sanft festhalten
- In ruhiger Umgebung stillen (weniger Ablenkung)
- Manchmal einfach kurz absetzen und neu anlegen

Das Wichtigste: Es ist eine Phase. Es geht vorbei. Und ja, es ist okay genervt zu sein. Das macht dich nicht zu einer schlechten Mutter.',
  'Kleine Fuesse, grosse Wirkung. Wie ich damit umgehe, wenn mein Sohn mich beim Stillen kickt.',
  'Stillen',
  'https://images.unsplash.com/photo-1544126592-807ade215a0b?auto=format&fit=crop&w=600&q=80',
  true,
  false
),
(
  'Nein Oma, du kannst nicht einfach vorbeikommen',
  'Ich liebe meine Schwiegermutter. Wirklich. Aber wir mussten ein ernstes Gespraech fuehren.

Am Anfang kam sie einfach vorbei. Ohne Ankuendigung. "Ich wollte nur mal nach dem Kleinen schauen." Klingt lieb, oder? War es auch. Aber es war auch: Ich im Schlafanzug, Wohnung im Chaos, Baby gerade eingeschlafen, ich wollte gerade duschen.

Es hat lange gedauert, bis ich verstanden habe: Grenzen setzen ist nicht boese. Es ist notwendig. Fuer meine Gesundheit, fuer unsere kleine Familie.

Jetzt gilt bei uns:
- Vorher anrufen oder schreiben
- Wir sagen, ob es passt oder nicht
- Wenn es nicht passt, ist das okay
- Besuch ist keine Hilfe, wenn ich dabei Gastgeberin spielen muss

Das Gespraech war schwer. Es gab Traenen (bei beiden). Aber jetzt ist es besser. Viel besser. Und unsere Beziehung ist ehrlicher geworden.',
  'Ueber aufdringliche Familienmitglieder und wie ich gelernt habe, Grenzen zu setzen.',
  'Familie',
  'https://images.unsplash.com/photo-1516627145497-ae6968895b74?auto=format&fit=crop&w=600&q=80',
  true,
  false
),
(
  'Kaffee in der Stillzeit - Was ich gelernt habe',
  'Darf ich? Wie viel? Diese Fragen habe ich mir am Anfang staendig gestellt.

Die kurze Antwort: Ja, du darfst Kaffee trinken. 2-3 Tassen pro Tag sind laut den meisten Experten okay.

Die laengere Antwort: Es kommt auf dein Baby an. Manche Babys reagieren empfindlich auf Koffein, andere merken gar nichts.

Bei uns war es so: Am Anfang war mein Sohn nach meinem Kaffee unruhiger. Also habe ich reduziert. Jetzt mit 18 Monaten merkt er nichts mehr, und ich geniesse wieder meinen Morgenkaffee.

Meine Tipps:
- Direkt nach dem Stillen Kaffee trinken (dann ist am meisten Zeit bis zum naechsten Mal)
- Auf dein Baby achten - ist es unruhiger als sonst?
- Kein Stress - eine Tasse ist wirklich okay
- Entkoffeiniert ist auch eine Option

Und das Wichtigste: Du bist keine schlechte Mutter, weil du Kaffee brauchst. Wir alle brauchen manchmal was, das uns durch den Tag bringt.',
  'Darf ich? Wie viel? Meine ehrlichen Erfahrungen zum Thema Koffein und Stillen.',
  'Mama-Alltag',
  'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&w=600&q=80',
  true,
  false
);

-- 6. Index fuer schnellere Abfragen
CREATE INDEX IF NOT EXISTS posts_published_idx ON posts(published);
CREATE INDEX IF NOT EXISTS posts_created_at_idx ON posts(created_at DESC);
