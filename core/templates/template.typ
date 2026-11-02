// NNJR-Engine: Single-Column ATS Typst Template
// Adapted from tzx/NNJR with collision-free grids, native padding, and clean F-pattern typography

// Master line gap: controls intra-item leading, list bullet spacing, and skill row gaps all at once
#let line_gap = 0.65em

#let resume(body) = {
  set list(indent: 0.8em, spacing: line_gap)
  show list: set text(size: 0.94em)
  show link: underline
  show link: set underline(offset: 2.5pt)

  set page(
    paper: "us-letter",
    margin: 0.5in
  )

  set text(
    size: 9.1pt,
    font: "New Computer Modern",
    fill: rgb("#000000")
  )
  set par(leading: line_gap)

  body
}

#let name_header(name) = {
  set text(size: 2.15em, weight: "bold")
  [#name]
}

#let header(
  name: "",
  target_title: "",
  location: "",
  phone: "",
  email: "",
  linkedin: "",
  site: ""
) = {
  align(center,
    block[
      #name_header(name) \
      #if target_title != "" [
        #v(1pt)
        #text(size: 1.05em, weight: "bold", fill: rgb("#333333"))[#upper(target_title)] \
        #v(1.5pt)
      ]
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
  )
  v(1pt)
}

#let resume_heading(txt) = {
  show heading: set text(size: 0.94em, weight: "regular")

  block[
    #v(2.5pt)
    = #smallcaps(txt)
    #v(-4pt)
    #line(length: 100%, stroke: 0.9pt + black)
    #v(0.5pt)
  ]
}

#let edu_item(
  name: "",
  degree: "",
  location: "",
  date: ""
) = {
  set block(above: 0.45em, below: 0.55em)
  pad(left: 0.8em, right: 0.4em, grid(
    columns: (3.2fr, 1fr),
    align(left)[
      *#name* \
      _#degree _
    ],
    align(right)[
      #date \
      _#location _
    ]
  ))
}

#let exp_item(
  role: "",
  name: "",
  date: "",
  location: "",
  ..points
) = {
  set block(above: 0.45em, below: 0.55em)
  pad(left: 0.8em, right: 0.4em, box[
    #grid(
      columns: (3.2fr, 1fr),
      align(left)[
        *#role* \
        _#name _
      ],
      align(right)[
        #date \
        _#location _
      ]
    )
    #v(line_gap * 0.4)
    #list(..points)
  ])
}

#let project_item(
  name: "",
  skills: "",
  date: "",
  link_url: "",
  ..points
) = {
  set block(above: 0.45em, below: 0.55em)
  pad(left: 0.8em, right: 0.4em, box[
    #if link_url != "" [
      #link(link_url)[*#name*]
    ] else [
      *#name*
    ]
    #if skills != "" [ | _#skills _]
    #h(1fr)
    #date
    #v(line_gap * 0.4)
    #list(..points)
  ])
}

#let skill_item(
  category: "Skills",
  skills: "",
) = {
  set block(above: line_gap)
  set text(size: 0.94em)
  pad(left: 0.8em, right: 0.4em, block[*#category*: #skills])
}
