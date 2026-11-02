#import "template.typ": resume, header, resume_heading, edu_item, exp_item, project_item, skill_item

#let render_point(p) = {
  if type(p) == str {
    let clean = p.replace("\\@", "@").replace("@", "\\@").replace("<", "\\<")
    eval(clean, mode: "markup")
  } else {
    p
  }
}

#let format_date(d) = {
  if type(d) == str {
    d.replace(" -- ", " - ").replace("--", "-")
  } else {
    d
  }
}

#let yml_personal(d) = {
  header(
    name: d.at("name", default: ""),
    target_title: d.at("target_title", default: ""),
    location: d.at("location", default: ""),
    phone: d.at("phone", default: ""),
    email: d.at("email", default: ""),
    linkedin: d.at("linkedin", default: ""),
    site: d.at("site", default: "")
  )
}

#let yml_skills(d) = {
  resume_heading[Technical Skills]
  for skill in d {
    skill_item(
      category: skill.category,
      skills: skill.skills
    )
  }
}

#let yml_experience(d) = {
  resume_heading[Work Experience]
  for exp in d {
    let pts = exp.points.map(render_point)
    exp_item(
      role: exp.role,
      name: exp.name,
      location: exp.location,
      date: format_date(exp.date),
      ..pts
    )
  }
}

#let yml_projects(d) = {
  resume_heading[Projects]
  for proj in d {
    let pts = proj.points.map(render_point)
    project_item(
      name: proj.name,
      skills: proj.at("skills", default: ""),
      link_url: proj.at("link_url", default: ""),
      ..pts
    )
  }
}

#let yml_leadership(d) = {
  resume_heading[Leadership & Activities]
  let pts = d.map(render_point)
  set block(above: 0.45em, below: 0em)
  pad(left: 0.8em, right: 0.4em, list(..pts))
}

#let yml_education(d) = {
  resume_heading[Education]
  for edu in d {
    edu_item(
      name: edu.name,
      degree: edu.degree,
      location: edu.location,
      date: format_date(edu.date)
    )
  }
}

#let yml_resume(
  data,
  line_gap: none,
  section_gap: none,
  header_gap: none
) = {
  let sp = data.at("spacing", default: (:))
  let lg = if line_gap != none {
    line_gap
  } else if "line_gap" in sp {
    eval(sp.line_gap)
  } else {
    0.70em
  }

  let sg = if section_gap != none {
    section_gap
  } else if "section_gap" in sp {
    eval(sp.section_gap)
  } else {
    0.90em
  }

  let hg = if header_gap != none {
    header_gap
  } else if "header_gap" in sp {
    eval(sp.header_gap)
  } else {
    1.30em
  }

  show: resume.with(line_gap: lg, section_gap: sg, header_gap: hg)

  let has_experience = "experience" in data and data.experience != none and data.experience.len() > 0

  yml_personal(data.personal)
  if has_experience {
    yml_experience(data.experience)
    if "projects" in data { yml_projects(data.projects) }
    if "skills" in data { yml_skills(data.skills) }
  } else {
    if "skills" in data { yml_skills(data.skills) }
    if "projects" in data { yml_projects(data.projects) }
  }
  if "leadership" in data { yml_leadership(data.leadership) }
  if "education" in data { yml_education(data.education) }
}
