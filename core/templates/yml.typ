#import "template.typ": resume, header, resume_heading, edu_item, exp_item, project_item, skill_item

#let render_point(p) = {
  if type(p) == str {
    let clean = p.replace("\\@", "@").replace("@", "\\@").replace("<", "\\<")
    eval(clean, mode: "markup")
  } else {
    p
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
  resume_heading[Experience]
  for exp in d {
    let pts = exp.points.map(render_point)
    exp_item(
      role: exp.role,
      name: exp.name,
      location: exp.location,
      date: exp.date,
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
      date: proj.date,
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
      date: edu.date
    )
  }
}

#let yml_resume(data) = {
  show: resume

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
