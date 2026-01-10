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

-- 3. Policy: Jeder kann veroeffentlichte Posts lesen (DROP erst falls existiert)
DROP POLICY IF EXISTS "Jeder kann veroeffentlichte Posts lesen" ON posts;
CREATE POLICY "Jeder kann veroeffentlichte Posts lesen" ON posts
  FOR SELECT USING (published = true);

-- 4. Policy: Authentifizierte User koennen alles (DROP erst falls existiert)
DROP POLICY IF EXISTS "Auth Users haben vollen Zugriff" ON posts;
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
),
(
  'Es ist 3 Uhr nachts und du googelst - Du bist nicht allein',
  'Ich weiss, dass du das hier wahrscheinlich mit einem Auge liest, waehrend dein Baby an dir haengt. Ich weiss, weil ich das hunderte Male getan habe.

Es ist dunkel. Alle schlafen. Nur du bist wach. Und du fragst dich: Ist das normal? Mache ich was falsch? Warum schlaeft mein Baby nicht?

Erstmal: Du machst nichts falsch. Babys wachen nachts auf. Das ist biologisch so vorgesehen. Es ist anstrengend, ja. Aber es ist normal.

Was mir in diesen Naechten geholfen hat:
- Ein Glas Wasser neben dem Bett (Stillen macht durstig)
- Gedimmtes Licht oder eine Salzlampe
- Keine Bildschirme (ausser zum Googlen, ich verstehe)
- Ein gemütliches Stillkissen
- Die Gewissheit: Das geht vorbei

Wenn du das hier um 3 Uhr nachts liest: Du bist eine gute Mama. Du bist da fuer dein Baby, auch wenn es hart ist. Das ist Liebe.

Halt durch. Der Morgen kommt.',
  'Eine Nachricht fuer alle Mamas, die nachts wach sind und sich fragen, ob sie alles richtig machen.',
  'Mama-Alltag',
  'https://images.unsplash.com/photo-1489710437720-ebb67ec84dd2?auto=format&fit=crop&w=600&q=80',
  true,
  false
),
(
  'Mein Baby schlaeft nur an der Brust ein - Ist das schlimm?',
  'Spoiler: Nein. Nein, ist es nicht.

Ich habe so viele Artikel gelesen, die mir erklaert haben, warum das "schlecht" ist. Schlechte Schlafgewohnheiten. Unselbstaendigkeit. Blablabla.

Weisst du was? Mein Sohn ist jetzt 18 Monate. Er hat an der Brust eingeschlafen, seit er geboren wurde. Und er entwickelt sich praechtig. Er ist gluecklich. Er ist sicher.

Das Einschlafen an der Brust ist eine der natuerlichsten Sachen der Welt. Muttermilch enthaelt schlaffördernde Hormone. Dein Baby spuert deine Naehe, hoert deinen Herzschlag. Es fuehlt sich sicher.

Ja, irgendwann werden sie auch anders einschlafen. Das kommt von selbst. Du musst nichts "trainieren".

An alle Mamas, die sich Sorgen machen: Dein Baby braucht dich. Und das ist okay. Das ist sogar wunderschoen.

Geniess diese Momente. Sie gehen schneller vorbei als du denkst.',
  'Warum ich aufgehoert habe, mir Sorgen zu machen, dass mein Baby nur an der Brust einschlaeft.',
  'Stillen',
  'https://images.unsplash.com/photo-1519689680058-324335c77ead?auto=format&fit=crop&w=600&q=80',
  true,
  false
),
(
  'Ich liebe mein Kind, aber manchmal vermisse ich mein altes Leben',
  'Heute muss ich mal ehrlich sein. Richtig ehrlich.

Ich liebe meinen Sohn. Mehr als alles auf der Welt. Aber manchmal, wenn er endlich schlaeft, sitze ich da und denke an frueher.

An Abende mit Freunden, spontan und unbeschwert. An durchgeschlafene Naechte. An Brunch am Wochenende. An Reisen ohne halben Hausrat. An Gespraeche, die nicht unterbrochen werden.

Und dann fuehle ich mich schuldig. Sollte ich nicht einfach nur dankbar sein? Sollte ich nicht jeden Moment geniessen?

Hier ist die Wahrheit: Man kann beides fuehlen. Man kann sein Kind unendlich lieben UND manchmal sein altes Leben vermissen. Das macht dich nicht zu einer schlechten Mutter. Das macht dich zu einem Menschen.

Muttersein ist wunderschoen. Aber es ist auch hart. Und es ist okay, das laut zu sagen.

Du bist nicht allein mit diesen Gefuehlen. Ich bin es auch nicht.',
  'Ueber die Gefuehle, ueber die niemand spricht - und warum sie voellig normal sind.',
  'Mama-Alltag',
  'https://images.unsplash.com/photo-1476703993599-0035a21b17a9?auto=format&fit=crop&w=600&q=80',
  true,
  false
),
(
  'Stillen in der Oeffentlichkeit - Meine Erfahrungen',
  'Das erste Mal habe ich mich im Babyzimmer eines Kaufhauses versteckt. Das zweite Mal auf einer Toilette (nie wieder!). Das dritte Mal mit fuenf Schichten Tuch ueber mir und dem Baby.

Heute? Heute stille ich einfach. Auf der Parkbank. Im Cafe. Ueberall.

Es hat eine Weile gedauert, bis ich so weit war. Der Weg dorthin war nicht einfach. Blicke. Kommentare. Einmal hat mir jemand tatsaechlich gesagt, ich soll doch ins Bad gehen.

Was mir geholfen hat:
- Ein gutes Stilltop (man sieht fast nichts)
- Die Erkenntnis: Ich mache nichts Falsches
- Andere stillende Muetter zu sehen
- Die Gesetze zu kennen (ja, Stillen in der Oeffentlichkeit ist LEGAL)

An alle, die noch unsicher sind: Du darfst ueberall stillen, wo du sein darfst. Dein Baby hat ein Recht darauf, gefuettert zu werden. Wer damit ein Problem hat, kann wegschauen.

Du musst dich nicht verstecken.',
  'Vom Verstecken zum selbstbewussten Stillen - mein Weg und Tipps fuer dich.',
  'Stillen',
  'https://images.unsplash.com/photo-1455732063391-5f50f4df1854?auto=format&fit=crop&w=600&q=80',
  true,
  false
),
(
  'Die erste Erkältung - Als ich dachte, die Welt geht unter',
  'Mein Sohn war 4 Monate alt, als er das erste Mal krank wurde. Eine simple Erkaeltung. Verstopfte Nase, etwas Husten, leichtes Fieber.

Ich habe fast die 112 gerufen.

Im Ernst. Ich war so panisch. Jedes Roecheln, jedes Husten hat mich in Panik versetzt. Ich habe stuendlich Fieber gemessen. Ich habe nicht geschlafen (noch weniger als sonst).

Was ich damals gerne gewusst haette:
- Babys bekommen Erkaeltungen. Das ist normal und wichtig fuer ihr Immunsystem
- Eine verstopfte Nase klingt dramatischer als sie ist
- Muttermilch ist das beste Medikament
- Viel Naehe und Stillen hilft
- Ein Nasensauger ist Gold wert
- Fieber bis 38,5°C ist bei Babys normal

Wann zum Arzt? Bei sehr hohem Fieber, Atemnot, wenn das Baby nicht trinkt, oder wenn dein Bauchgefuehl sagt: Etwas stimmt nicht.

Die Erkaeltung ging vorbei. Mein Sohn hat sie wie ein Champion ueberstanden. Ich... naja, ich habe ueberlebt.',
  'Die Panik beim ersten kranken Baby - und was ich dabei gelernt habe.',
  'Mein Baby',
  'https://images.unsplash.com/photo-1555252333-9f8e92e65df9?auto=format&fit=crop&w=600&q=80',
  true,
  false
),
(
  'Warum ich aufgehoert habe, mich mit anderen Muettern zu vergleichen',
  'Ihr Baby schlaeft durch? Meins wacht alle 2 Stunden auf.
Sie hat nach 6 Wochen ihre Figur zurueck? Ich passe immer noch in nichts.
Ihr Baby kann schon krabbeln? Meins liegt noch rum.

Der Vergleich ist der Tod jeder Freude. Das wusste ich. Aber ich konnte nicht aufhoeren.

Bis mir klar wurde: Ich vergleiche meine Realitaet mit der Inszenierung anderer. Instagram zeigt nicht die Traenen um 3 Uhr nachts. Es zeigt nicht die Zweifel, die Erschoepfung, das Chaos.

Jedes Baby ist anders. Jede Mama ist anders. Jede Familie ist anders. Es gibt keinen Wettbewerb. Es gibt kein "richtig" oder "falsch".

Was mir geholfen hat:
- Social Media Pause (oder zumindest: Entfolgen von allem was mir schlecht gibt)
- Ehrliche Gespraeche mit anderen Muettern
- Mein eigenes Tempo akzeptieren
- Mich auf MEIN Baby konzentrieren

Du bist genug. Genau so wie du bist.',
  'Ueber den toxischen Vergleich unter Muettern - und wie ich mich davon befreit habe.',
  'Mama-Alltag',
  'https://images.unsplash.com/photo-1499996860823-5f82b14e1c98?auto=format&fit=crop&w=600&q=80',
  true,
  false
),
(
  'Partner-Streit nach dem Baby - Was mir keiner gesagt hat',
  'Bevor unser Sohn kam, waren wir das perfekte Paar. Danach? Haben wir uns gestritten wie nie zuvor.

Ueber Windeln. Ueber Schlaf. Ueber wer mehr macht. Ueber wer mueder ist. Ueber absolut alles.

Ich dachte, mit uns stimmt was nicht. Bis ich mit anderen Eltern sprach. Und merkte: Das ist normal. So normal.

Ein Baby veraendert alles. Den Schlaf. Die Prioritaeten. Die Hormone. Da ist weniger Zeit fuer Romantik und mehr Zeit fuer Diskussionen darueber, wer zuletzt aufgestanden ist.

Was uns geholfen hat:
- Offen darueber reden (statt schmollen)
- Anerkennen dass beide am Limit sind
- Keine Buchhaltung fuehren (wer hat was gemacht)
- Kleine Momente zu zweit - auch wenn es nur 10 Minuten Tee trinken ist
- Daran erinnern: Wir sind ein Team

Es wird besser. Es wird anders. Aber ihr muesst zusammen durch diese Phase. Nicht gegeneinander.',
  'Die Wahrheit ueber Beziehungskrisen nach der Geburt - und wie wir sie ueberstanden haben.',
  'Familie',
  'https://images.unsplash.com/photo-1516589178581-6cd7833ae3b2?auto=format&fit=crop&w=600&q=80',
  true,
  false
);

-- 6. Index fuer schnellere Abfragen
CREATE INDEX IF NOT EXISTS posts_published_idx ON posts(published);
CREATE INDEX IF NOT EXISTS posts_created_at_idx ON posts(created_at DESC);

-- 7. MIGRATION: Neue Spalten fuer View-Tracking und SEO (fuer bestehende Datenbanken)
-- Fuehre diese Befehle aus, wenn die Tabelle bereits existiert:
ALTER TABLE posts ADD COLUMN IF NOT EXISTS view_count INTEGER DEFAULT 0;
ALTER TABLE posts ADD COLUMN IF NOT EXISTS seo_title TEXT;
ALTER TABLE posts ADD COLUMN IF NOT EXISTS seo_description TEXT;
ALTER TABLE posts ADD COLUMN IF NOT EXISTS seo_keywords TEXT;

-- 8. Policy: Erlaubt das Erhoehen des View-Counts fuer alle
DROP POLICY IF EXISTS "Jeder kann Views erhoehen" ON posts;
CREATE POLICY "Jeder kann Views erhoehen" ON posts
  FOR UPDATE USING (true)
  WITH CHECK (true);
