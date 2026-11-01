// NNJR-Engine: Single-Column ATS Typst Template
// Adapted from tzx/NNJR with collision-free grids, native padding, and clean F-pattern typography

#let resume(body) = {
  set list(indent: 0.8em)
  show list: set text(size: 0.94em)
  show link: underline
  show link: set underline(offset: 2pt)

  set page(
    paper: "us-letter",
    margin: (x: 0.45in, top: 0.35in, bottom: 0.35in)
  )

  set text(
    size: 9.1pt,
    font: "Liberation Sans",
    fill: rgb("#111111")
  )
  set par(leading: 0.42em)

  body
}

#let name_header(name) = {
  set text(size: 1.8em, weight: "bold")
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
  show heading: set text(size: 0.96em, weight: "bold")

  block[
    #v(3pt)
    = #upper(txt)
    #v(-4.5pt)
    #line(length: 100%, stroke: 0.75pt + rgb("#333333"))
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
  pad(left: 0.3em, right: 0.3em, grid(
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
  pad(left: 0.3em, right: 0.3em, box[
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
    #v(0.15em)
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
  pad(left: 0.3em, right: 0.3em, box[
    #if link_url != "" [
      #link(link_url)[*#name*]
    ] else [
      *#name*
    ]
    #if skills != "" [ | _#skills _]
    #h(1fr)
    #date
    #v(0.15em)
    #list(..points)
  ])
}

#let skill_item(
  category: "Skills",
  skills: "",
) = {
  set block(above: 0.4em)
  set text(size: 0.94em)
  pad(left: 0.3em, right: 0.3em, block[*#category*: #skills])
}
