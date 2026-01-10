export default async function handler(req, res) {
  // Only allow POST
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { title, content } = req.body;

  if (!title || !content) {
    return res.status(400).json({ error: 'Title and content required' });
  }

  const GROQ_API_KEY = process.env.GROQ_API_KEY;

  if (!GROQ_API_KEY) {
    return res.status(500).json({ error: 'API key not configured' });
  }

  try {
    const response = await fetch('https://api.groq.com/openai/v1/chat/completions', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${GROQ_API_KEY}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        model: 'llama-3.1-70b-versatile',
        messages: [
          {
            role: 'system',
            content: `Du bist ein SEO-Experte fuer deutsche Mama-Blogs.
Generiere SEO-optimierte Inhalte auf Deutsch.
Antworte NUR mit validem JSON im folgenden Format (keine anderen Texte):
{
  "seo_title": "SEO-optimierter Titel (max 60 Zeichen)",
  "seo_description": "Meta-Beschreibung (max 155 Zeichen)",
  "seo_keywords": "keyword1, keyword2, keyword3, keyword4, keyword5",
  "seo_score": 75,
  "suggestions": ["Verbesserungsvorschlag 1", "Verbesserungsvorschlag 2"]
}`
          },
          {
            role: 'user',
            content: `Analysiere diesen Blog-Beitrag und generiere SEO-Inhalte:

Titel: ${title}

Inhalt: ${content.substring(0, 2000)}`
          }
        ],
        temperature: 0.7,
        max_tokens: 500
      })
    });

    if (!response.ok) {
      throw new Error('Groq API request failed');
    }

    const data = await response.json();
    const seoText = data.choices[0].message.content;

    // Parse JSON from response
    let seoData;
    try {
      seoData = JSON.parse(seoText);
    } catch {
      const jsonMatch = seoText.match(/\{[\s\S]*\}/);
      if (jsonMatch) {
        seoData = JSON.parse(jsonMatch[0]);
      } else {
        throw new Error('Invalid JSON response from AI');
      }
    }

    return res.status(200).json(seoData);
  } catch (error) {
    console.error('SEO generation error:', error);
    return res.status(500).json({ error: 'SEO generation failed' });
  }
}
