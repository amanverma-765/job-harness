// Jake's Resume Typst Engine - ATS-Optimized Single-Column Standard
// Native Unicode CMap generation, 0 ligature drops, linear text stream extraction

#let resume(body) = {
  set page(
    paper: "us-letter",
    margin: (x: 0.5in, top: 0.4in, bottom: 0.4in)
  )
  set text(
    font: "Liberation Sans",
    size: 9.6pt,
    fill: rgb("#111111"),
    spacing: 110%
  )
  set par(justify: false, leading: 0.52em)
  body
}

// Macro: Header (Centered, clean contact labels, no icon font corruption)
#let header(
  name: "",
  target_title: "",
  location: "",
  phone: "",
  email: "",
  linkedin: "",
  site: ""
) = {
  align(center)[
    #text(size: 16pt, weight: "bold")[#name] \
    #v(1pt)
    #if target_title != "" [
      #text(size: 10.5pt, weight: "bold", fill: rgb("#333333"))[#upper(target_title)] \
      #v(2pt)
    ]
    #text(size: 9pt)[
      #{
        let parts = ()
        if location != "" { parts.push(location) }
        if phone != "" { parts.push(phone) }
        if email != "" { parts.push(link("mailto:" + email)[#email]) }
        if linkedin != "" {
          let clean_li = linkedin.replace("https://", "").replace("http://", "")
          parts.push(link("https://" + clean_li)[#clean_li])
        }
        if site != "" {
          let clean_site = site.replace("https://", "").replace("http://", "")
          parts.push(link("https://" + clean_site)[#clean_site])
        }
        parts.join(" | ")
      }
    ]
  ]
  v(2pt)
}

// Macro: Section Heading with Divider Line
#let resume_heading(title) = {
  v(5pt)
  text(size: 10.5pt, weight: "bold")[#upper(title)]
  v(-3pt)
  line(length: 100%, stroke: 0.5pt + rgb("#555555"))
  v(1pt)
}

// Macro: Education Item
#let edu_item(
  name: "",
  degree: "",
  location: "",
  date: "",
  gpa: ""
) = {
  grid(
    columns: (1fr, auto),
    text(weight: "bold")[#name], text(weight: "medium")[#date],
    text(style: "italic")[#degree], text(style: "italic")[#location]
  )
  if gpa != "" [
    #v(-2pt)
    #text(size: 8.8pt)[Cumulative GPA: #gpa]
  ]
  v(1.5pt)
}

// Macro: Experience Item (Supports arbitrary positional bullet arguments)
#let exp_item(
  role: "",
  name: "",
  location: "",
  date: "",
  ..bullets
) = {
  grid(
    columns: (1fr, auto),
    [#text(weight: "bold")[#role] -- #text(weight: "semibold")[#name]], text(weight: "medium")[#date],
    "", text(style: "italic")[#location]
  )
  v(0.5pt)
  for b in bullets.pos() [
    #list(marker: [•])[#b]
  ]
  v(1.5pt)
}

// Macro: Project Item (Supports arbitrary positional bullet arguments)
#let project_item(
  name: "",
  skills: "",
  date: "",
  link_url: "",
  ..bullets
) = {
  grid(
    columns: (1fr, auto),
    [
      #text(weight: "bold")[#name]
      #if skills != "" [ | #text(style: "italic")[#skills] ]
      #if link_url != "" [ | #link(link_url)[#text(size: 8.5pt)[#link_url]] ]
    ],
    text(weight: "medium")[#date]
  )
  v(0.5pt)
  for b in bullets.pos() [
    #list(marker: [•])[#b]
  ]
  v(1.5pt)
}

// Macro: Technical Skills Item
#let skill_item(
  category: "",
  skills: ""
) = {
  [ *#category:* #skills ]
  v(1.5pt)
}
