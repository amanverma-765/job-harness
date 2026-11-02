// NNJR-Engine: Single-Column ATS Typst Template
// Adapted from tzx/NNJR with collision-free grids, native padding, and clean F-pattern typography

// Master line gap: controls intra-item leading, list bullet spacing, and skill row gaps all at once
#let line_gap = 0.70em

// Master section gap: controls the vertical separation between all major content sections
#let section_gap = 0.90em

// Master header gap: controls vertical separation between the contact line and the first section title
#let header_gap = 1.30em

#let line_gap_state = state("line_gap_state", line_gap)
#let section_gap_state = state("section_gap_state", section_gap)
#let header_gap_state = state("header_gap_state", header_gap)

#let resume(
  line_gap: line_gap,
  section_gap: section_gap,
  header_gap: header_gap,
  body
) = {
  line_gap_state.update(line_gap)
  section_gap_state.update(section_gap)
  header_gap_state.update(header_gap)

  set list(indent: 0.8em, spacing: line_gap)
  show list: set text(size: 0.94em)
  show link: set text(fill: rgb("#004f9e"))

  set page(
    paper: "us-letter",
    margin: 0.5in
  )

  set text(
    size: 9.1pt,
    font: "Nimbus Roman",
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
    block(below: 0em)[
      #name_header(name) \
      #if target_title != "" [
        #v(1pt)
        #text(size: 1.05em, weight: "bold", fill: rgb("#333333"))[#upper(target_title)] \
        #v(1.5pt)
      ]
      #{
        let parts = ()
        if phone != "" {
          let clean_phone = phone.replace(" ", "").replace("-", "")
          parts.push(link("tel:" + clean_phone)[#phone])
        }
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
}

#let is_first_heading = state("is_first_heading", true)
#let is_first_skill = state("is_first_skill", true)

#let resume_heading(txt) = {
  show heading: set text(size: 0.94em, weight: "bold")

  block[
    #context {
      let first = is_first_heading.get()
      let h_gap = header_gap_state.get()
      let s_gap = section_gap_state.get()
      let gap = if first { h_gap } else { s_gap }
      v(gap)
    }
    = #upper(txt)
    #v(-4pt)
    #line(length: 100%, stroke: 0.9pt + black)
    #v(0.5pt)
  ]
  is_first_heading.update(false)
}

#let edu_item(
  name: "",
  degree: "",
  location: "",
  date: ""
) = {
  set block(above: 0.45em, below: 0em)
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
  set block(above: 0.45em, below: 0em)
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
    #context {
      let l_gap = line_gap_state.get()
      v(l_gap * 0.4)
    }
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
  set block(above: 0.45em, below: 0em)
  pad(left: 0.8em, right: 0.4em, box[
    *#name*
    #if skills != "" [ | _#skills _]
    #if link_url != "" [
      #h(1fr)
      #let label = if link_url.contains("github.com") [GitHub] else [Link]
      #link(link_url)[#label]
    ]
    #context {
      let l_gap = line_gap_state.get()
      v(l_gap * 0.4)
    }
    #list(..points)
  ])
}

#let skill_item(
  category: "Skills",
  skills: "",
) = {
  context {
    let first = is_first_skill.get()
    let l_gap = line_gap_state.get()
    let ab = if first { 0.45em } else { l_gap }
    set block(above: ab, below: 0em)
    set text(size: 0.94em)
    pad(left: 0.8em, right: 0.4em, [*#category*: #skills])
  }
  is_first_skill.update(false)
}
