// Typst 1-Page Business Letterhead Template
// Clean single-column layout, 0.8in margins, zero em-dashes, strictly 1 page

#let cover_letter(
  name: "",
  location: "",
  phone: "",
  email: "",
  linkedin: "",
  site: "",
  date_str: "",
  recipient_name: "",
  recipient_title: "",
  company_name: "",
  company_address: "",
  body
) = {
  set page(
    paper: "us-letter",
    margin: (x: 0.8in, top: 0.8in, bottom: 0.8in)
  )
  set text(
    font: "Liberation Sans",
    size: 10pt,
    fill: rgb("#111111"),
    spacing: 120%
  )
  set par(justify: true, leading: 0.65em)

  // Header / Letterhead
  [
    #text(size: 15pt, weight: "bold")[#name] \
    #v(1pt)
    #text(size: 9pt, fill: rgb("#333333"))[
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
    #v(3pt)
    #line(length: 100%, stroke: 0.5pt + rgb("#666666"))
    #v(10pt)

    // Date and Recipient Info
    #text(size: 9.5pt)[
      #date_str \ \
      #if recipient_name != "" [#text(weight: "bold")[#recipient_name] \ ]
      #if recipient_title != "" [#recipient_title \ ]
      #text(weight: "bold")[#company_name] \
      #if company_address != "" [#company_address \ ]
    ]
    #v(12pt)

    #body
  ]
}
