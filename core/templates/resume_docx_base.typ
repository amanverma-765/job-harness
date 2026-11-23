#let resume_doc(d) = {
  set page(
    paper: "us-letter",
    margin: (top: 0.35in, bottom: 0.35in, left: 0.45in, right: 0.45in),
  )
  set text(
    font: "Nimbus Roman",
    size: 8.7pt,
    fill: rgb("#000000"),
  )
  set par(leading: 0.40em)
  set list(indent: 0.4em, spacing: 0.38em)
  show link: set text(fill: rgb("#004f9e"))

  // Header Table
  table(
    columns: 100%,
    stroke: none,
    inset: 0pt,
    align: center,
    [#text(size: 16pt, weight: "bold")[#d.personal.name]],
    [#text(size: 8.7pt)[
      #let p = d.personal
      #let parts = ()
      #if "location" in p and p.location != "" { parts.push(p.location) }
      #if "phone" in p and p.phone != "" {
        parts.push(link("tel:" + p.phone.replace(" ", ""))[#p.phone])
      }
      #if "email" in p and p.email != "" {
        parts.push(link("mailto:" + p.email)[#p.email])
      }
      #if "linkedin" in p and p.linkedin != "" {
        parts.push(link("https://" + p.linkedin)[#p.linkedin])
      }
      #if "site" in p and p.site != "" {
        parts.push(link("https://" + p.site)[#p.site])
      }
      #parts.join("  |  ")
    ]]
  )

  v(1pt)

  // Work Experience
  if "experience" in d [
    == WORK EXPERIENCE

    #for exp in d.experience [
      #table(
        columns: (1fr, auto),
        stroke: none,
        inset: (y: 1pt, x: 0pt),
        align: (left, right),
        [*#exp.role*], [#exp.date],
        [_#exp.name _], [_#exp.location _],
      )
      #for pt in exp.points [
        - #eval(
            pt.replace("\\@", "@").replace("@", "\\@").replace("<", "\\<"),
            mode: "markup",
          )
      ]
    ]
    #v(1pt)
  ]

  // Projects
  if "projects" in d [
    == PROJECTS

    #for proj in d.projects [
      #table(
        columns: (1fr, auto),
        stroke: none,
        inset: (y: 1pt, x: 0pt),
        align: (left, right),
        [
          *#proj.name*
          #if "skills" in proj and proj.skills != "" [ | _#proj.skills _]
        ],
        [
          #if "link_url" in proj and proj.link_url != "" [
            #let label = {
              let l = proj
                .link_url
                .replace("https://", "")
                .replace("http://", "")
                .replace("www.", "")
                .trim()
              if l.ends-with("/") { l = l.slice(0, -1) }
              l
            }
            #link(proj.link_url)[#label]
          ]
        ],
      )
      #for pt in proj.points [
        - #eval(
            pt.replace("\\@", "@").replace("@", "\\@").replace("<", "\\<"),
            mode: "markup",
          )
      ]
    ]
    #v(1pt)
  ]

  // Technical Skills
  if "skills" in d [
    == TECHNICAL SKILLS

    #for sk in d.skills [
      - *#sk.category*: #sk.skills
    ]
    #v(1pt)
  ]

  // Leadership & Activities
  if "leadership" in d [
    == LEADERSHIP & ACTIVITIES

    #for item in d.leadership [
      - #eval(
          item.replace("\\@", "@").replace("@", "\\@").replace("<", "\\<"),
          mode: "markup",
        )
    ]
    #v(1pt)
  ]

  // Education
  if "education" in d [
    == EDUCATION

    #for edu in d.education [
      #table(
        columns: (1fr, auto),
        stroke: none,
        inset: (y: 1pt, x: 0pt),
        align: (left, right),
        [*#edu.name*], [#edu.date],
        [_#edu.degree _], [_#edu.location _],
      )
    ]
  ]
}
